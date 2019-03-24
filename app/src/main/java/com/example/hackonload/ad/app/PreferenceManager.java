package com.example.hackonload.ad.app;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Base64;

public class PreferenceManager {
   private static final String PREF_MABO = "mabo";
    private static final String KEY_ID = "id";
    private static final String KEY_NAME = "name";
    private static final String KEY_PHONE = "phone";
    private static final String KEY_EMERGENCY_CONTACT1 = "emergency_contact_1";
    private static final String KEY_EMERGENCY_CONTACT2 = "emergency_contact_2";
    private static final String KEY_EMERGENCY_CONTACT3 = "emergency_contact_3";

   private static final String KEY_TOKEN = "token";
    private static final String KEY_SERVICE = "service";
    private static final String KEY_PASSWORD = "pass";
    private SharedPreferences mPreferencesMabo;

    public  String getKeyPassword() {
        return mPreferencesMabo.getString(encode(KEY_PASSWORD), null);
    }

    public void  setKeyPassword(String pass) {
        mPreferencesMabo.edit().putString(encode(KEY_PASSWORD), pass).apply();
    }


    public PreferenceManager(Context context) {
        mPreferencesMabo = context.getSharedPreferences(PREF_MABO, Context.MODE_PRIVATE);
    }

    public int getId() {
        return mPreferencesMabo.getInt(encode(KEY_ID), -1);
    }

    public void setId(int id) {
        mPreferencesMabo.edit().putInt(encode(KEY_ID), id).apply();
    }

    public String getName() {
        return mPreferencesMabo.getString(encode(KEY_NAME), null);
    }

    public void setName(String firstName) {
        mPreferencesMabo.edit().putString(encode(KEY_NAME), firstName).apply();
    }

    public String getPhone() {
        return mPreferencesMabo.getString(encode(KEY_PHONE), null);
    }

    public void setPhone(String phone) {
        mPreferencesMabo.edit().putString(encode(KEY_PHONE), phone).apply();
    }

    public String getToken() {
        return mPreferencesMabo.getString(encode(KEY_TOKEN), null);
    }

    public void setToken(String token) {
        mPreferencesMabo.edit().putString(encode(KEY_TOKEN), token).apply();
    }

    public String getEmergencyContact1() {
        return mPreferencesMabo.getString(encode(KEY_EMERGENCY_CONTACT1), null);
    }

    public void setEmergencyContact1(String phone) {
        mPreferencesMabo.edit().putString(encode(KEY_EMERGENCY_CONTACT1), phone).apply();
    }

    public String getEmergencyContact2() {
        return mPreferencesMabo.getString(encode(KEY_EMERGENCY_CONTACT2), null);
    }

    public void setEmergencyContact2(String phone) {
        mPreferencesMabo.edit().putString(encode(KEY_EMERGENCY_CONTACT2), phone).apply();
    }

    public String getEmergencyContact3() {
        return mPreferencesMabo.getString(encode(KEY_EMERGENCY_CONTACT3), null);
    }

    public void setEmergencyContact3(String phone) {
        mPreferencesMabo.edit().putString(encode(KEY_EMERGENCY_CONTACT3), phone).apply();
    }


    public boolean getService() {
        return mPreferencesMabo.getBoolean(encode(KEY_SERVICE), true);
    }

    public void setService(boolean service) {
        mPreferencesMabo.edit().putBoolean(encode(KEY_SERVICE), service).apply();
    }

    public void clearUser() {
        mPreferencesMabo.edit().clear().apply();
    }

    private String encode(String data) {
        return Base64.encodeToString(data.getBytes(), Base64.NO_WRAP);
    }
}
