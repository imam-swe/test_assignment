import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;


class GeoPunchSubmitWidget extends StatefulWidget {
  const GeoPunchSubmitWidget({super.key});

  @override
  _GeoPunchSubmitWidgetState createState() => _GeoPunchSubmitWidgetState();
}

class _GeoPunchSubmitWidgetState extends State<GeoPunchSubmitWidget> {
  late GoogleMapController mapController;
  late Position currentPosition;
  late LatLng akijHouse = const LatLng(23.80183560, 90.34731350);
  late bool showSubmitButton;

  Set<Marker> markers = {};

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      currentPosition = position;
      showSubmitButton =
          Geolocator.distanceBetween(currentPosition.latitude, currentPosition.longitude, akijHouse.latitude, akijHouse.longitude) <= 100;
      markers.add(Marker(
        markerId: const MarkerId('Akij House'),
        position: akijHouse,
        infoWindow: const InfoWindow(title: 'Akij House'),
      ));
      markers.add(Marker(
        markerId: const MarkerId('Current Location'),
        position: LatLng(currentPosition.latitude, currentPosition.longitude),
        infoWindow: const InfoWindow(title: 'Your Location'),
      ));
    });

    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 16.0,
        ),
      ),
    );
  }

  Future<void> _submitPunch() async {
    if (showSubmitButton) {
      var response = await http.post(
        Uri.parse('https://www.akijpipes.com/api/lat-long'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'user_id': '111',
          'lat': currentPosition.latitude,
          'long': currentPosition.longitude,
        }),
      );

      // Handle response accordingly
    } else {
      // Button is not visible
    }
  }

  @override
  void initState() {
    super.initState();
    showSubmitButton = false;
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geo Punch Submit'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            initialCameraPosition: const CameraPosition(
              target: LatLng(0, 0),
              zoom: 16.0,
            ),
            markers: markers,
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Visibility(
              visible: showSubmitButton,
              child: FloatingActionButton(
                onPressed: _submitPunch,
                child: const Icon(Icons.send),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        tooltip: 'Get Location',
        child: const Icon(Icons.location_on),
      ),
    );
  }
}
