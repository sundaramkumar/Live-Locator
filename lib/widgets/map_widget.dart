// lib/widgets/map_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class MapWidget extends StatelessWidget {
  final LocationData locationData;

  const MapWidget({Key? key, required this.locationData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(locationData.latitude!, locationData.longitude!),
        minZoom: 10.0,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(locationData.latitude!, locationData.longitude!),
              // builder: (ctx) => Container(
              //   child: Icon(Icons.location_on, color: Colors.red, size: 40),
              // ),
              child: Icon(Icons.location_on, color: Colors.red, size: 40),
            ),
          ],
        ),
      ],
    );
  }
}
