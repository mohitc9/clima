import 'package:geolocator/geolocator.dart';


class Location {
  late double longitude;
  late double latitude;

  Future<void> getCurrentLocation() async {
    try {
      // Get permission
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      // Handle permission
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        longitude = position.longitude;
        latitude = position.latitude;
      }
    } catch (e) {
     print(e);
    }
  }
}