package com.example.hackonload.ad;

import android.Manifest;
import android.content.Context;
import android.content.Intent;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.TextView;
import android.widget.ToggleButton;

import com.example.hackonload.ad.app.FallDetectionService;
import com.example.hackonload.ad.app.PreferenceManager;
import com.skyfishjy.library.RippleBackground;

import uk.co.chrisjenx.calligraphy.CalligraphyContextWrapper;

import static com.example.hackonload.ad.app.Activity.launch;

public class MainActivity extends AppCompatActivity implements
        CompoundButton.OnCheckedChangeListener, View.OnClickListener {

    private static final int REQUEST_PERMISSIONS = 4;
    private Context mContext;
    private Button mButtonProfile;
    private ToggleButton mButtonService;
    private RippleBackground mRippleBackground;
    private TextView mTextViewDetect;
    private PreferenceManager mPreferenceManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        initObjects();
        initCallbacks();
        initToggle();
        invalidateService();
        requestForPermissions();
    }

    @Override
    protected void attachBaseContext(Context newBase) {
        super.attachBaseContext( CalligraphyContextWrapper.wrap(newBase));
    }

    @Override
    protected void onResume() {
        super.onResume();

    }


    @Override
    protected void onPause() {
        super.onPause();

    }

    @Override
    public void onClick(View v) {
        if (v == mButtonProfile) launch(mContext, ProfileActivity.class);
    }

    @Override
    public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
        mPreferenceManager.setService(isChecked);
        invalidateService();
    }

    private void initObjects() {
        mButtonProfile = (Button) findViewById(R.id.btn_profile);
        mButtonService = (ToggleButton) findViewById(R.id.toggle_service);
        mRippleBackground = (RippleBackground) findViewById(R.id.ripple_bg);
        mTextViewDetect = (TextView) findViewById(R.id.txt_detect);

        mContext = this;
        mPreferenceManager = new PreferenceManager(mContext);
    }

    private void initCallbacks() {
        mButtonProfile.setOnClickListener(this);
        mButtonService.setOnCheckedChangeListener(this);
    }

    private void initToggle() {
        mButtonService.setChecked(mPreferenceManager.getService());
    }

    private void invalidateService() {
        if (mPreferenceManager.getService()) {
            startService(new Intent(mContext, FallDetectionService.class));
            mTextViewDetect.setTextColor( ContextCompat.getColor(mContext, R.color.accent));
            mTextViewDetect.setText(getString(R.string.txt_detecting));
            mRippleBackground.startRippleAnimation();
        } else {
            stopService(new Intent(mContext, FallDetectionService.class));
            mTextViewDetect.setTextColor(ContextCompat.getColor(mContext, android.R.color.white));
            mTextViewDetect.setText(getString(R.string.txt_enable_detection));
            mRippleBackground.stopRippleAnimation();
        }
    }

    private void requestForPermissions() {
        ActivityCompat.requestPermissions(this,
                new String[]{Manifest.permission.ACCESS_FINE_LOCATION,
                        Manifest.permission.SEND_SMS, Manifest.permission.CALL_PHONE},
                REQUEST_PERMISSIONS);
    }

    @Override
    public void onBackPressed() {
        startActivity( new Intent( MainActivity.this,WelcomeActivity.class ));

    }
}
