package com.example.hackonload.ad;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.TextInputEditText;
import android.support.v7.app.AppCompatActivity;
import android.text.TextUtils;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.example.hackonload.ad.app.PreferenceManager;

import uk.co.chrisjenx.calligraphy.CalligraphyContextWrapper;


public class SignUpActivity extends AppCompatActivity
        implements View.OnClickListener {

    private Context mContext;
    private EditText mEditTextName, mEditTextPhone, mEditTextPassword, mEditTextEmergencyContact1,
            mEditTextEmergencyContact2, mEditTextEmergencyContact3;

    private Button mButtonSignUp;

    private PreferenceManager mPreferenceManager;
    private ProgressDialog mProgressDialog;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_up);
        initObjects();
        initCallbacks();
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
        if (view == mButtonSignUp) {
            processSignUp();

        }
    }

    private void initObjects() {
        mEditTextName =  findViewById(R.id.input_name);
        mEditTextPhone = (TextInputEditText) findViewById(R.id.input_phone);
        mEditTextPassword = (TextInputEditText) findViewById(R.id.input_password);
        mEditTextEmergencyContact1 = (TextInputEditText) findViewById(
                R.id.input_emergency_contact_1);
        mEditTextEmergencyContact2 = (TextInputEditText) findViewById(
                R.id.input_emergency_contact_2);
        mEditTextEmergencyContact3 = (TextInputEditText) findViewById(
                R.id.input_emergency_contact_3);

        mButtonSignUp = (Button) findViewById(R.id.btn_sign_up);

        mContext = this;

        mPreferenceManager = new PreferenceManager(mContext);
        mProgressDialog = new ProgressDialog(mContext);
    }

    private void initCallbacks() {
        mButtonSignUp.setOnClickListener(this);
    }

    private void processSignUp() {

        String name = mEditTextName.getText().toString().trim();
        String phone = mEditTextPhone.getText().toString().trim();
        String pass = mEditTextPassword.getText().toString().trim();
        String emergencyContact1 = mEditTextEmergencyContact1.getText().toString().trim();
        String emergencyContact2 = mEditTextEmergencyContact2.getText().toString().trim();
        String emergencyContact3 = mEditTextEmergencyContact3.getText().toString().trim();

        if (validateInput(name, phone, pass, emergencyContact1, emergencyContact2,
                    emergencyContact3)){
            showProgressDialog( "Signing up" );
            mPreferenceManager.setName(name);
            mPreferenceManager.setPhone(phone);
            mPreferenceManager.setKeyPassword( pass );
            mPreferenceManager.setEmergencyContact1(emergencyContact1);
            mPreferenceManager.setEmergencyContact2(emergencyContact2);
            mPreferenceManager.setEmergencyContact3(emergencyContact3);


            startActivity(new Intent(this, MainActivity.class));
           hideProgressDialog();
        }
    }

    private boolean validateInput(String name, String phone, String pass, String emergencyContact1,
                                  String emergencyContact2, String emergencyContact3) {
        if (TextUtils.isEmpty(name)) {
            mEditTextName.requestFocus();
            mEditTextName.setError(getString(R.string.error_empty));
            return false;
        } else if (TextUtils.isEmpty(phone)) {
            mEditTextPhone.requestFocus();
            mEditTextPhone.setError(getString(R.string.error_empty));
            return false;
        } else if (phone.length() < 10) {
            mEditTextPhone.requestFocus();
            mEditTextPhone.setError(getString(R.string.error_phone_length));
            return false;
        } else if (TextUtils.isEmpty(pass)) {
            mEditTextPassword.requestFocus();
            mEditTextPassword.setError(getString(R.string.error_empty));
            return false;
        } else if (pass.length() < 3) {
            mEditTextPassword.requestFocus();
            mEditTextPassword.setError(getString(R.string.error_pass_length));
            return false;
        } else if (TextUtils.isEmpty(emergencyContact1)) {
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
