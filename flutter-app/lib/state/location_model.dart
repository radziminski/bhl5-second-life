import 'package:SecondLife/locator.dart';
import 'package:SecondLife/services/location_service.dart';
import 'package:flutter/material.dart';

class LocationModel extends ChangeNotifier {
  final LocationService service = locator<LocationService>();

  Future<Map<String, double>> getLocation() async {
    if (await service.serviceEnabled == null) return null;

    await service.requestPermission();
    return await service.getLocation();
  }
}
