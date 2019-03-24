package com.example.hackonload.ad.app;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.os.IBinder;
import android.support.annotation.Nullable;
import android.util.Log;

import com.example.hackonload.ad.FallDetectedActivity;

import static com.example.hackonload.ad.app.Constant.EXTRA_DIRECITON;
import static com.example.hackonload.ad.app.Constant.EXTRA_POS_X;
import static com.example.hackonload.ad.app.Constant.EXTRA_POS_Y;
import static com.example.hackonload.ad.app.Constant.EXTRA_POS_Z;
import static com.example.hackonload.ad.app.Constant.VALUE_BACK;
import static com.example.hackonload.ad.app.Constant.VALUE_FRONT;

public class FallDetectionService extends Service
        implements SensorEventListener {
    private SensorManager mSensorManager;
    private Sensor mSensor;
    private float mXAxis, mYAxis, mZAxis;
    private long mLastKnownTime;

    @Override
    public void onCreate() {
        super.onCreate();
        initObjects();
        prepareObjects();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        mSensorManager.unregisterListener(this, mSensor);
    }

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public void onSensorChanged(SensorEvent sensorEvent) {
        float x = sensorEvent.values[0];
        float y = sensorEvent.values[1];
        float z = sensorEvent.values[2];
        Log.d("x - y - z", x + " " + y + " " + z);
        long currentTime = System.currentTimeMillis();
        if (currentTime - mLastKnownTime > 300) {
            mLastKnownTime = currentTime;
            mXAxis = x;
            mYAxis = y;
            mZAxis = z;
        }
        processSensorEvent(x, y, z);
    }

    @Override
    public void onAccuracyChanged(Sensor sensor, int i) {

    }

    private void initObjects() {
        mSensorManager = (SensorManager) getSystemService( Context.SENSOR_SERVICE);
        mSensor = mSensorManager.getDefaultSensor(1);
    }

    private void prepareObjects() {
        mSensorManager.registerListener(this, mSensor, 3);
    }

    private void processSensorEvent(float x, float y, float z) {
        double fallThreshold = Math.sqrt((double) (((x * x) + (y * y) + (z * z))));
        if (fallThreshold < 1.0f) {
            String direction = mXAxis < x ? VALUE_FRONT : VALUE_BACK;
            startFallDetectedActivity(x, y, z, direction);
        }
    }

    private void startFallDetectedActivity(float x, float y, float z, String direction) {
        Bundle bundle = new Bundle();
        bundle.putFloat(EXTRA_POS_X, x);
        bundle.putFloat(EXTRA_POS_Y, y);
        bundle.putFloat(EXTRA_POS_Z, z);
        bundle.putString(EXTRA_DIRECITON, direction);

        Intent intent = new Intent(this, FallDetectedActivity.class);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        intent.putExtras(bundle);
        startActivity(intent);
    }

}

