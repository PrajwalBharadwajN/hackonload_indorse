package com.example.hackonload.ad.app;

import android.content.Context;

import com.android.volley.NetworkResponse;
import com.android.volley.NoConnectionError;
import com.android.volley.VolleyError;
import com.example.hackonload.ad.R;
import com.example.hackonload.ad.SplashActivity;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import static com.example.hackonload.ad.app.Api.KEY_MESSAGE;

public class VolleyErrorHandler {
    public static void handle(Context context, VolleyError volleyError) {
        if (volleyError instanceof NoConnectionError) {
            ToastBuilder.build(context, context.getString( R.string.error_no_internet));
        }

        PreferenceManager preferenceManager = new PreferenceManager(context);

        NetworkResponse networkResponse = volleyError.networkResponse;
        if (networkResponse != null) {
            int statusCode = networkResponse.statusCode;
            String error = new String(networkResponse.data);
            String message = null;
            try {
                JSONObject jsonObject = new JSONObject(error);
                if (jsonObject.has(KEY_MESSAGE)) {
                    message = jsonObject.getString(KEY_MESSAGE);
                } else {
                    for (int i = 0; i < jsonObject.length(); i++) {
                        JSONArray keyArray = new JSONArray(
                                jsonObject.getString(jsonObject.names().getString(i)));
                        message = keyArray.getString(0);
                    }
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }

            switch (statusCode) {
                case 400:
                    if (message != null) {
                        ToastBuilder.build(context, message);
                    }
                    break;
                case 401:
                    if (message != null) {
                        ToastBuilder.build(context, message);
                    }
                    preferenceManager.clearUser();
                    Activity.launchClearStack(context, SplashActivity.class);
                    break;
                case 403:
                    if (message != null) {
                        ToastBuilder.build(context, message);
                    }
                    preferenceManager.clearUser();
                    Activity.launchClearStack(context, SplashActivity.class);
                    break;
                case 404:
                    if (message != null) {
                        ToastBuilder.build(context, message);
                    }
                    break;
                case 405:
                    if (message != null) {
                        ToastBuilder.build(context, message);
                    }
                    break;
                case 422:
                    if (message != null) {
                        ToastBuilder.build(context, message);
                    }
                    break;
                default:
                    ToastBuilder.build(context, context.getString(R.string.error_unexpected));
                    break;
            }
        }
    }
}
