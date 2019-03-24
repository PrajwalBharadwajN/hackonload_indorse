package com.example.hackonload.ad;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;

import uk.co.chrisjenx.calligraphy.CalligraphyContextWrapper;

public class WelcomeActivity extends AppCompatActivity implements View.OnClickListener {

    private Button mButtonSignIn, mButtonSignUp;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_welcome);
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
            startActivity(new Intent(this, SignInActivity.class));
        } else if (view == mButtonSignUp) {
            startActivity(new Intent(this, SignUpActivity.class));
        }
    }

    private void initObjects() {
        mButtonSignUp = (Button) findViewById(R.id.btn_sign_up);
        mButtonSignIn = (Button) findViewById(R.id.btn_sign_in);


    }

    private void initCallbacks() {
        mButtonSignIn.setOnClickListener(this);
        mButtonSignUp.setOnClickListener(this);
    }
}
