
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Text('           Google Map',
          style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962),
          zoom: 14,
        ),
        markers: {
          Marker(
            markerId: MarkerId('Marker'),
            position: LatLng(37.42796133580664, -122.085749655962),
            infoWindow: InfoWindow(title: 'booking location'),
          ),
        },

      ),
    );
  }
}
