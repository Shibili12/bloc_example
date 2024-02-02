import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Locationhelper {
  Position? _currentlocation;
  late LocationPermission permission;
  Future<String> getcurrentlocation() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    _currentlocation = await Geolocator.getCurrentPosition();
    final address = await getaddressfromcordinator(
        _currentlocation!.latitude, _currentlocation!.longitude);

    return address;
  }

  Future<String> getaddressfromcordinator(
      double latitude, double longitude) async {
    try {
      print("hi");

      List<Placemark> placemark =
          await placemarkFromCoordinates(latitude, longitude);

      Placemark place = placemark[0];

      var location = "${place.locality},${place.country}";

      return location;
    } catch (e) {
      throw Exception('Failed to get address from coordinates');
    }
  }
}
