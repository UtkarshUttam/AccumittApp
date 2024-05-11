package com.example.accumitt2;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class SecondActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_second);

        // Find the button by its ID
        Button proceedButton = findViewById(R.id.button);

        // Set OnClickListener to the button
        proceedButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Create an Intent to start ThirdActivity
                Intent intent = new Intent(SecondActivity.this, ThirdActivity.class);
                // Start ThirdActivity
                startActivity(intent);
            }
        });
    }
}
