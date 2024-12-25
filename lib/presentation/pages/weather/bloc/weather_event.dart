part of 'weather_bloc.dart';

abstract class WeatherEvent  extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_weather_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomWeatherEvent extends WeatherEvent {
  /// {@macro custom_weather_event}
  const CustomWeatherEvent();
}
