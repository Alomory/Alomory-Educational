package com.alomory.phonecall;



import static androidx.core.content.PackageManagerCompat.LOG_TAG;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;


import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
 private EditText editText;


 private  Button button;

private static final String  LOG_TAG = "AndroidExample";
 private static final int MY_PERMISSION_REQUEST_CODE_CALL_PHONE= 555;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        this.editText = (EditText) findViewById(R.id.editText_PhoneNumber);
        this.button = (Button) findViewById(R.id.button_call);

        this.button.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view) {
                askPermissionAndCall();
            }


        });

    }
private  void askPermissionAndCall(){
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            int sendPermission = ActivityCompat.checkSelfPermission(this, Manifest.permission.CALL_PHONE);

            if (sendPermission != PackageManager.PERMISSION_GRANTED) {
                this.requestPermissions(new String[]{Manifest.permission.CALL_PHONE}, MY_PERMISSION_REQUEST_CODE_CALL_PHONE);
                return;
            }
        }
        this.callNow();

}
    private void callNow(){
        String phoneNo = this.editText.getText().toString();
        Intent intent = new Intent(Intent.ACTION_CALL);

        intent.setData(Uri.parse("tel:"+phoneNo));
        try {
            this.startActivity(intent);
        }catch (Exception e){
            Toast.makeText(getApplicationContext(), "Call Failed", Toast.LENGTH_LONG).show();
            e.printStackTrace();
        }
    }


    @Override
    public void onRequestPermissionsResult (int requestCode , String permission[], int[] grantResult){
        super.onRequestPermissionsResult(requestCode, permission, grantResult);
        switch (requestCode){
            case MY_PERMISSION_REQUEST_CODE_CALL_PHONE:
                if(grantResult.length > 0 && grantResult[0] == PackageManager.PERMISSION_GRANTED){
                    Log.i(LOG_TAG, "Permission Denied");
                    Toast.makeText(this, "Permission Denied", Toast.LENGTH_LONG).show();
                    this.callNow();
                }else{
                    Log.i(LOG_TAG, "Permission Granted");
                    Toast.makeText(this, "Permission Granted", Toast.LENGTH_LONG).show();
                    this.callNow();
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
}