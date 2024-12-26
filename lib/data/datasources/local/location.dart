import 'package:shared_preferences/shared_preferences.dart';

part 'ilocation.dart';

/// {@template location}
/// Location description
/// {@endtemplate}
class LocationServices implements ILocation {
  const LocationServices._();

  /// {@macro location}
  static const LocationServices instance = LocationServices._();

  @override
  Future<LocationModel> getLocation() async {
    final sharedPref = await SharedPreferences.getInstance();
    final lat = sharedPref.getString('lat') ?? '0.0';
    final lon = sharedPref.getString('lon') ?? '0.0';
    return LocationModel(lat: lat, lon: lon);
  }

  @override
  Future<LocationModel> getLocationFromCache() async {
    final sharedPref = await SharedPreferences.getInstance();
    final lat = sharedPref.getString('lat') ?? '0.0';
    final lon = sharedPref.getString('lon') ?? '0.0';
    return LocationModel(lat: lat, lon: lon);
  }

  @override
  Future<void> saveLocation(LocationModel location) async {
    final sharedPref = await SharedPreferences.getInstance();
    final lat = location.lat;
    final lon = location.lon;
    await sharedPref.setString('lat', lat);
    await sharedPref.setString('lon', lon);
    return;
  }
}
