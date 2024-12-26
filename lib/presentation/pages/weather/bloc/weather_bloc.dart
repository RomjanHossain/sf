import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:steadfast_task/data/datasources/local/location.dart';
import 'package:steadfast_task/data/datasources/remote/api_service/weather_service.dart';
import 'package:steadfast_task/data/models/curr_weather_resp.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(const WeatherInitial()) {
    on<CustomWeatherEvent>(_onCustomWeatherEvent);
  }

  FutureOr<void> _onCustomWeatherEvent(
    CustomWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    final permission = await _checkPermission();
    if (!permission) {
      // check if the previous location on the cache
      final location = await LocationServices.instance.getLocationFromCache();
      if (location.lat == '0.0' && location.lon == '0.0') {
        emit(const WeatherPermissionFirstDenied());
        return;
      } else {
        if (state is WeatherPermissionFirstDenied) {
          emit(const WeatherInitial());
        }

        final weatherService = WeatherService();
        final resp = await weatherService.getCurrWeather(
          location.lat,
          location.lon,
        );
        emit(
          state.copyWith(
            lat: location.lat,
            lon: location.lon,
            currWeather: resp,
          ),
        );
      }
    }
    final currLocation = await Geolocator.getCurrentPosition();

    final locationModel = LocationModel(
      lat: currLocation.latitude.toString(),
      lon: currLocation.longitude.toString(),
    );
    final weatherService = WeatherService();
    final resp = await weatherService.getCurrWeather(
      locationModel.lat,
      locationModel.lon,
    );
    if (state is WeatherPermissionFirstDenied) {
      emit(const WeatherInitial());
    }
    emit(
      state.copyWith(
        lat: locationModel.lat,
        lon: locationModel.lon,
        currWeather: resp,
      ),
    );
    // save the location
    await LocationServices.instance.saveLocation(
      locationModel,
    );
  }

  Future<bool> _checkPermission() async {
    final checkPermission = await Geolocator.checkPermission();
    if (checkPermission == LocationPermission.denied) {
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    } else if (checkPermission == LocationPermission.deniedForever) {
      return false;
    } else if (checkPermission == LocationPermission.whileInUse) {
      return true;
    } else if (checkPermission == LocationPermission.always) {
      return true;
    }
    return false;
  }
}
