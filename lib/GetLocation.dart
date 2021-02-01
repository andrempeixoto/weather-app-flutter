import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GetLocation {
  double latitude;
  double longitude;
  String city;

  // Get current location
  Future<void> getCurrentLocation() async {
    try {
      Position position =
          await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;

      city = await getCityName(position.latitude, position.longitude);
    } catch (e) {
      print(e);
    }
  }

  // Get the city name
  Future<String> getCityName(double lat, double lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    print('city name is: ${placemarks[0].locality}');
    return placemarks[0].locality;
  }
}