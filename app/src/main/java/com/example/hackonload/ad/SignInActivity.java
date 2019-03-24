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
import android.widget.Toast;

import com.example.hackonload.ad.app.PreferenceManager;

import uk.co.chrisjenx.calligraphy.CalligraphyContextWrapper;

public class SignInActivity extends AppCompatActivity
        implements View.OnClickListener {

    private Context mContext;
    private EditText mEditTextPhone, mEditTextPassword;
    private Button mButtonSignIn;

    private PreferenceManager mPreferenceManager;
    private ProgressDialog mProgressDialog;
    String phone_shared,pass_shared;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_in);
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
        if (view == mButtonSignIn) {
            processSignIn();
        }
    }

    private void initObjects() {
        mEditTextPhone = (TextInputEditText) findViewById(R.id.input_phone);
        mEditTextPassword = (TextInputEditText) findViewById(R.id.input_password);
        mButtonSignIn = (Button) findViewById(R.id.btn_sign_in);

        mContext = this;

        mPreferenceManager = new PreferenceManager(mContext);
        mProgressDialog = new ProgressDialog(mContext);
    }

    private void initCallbacks() {
        mButtonSignIn.setOnClickListener(this);
    }

    private void processSignIn() {
        String phone = mEditTextPhone.getText().toString().trim();
        String pass = mEditTextPassword.getText().toString().trim();
        if (validateInput(phone, pass)) {
           // showProgressDialog("Signing in..");
          String phone_shared =  mPreferenceManager.getPhone();
          String pass_shared =   mPreferenceManager.getKeyPassword();

            if( phone.equals( phone_shared ) && pass.equals( pass_shared )){
                showProgressDialog( "Signing in" );
                startActivity(new Intent(SignInActivity.this, MainActivity.class));
                hideProgressDialog();
            }
            else
            {
                Toast.makeText( mContext,"Phone number or password mismatch" ,Toast.LENGTH_SHORT).show();
            }
          }

    }

    private boolean validateInput(String phone, String pass) {
        if (TextUtils.isEmpty(phone)) {
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
