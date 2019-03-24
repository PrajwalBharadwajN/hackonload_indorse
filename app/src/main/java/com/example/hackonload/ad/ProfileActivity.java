package com.example.hackonload.ad;

import android.app.ProgressDialog;
import android.content.Context;
import android.os.Bundle;
import android.support.design.widget.TextInputEditText;
import android.support.v7.app.AppCompatActivity;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.example.hackonload.ad.app.PreferenceManager;

import uk.co.chrisjenx.calligraphy.CalligraphyContextWrapper;

public class ProfileActivity extends AppCompatActivity
        implements View.OnClickListener {

    private Context mContext;
    private EditText mEditTextEmergencyContact1, mEditTextEmergencyContact2,
            mEditTextEmergencyContact3;
    private Button mButtonUpdate, mButtonCancel;
    private PreferenceManager mPreferenceManager;
    private ProgressDialog mProgressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);
        initObjects();
        initCallbacks();
        populateData();
    }

    @Override
    protected void attachBaseContext(Context newBase) {
        super.attachBaseContext(CalligraphyContextWrapper.wrap(newBase));
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
    public void onClick(View view) {
        if (view == mButtonUpdate) {
            processProfile();

        } else if (view == mButtonCancel) {
            finish();
        }
    }

    private void initObjects() {
        mEditTextEmergencyContact1 = (TextInputEditText) findViewById(
                R.id.input_emergency_contact_1);
        mEditTextEmergencyContact2 = (TextInputEditText) findViewById(
                R.id.input_emergency_contact_2);
        mEditTextEmergencyContact3 = (TextInputEditText) findViewById(
                R.id.input_emergency_contact_3);
        mButtonUpdate = (Button) findViewById(R.id.btn_update);
        mButtonCancel = (Button) findViewById(R.id.btn_cancel);

        mContext = this;
        mPreferenceManager = new PreferenceManager(mContext);
        mProgressDialog = new ProgressDialog(mContext);
    }

    private void initCallbacks() {
        mButtonUpdate.setOnClickListener(this);
        mButtonCancel.setOnClickListener(this);
    }

    private void populateData() {
        mEditTextEmergencyContact1.setText(mPreferenceManager.getEmergencyContact1());
        mEditTextEmergencyContact2.setText(mPreferenceManager.getEmergencyContact2());
        mEditTextEmergencyContact3.setText(mPreferenceManager.getEmergencyContact3());
    }

    private void processProfile() {
        String emergencyContact1 = mEditTextEmergencyContact1.getText().toString().trim();
        String emergencyContact2 = mEditTextEmergencyContact2.getText().toString().trim();
        String emergencyContact3 = mEditTextEmergencyContact3.getText().toString().trim();

        if (validateInput(emergencyContact1, emergencyContact2, emergencyContact3)) {
            showProgressDialog("Updating..");
            mPreferenceManager.setEmergencyContact1(emergencyContact1);
            mPreferenceManager.setEmergencyContact2(emergencyContact2);
            mPreferenceManager.setEmergencyContact3(emergencyContact3);
            hideProgressDialog();
            finish();
        }
    }

    private boolean validateInput(String emergencyContact1, String emergencyContact2,
                                  String emergencyContact3) {
        if (TextUtils.isEmpty(emergencyContact1)) {
            mEditTextEmergencyContact1.requestFocus();
            mEditTextEmergencyContact1.setError(getString(R.string.error_empty));
            return false;
        } else if (emergencyContact1.length() < 10) {
            mEditTextEmergencyContact1.requestFocus();
            mEditTextEmergencyContact1.setError(getString(R.string.error_phone_length));
            return false;
        } else if (TextUtils.isEmpty(emergencyContact2)) {
            mEditTextEmergencyContact2.requestFocus();
            mEditTextEmergencyContact2.setError(getString(R.string.error_empty));
            return false;
        } else if (emergencyContact2.length() < 10) {
            mEditTextEmergencyContact2.requestFocus();
            mEditTextEmergencyContact2.setError(getString(R.string.error_phone_length));
            return false;
        } else if (TextUtils.isEmpty(emergencyContact3)) {
            mEditTextEmergencyContact3.requestFocus();
            mEditTextEmergencyContact3.setError(getString(R.string.error_empty));
            return false;
        } else if (emergencyContact3.length() < 10) {
            mEditTextEmergencyContact3.requestFocus();
            mEditTextEmergencyContact3.setError(getString(R.string.error_phone_length));
            return false;
        }
        return true;
    }


    private void showProgressDialog(String message) {
        mProgressDialog.setMessage(message);
        if (!mProgressDialog.isShowing()) {
            mProgressDialog.show();
        }
    }

    private void hideProgressDialog() {
        if (mProgressDialog.isShowing()) {
            mProgressDialog.dismiss();
        }
    }
}
