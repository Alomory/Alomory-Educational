package com.example.task3;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;

import android.Manifest;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.media.Image;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.telephony.SmsManager;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;


public class MainActivity extends AppCompatActivity {

    public static final String TAG = MainActivity.class.getSimpleName();
    private static final int MY_PERMISSION_REQUEST_CODE_CALL_PHONE= 555;


    private TelephonyManager mTelephonyManager;

    EditText phonenumber,message;

    ImageButton imageButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

//        imageButton  = (ImageButton) findViewById(R.id.phone_icon);
//
//
//        mTelephonyManager = (TelephonyManager) getSystemService(TELEPHONY_SERVICE);
//        if (isTelephonyEnabled()) {
//            Log.d(TAG, "Telephony is enabled");
//            // ToDo: Check for phone permission.
//            // ToDo: Register the PhoneStateListener.
//        } else {
//            Toast.makeText(this,
//                    R.string.telephony_not_enabled,
//                    Toast.LENGTH_LONG).show();
//            Log.d(TAG, String.valueOf(R.string.telephony_not_enabled));
//            // Disable the call button
//
//        }
//
//        imageButton.setOnClickListener(view -> askPermissionAndCall(view));
//
//
        imageButton  = (ImageButton) findViewById(R.id.message_icon);
        phonenumber = (EditText) findViewById(R.id.number_to_call);
         message = (EditText) findViewById(R.id.sms_message);
        imageButton.setOnClickListener(new View.OnClickListener() {

            public void onClick(View view) {
                String number=phonenumber.getText().toString();
                String msg=message.getText().toString();
                try {
                    SmsManager smsManager=SmsManager.getDefault();
                    smsManager.sendTextMessage(number,null,msg,null,null);
                    Toast.makeText(getApplicationContext(),"Message Sent",Toast.LENGTH_LONG).show();
                }catch (Exception e)
                {
                    Toast.makeText(getApplicationContext(),"Some fields is Empty",Toast.LENGTH_LONG).show();
                }
            }
        });

    }

    // check if telephony is enabled
    private boolean isTelephonyEnabled() {
        if (mTelephonyManager != null) {
            if (mTelephonyManager.getSimState() ==
                    TelephonyManager.SIM_STATE_READY) {
                return true;
            }
        }
        return false;
    }


    public void callNumber() {
        TextView editText = (TextView) findViewById(R.id.number_to_call);
        // Use format with "tel:" and phone number to create phoneNumber.
        String phoneNumber = String.format("tel: %s",
                editText.getText().toString());
        // Log the concatenated phone number for dialing.
        Log.d(TAG, getString(R.string.dial_number) + phoneNumber);
        Toast.makeText(this,
                getString(R.string.dial_number) + phoneNumber,
                Toast.LENGTH_LONG).show();
        // Create the intent.
        Intent callIntent = new Intent(Intent.ACTION_CALL);
        // Set the data for the intent as the phone number.
        callIntent.setData(Uri.parse(phoneNumber));
        // If package resolves to an app, send intent.
        if (callIntent.resolveActivity(getPackageManager()) != null) {
            startActivity(callIntent);
        } else {
            Log.e(TAG, "Can't resolve app for ACTION_CALL Intent.");
        }
    }



    public  void askPermissionAndCall(View v){
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            int sendPermission = ActivityCompat.checkSelfPermission(this, android.Manifest.permission.CALL_PHONE);

            if (sendPermission != PackageManager.PERMISSION_GRANTED) {
                this.requestPermissions(new String[]{Manifest.permission.CALL_PHONE}, MY_PERMISSION_REQUEST_CODE_CALL_PHONE);
                return;
            }
        }
        this.callNumber();

    }

    @Override
    public void onRequestPermissionsResult (int requestCode , String permission[], int[] grantResult){
        super.onRequestPermissionsResult(requestCode, permission, grantResult);
        switch (requestCode){
            case MY_PERMISSION_REQUEST_CODE_CALL_PHONE:
                if(grantResult.length > 0 && grantResult[0] == PackageManager.PERMISSION_GRANTED){
                    Log.i(TAG, "Permission Denied");
                    Toast.makeText(this, "Permission Denied", Toast.LENGTH_LONG).show();
                    this.callNumber();
                }else{
                    Log.i(TAG, "Permission Granted");
                    Toast.makeText(this, "Permission Granted", Toast.LENGTH_LONG).show();
                    this.callNumber();
                }
                break;
        }
    }
    @Override
    protected  void onActivityResult(int requestCode, int resultCode , Intent data){
        super.onActivityResult(requestCode, resultCode,data);
        if(requestCode == MY_PERMISSION_REQUEST_CODE_CALL_PHONE){
            if(resultCode == RESULT_OK){
                Toast.makeText(this, "Action Ok", Toast.LENGTH_LONG).show();
            } else if (requestCode == RESULT_CANCELED) {
                Toast.makeText(this, "Action Canceled", Toast.LENGTH_LONG).show();
            }else{
                Toast.makeText(this, "Action Failed", Toast.LENGTH_LONG).show();
            }
        }

    }

//    public void smsSendMessage(View view) {
//        TextView textView = (TextView) findViewById(R.id.number_to_call);
//        // Use format with "smsto:" and phone number to create smsNumber.
//        String smsNumber = String.format("smsto: %s",
//                textView.getText().toString());
//        // Find the sms_message view.
//        EditText smsEditText = (EditText) findViewById(R.id.sms_message);
//        // Get the text of the sms message.
//        String sms = smsEditText.getText().toString();
//        // Create the intent.
//        Intent smsIntent = new Intent(Intent.ACTION_SENDTO);
//        // Set the data for the intent as the phone number.
//        smsIntent.setData(Uri.parse(smsNumber));
//        // Add the message (sms) with the key ("sms_body").
//        smsIntent.putExtra("sms_body", sms);
//        // If package resolves (target app installed), send intent.
//        try {
//            startActivity(smsIntent);
//        } catch (ActivityNotFoundException e) {
//            Log.d(TAG, "Can't resolve app for ACTION_SENDTO Intent");
//            Log.d(TAG, e.toString());
//        }
//
//    }
}