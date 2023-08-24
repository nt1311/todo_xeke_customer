import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:todo_xeke_customer/config/constants/app_colors.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  static const LatLng sourceLocation = LatLng(16.459183, 107.5882981);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Chọn điểm đón",
            style: TextStyle(color: grey_4, fontSize: 20),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: grey_4,
            ),
            onPressed: () {
              Get.back();
            },
          )),
      body: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: sourceLocation, zoom: 16)),
    );
  }
}
