import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class VehicleTracker extends StatefulWidget {
  const VehicleTracker({Key? key}) : super(key: key);

  @override
  State<VehicleTracker> createState() => _VehicleTrackerState();
}

class _VehicleTrackerState extends State<VehicleTracker> {
  final Completer<GoogleMapController> _controller = Completer();
  static const sourceLocation = LatLng(53.70483490708778, -2.6379833934168437);

  LocationData? currentLocation;
  void getCurrentLocation() async {
    Location location = Location();
    GoogleMapController googleMapController = await _controller.future;
    location.getLocation().then((location) {
      currentLocation = location;
    });

    location.onLocationChanged.listen(
      (newloc) {
        currentLocation = newloc;

        googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              zoom: 13.5, target: LatLng(newloc.latitude!, newloc.longitude!)),
        ));
        setState(() {});
      },
    );
  }

  @override
  void initstate() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLocation == null
          ? const Center(child: Text("Loading..."))
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      currentLocation!.latitude!, currentLocation!.longitude!),
                  zoom: 13.5),
              markers: {
                const Marker(
                    markerId: MarkerId("source"), position: sourceLocation),
                Marker(
                    markerId: const MarkerId("CurrentLocation"),
                    position: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!)),
              },
              onMapCreated: (mapController) {
                _controller.complete(mapController);
              },
            ),
    );
  }
}
