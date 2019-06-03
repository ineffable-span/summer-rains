import 'package:geolocator/geolocator.dart';

class Location {
  double longitude, latitude;

  Future<void> getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    longitude = position.longitude;
    latitude = position.latitude;
  }
}
