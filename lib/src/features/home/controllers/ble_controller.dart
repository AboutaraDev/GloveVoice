import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class BleController extends GetxController {
  FlutterBlue ble = FlutterBlue.instance;
  List<BluetoothDevice> devicesList = []; // To hold the list of devices

  // Stream to hold scan results
  Stream<List<ScanResult>> get scanResults => ble.scanResults;

  // This function will help users to scan nearby BLE devices and get the list of Bluetooth devices.
  Future<void> scanDevices() async {
    if (await Permission.bluetoothScan.request().isGranted) {
      if (await Permission.bluetoothConnect.request().isGranted) {
        // Start scanning
        ble.startScan(timeout: Duration(seconds: 15));

        // Listen to scan results
        ble.scanResults.listen((List<ScanResult> results) {
          for (ScanResult result in results) {
            print("Device found: ${result.device.name}, RSSI: ${result.rssi}");
            // Add device to the list if not already present
            if (!devicesList.contains(result.device)) {
              devicesList.add(result.device);
              // Optionally notify listeners to update the UI
              update();
            }
          }
        });

        print("Scanning started");
      } else {
        print("Bluetooth Connect permission denied");
      }
    } else {
      print("Bluetooth Scan permission denied");
    }
  }

  // This function will help the user connect to a BLE device.
  Future<void> connectToDevice(BluetoothDevice device) async {
    await device.connect(timeout: Duration(seconds: 15));
    device.state.listen((state) {
      if (state == BluetoothDeviceState.connecting) {
        print("Device connecting to: ${device.name}");
      } else if (state == BluetoothDeviceState.connected) {
        print("Device connected: ${device.name}");
      } else {
        print("Device Disconnected");
      }
    });
  }
}
