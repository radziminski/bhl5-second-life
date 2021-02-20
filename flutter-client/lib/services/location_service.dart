import 'package:location/location.dart';
import 'dart:async';

class LocationService {
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  Future<Map<String, double>> getLocation() async {
    if (_permissionGranted != PermissionStatus.granted) {
      await requestPermission();
    }

    if (_serviceEnabled && _permissionGranted == PermissionStatus.granted) {
      LocationData _locationData = await Location().getLocation();
      Map<String, double> retv = {
        'latitude': _locationData.latitude,
        'longitude': _locationData.longitude
      };
      return retv;
    }
    return null;
  }

  Future<bool> get serviceEnabled async {
    if (_serviceEnabled != null) {
      return _serviceEnabled;
    }
    _serviceEnabled = await Location().requestService();
    return _serviceEnabled;
  }

  Future<PermissionStatus> requestPermission() async {
    if (_permissionGranted == PermissionStatus.granted) {
      return _permissionGranted;
    }

    _permissionGranted = await Location().requestPermission();
    return _permissionGranted;
  }
}
