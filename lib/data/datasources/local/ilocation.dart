part of 'location.dart';

/// An interface for Location
abstract class ILocation {
  // get location
  Future<LocationModel> getLocation();
  // save location
  Future<void> saveLocation(LocationModel location);
  // get loc from cache
  Future<LocationModel> getLocationFromCache();
}

class LocationModel {
  LocationModel({required this.lat, required this.lon});
  final String lat;
  final String lon;
}
