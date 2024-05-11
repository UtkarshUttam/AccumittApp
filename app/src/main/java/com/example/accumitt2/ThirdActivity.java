package com.example.accumitt2;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageButton;

public class ThirdActivity extends AppCompatActivity {

    private static final String TAG = "ThirdActivity";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_third);

        // Find the image buttons by their IDs
        ImageButton imageButton31 = findViewById(R.id.imageButton31);
        ImageButton imageButton32 = findViewById(R.id.imageButton32);
        ImageButton imageButton33 = findViewById(R.id.imageButton33);
        ImageButton imageButton34 = findViewById(R.id.imageButton34);

        // Set OnClickListener to the image buttons
        imageButton31.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.d(TAG, "Button 31 clicked");
                // Create an Intent to start FourthActivity
                Intent intent = new Intent(ThirdActivity.this, FourthActivity.class);
                // Start FourthActivity
                startActivity(intent);
            }
        });

        imageButton32.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.d(TAG, "Button 32 clicked");
                // Create an Intent to start SixthActivity
                Intent intent = new Intent(ThirdActivity.this, SixthActivity.class);
                // Start SixthActivity
                startActivity(intent);
            }
        });

        imageButton33.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.d(TAG, "Button 33 clicked");
                // Create an Intent to start SeventhActivity
                Intent intent = new Intent(ThirdActivity.this, SeventhActivity.class);
                // Start SeventhActivity
                startActivity(intent);
            }
        });

        imageButton34.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.d(TAG, "Button 34 clicked");
                // Create an Intent to start FifthActivity
                Intent intent = new Intent(ThirdActivity.this, FifthActivity.class);
                // Start FifthActivity
                startActivity(intent);
            }
        });
    }
}
