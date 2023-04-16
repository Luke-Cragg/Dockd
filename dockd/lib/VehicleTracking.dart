import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VehicleTracker extends StatefulWidget {
  const VehicleTracker({Key? key}) : super(key: key);

  @override
  State<VehicleTracker> createState() => _VehicleTrackerState();
}

class _VehicleTrackerState extends State<VehicleTracker> {
  final Completer<GoogleMapController> _controller = Completer();
  static const sourceLocation = LatLng(53.70483490708778, -2.6379833934168437);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            const CameraPosition(target: sourceLocation, zoom: 13.5),
        markers: {
          const Marker(markerId: MarkerId("source"), position: sourceLocation),
        },
        onMapCreated: (mapController) {
          _controller.complete(mapController);
        },
      ),
    );
  }
}
