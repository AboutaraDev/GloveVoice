import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';  // Use flutter_blue_plus
import 'package:permission_handler/permission_handler.dart';

class GloveScreen extends StatefulWidget {
  @override
  _GloveScreenState createState() => _GloveScreenState();
}

class _GloveScreenState extends State<GloveScreen> {
  List<BluetoothDevice> devices = [];
  StreamSubscription? scanSubscription;

  @override
  void initState() {
    super.initState();
    _checkPermissionsAndStartScanning();
  }

  Future<void> _checkPermissionsAndStartScanning() async {
    // Request permissions
    var bluetoothStatus = await Permission.bluetooth.request();
    var locationStatus = await Permission.locationWhenInUse.request();

    if (bluetoothStatus.isGranted && locationStatus.isGranted) {
      _startScanning();
    } else {
      debugPrint("Permissions not granted. Cannot scan for BLE devices.");
    }
  }

  void _startScanning() {
    // Check if Bluetooth is on
    FlutterBluePlus.isOn.then((isOn) {
      if (isOn) {
        debugPrint("Bluetooth is ON, starting scan...");
        FlutterBluePlus.startScan(timeout: Duration(seconds: 60));  // Use the class to call startScan

        scanSubscription = FlutterBluePlus.scanResults.listen((results) {
          for (ScanResult result in results) {
            if (!devices.contains(result.device)) {
              setState(() {
                devices.add(result.device);
              });
            }
          }
        });
      } else {
        debugPrint("Bluetooth is OFF. Please enable Bluetooth.");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLE Scanner'),
      ),
      body: devices.isNotEmpty 
        ? ListView.builder(
            itemCount: devices.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(devices[index].name.isNotEmpty ? devices[index].name : "Unknown Device"),
                subtitle: Text(devices[index].id.toString()),
              );
            },
          )
        : Center(child: Text('No Bluetooth devices found')),
    );
  }

  @override
  void dispose() {
    scanSubscription?.cancel(); // Stop listening to the scan results
    FlutterBluePlus.stopScan(); // Ensure scan stops when the widget is disposed
    super.dispose();
  }
}
