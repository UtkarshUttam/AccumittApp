package com.example.accumitt2;

import androidx.appcompat.app.AppCompatActivity;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Set;
import java.util.UUID;

public class FourthActivity extends AppCompatActivity {

    private static final String TAG = "BluetoothApp";
    private static final UUID UUID_SERIAL_PORT = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB"); // Standard SPP UUID for HC-05

    private BluetoothAdapter bluetoothAdapter;
    private BluetoothDevice bluetoothDevice;
    private BluetoothSocket bluetoothSocket;
    private OutputStream outputStream;
    private boolean isConnected = false;

    private Button connectButton;
    private Button startButton;
    private Button stopButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fourth);

        connectButton = findViewById(R.id.button43);
        startButton = findViewById(R.id.button41);
        stopButton = findViewById(R.id.button42);

        connectButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (!isConnected) {
                    connectToDevice();
                } else {
                    disconnectDevice();
                }
            }
        });

        startButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (isConnected) {
                    sendData("e");
                } else {
                    Toast.makeText(FourthActivity.this, "Please connect to HC-05 first", Toast.LENGTH_SHORT).show();
                }
            }
        });

        stopButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (isConnected) {
                    sendData("o");
                } else {
                    Toast.makeText(FourthActivity.this, "Please connect to HC-05 first", Toast.LENGTH_SHORT).show();
                }
            }
        });

        bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (bluetoothAdapter == null) {
            Toast.makeText(this, "Bluetooth is not supported on this device", Toast.LENGTH_SHORT).show();
            finish();
            return;
        }

        if (!bluetoothAdapter.isEnabled()) {
            Toast.makeText(this, "Please enable Bluetooth", Toast.LENGTH_SHORT).show();
        }
    }

    private void connectToDevice() {
        Set<BluetoothDevice> pairedDevices = bluetoothAdapter.getBondedDevices();
        for (BluetoothDevice device : pairedDevices) {
            if (device.getName().equals("HC-05")) { // Replace "HC-05" with your device's name
                bluetoothDevice = device;
                break;
            }
        }

        if (bluetoothDevice == null) {
            Toast.makeText(this, "HC-05 device not found in paired devices", Toast.LENGTH_SHORT).show();
            return;
        }

        try {
            bluetoothSocket = bluetoothDevice.createRfcommSocketToServiceRecord(UUID_SERIAL_PORT);
            bluetoothSocket.connect();
            outputStream = bluetoothSocket.getOutputStream();
            isConnected = true;
            Toast.makeText(this, "Connected to HC-05", Toast.LENGTH_SHORT).show();
        } catch (IOException e) {
            Log.e(TAG, "Error connecting to HC-05: " + e.getMessage());
            Toast.makeText(this, "Error connecting to HC-05", Toast.LENGTH_SHORT).show();
        }
    }

    private void disconnectDevice() {
        if (bluetoothSocket!= null) {
            try {
                bluetoothSocket.close();
                isConnected = false;
                Toast.makeText(this, "Disconnected from HC-05", Toast.LENGTH_SHORT).show();
            } catch (IOException e) {
                Log.e(TAG, "Error disconnecting from HC-05: " + e.getMessage());
                Toast.makeText(this, "Error disconnecting from HC-05", Toast.LENGTH_SHORT).show();
            }
        }
    }

    private void sendData(String message) {
        try {
            outputStream.write(message.getBytes());
        } catch (IOException e) {
            Log.e(TAG, "Error sending data: " + e.getMessage());
            Toast.makeText(this, "Error sending data", Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (bluetoothSocket!= null) {
            try {
                bluetoothSocket.close();
            } catch (IOException e) {
                Log.e(TAG, "Error closing Bluetooth socket: " + e.getMessage());
            }
        }
    }
}