import 'package:flutter/material.dart';
import 'package:live_locator/widgets/map_widget.dart';
import 'package:location/location.dart';
import 'dart:async';
import '../services/location_service.dart';
import '../services/location_update_service.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LocationService _locationService = LocationService();
  final LocationUpdateService _locationUpdateService = LocationUpdateService();
  Timer? _timer;

  LocationData? _locationData;

  @override
  void initState() {
    super.initState();
    _fetchLocation();
    _startLocationUpdates();
  }

  Future<void> _fetchLocation() async {
    LocationData? locationData = await _locationService.getLocation();
    if (locationData != null) {
      await _locationUpdateService.sendLocationToServer(locationData);
    }
    setState(() {
      _locationData = locationData;
    });
  }

// send updated location to server every 2 minutes
  void _startLocationUpdates() {
    _timer = Timer.periodic(Duration(minutes: 2), (timer) async {
      if (_locationData != null) {
        await _locationUpdateService.sendLocationToServer(_locationData!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Locator'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _locationData == null
          ? Center(child: CircularProgressIndicator())
          : MapWidget(locationData: _locationData!),
    );
  }
}
