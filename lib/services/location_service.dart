import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<List<String>> getCurrentPosition() async {
    try {
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      if (position != null) {
        String latitude = position.latitude.toString();
        String longitude = position.longitude.toString();

        return [latitude, longitude];
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}
