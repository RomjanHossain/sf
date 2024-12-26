part of 'weather_bloc.dart';

/// {@template weather_state}
/// WeatherState description
/// {@endtemplate}
class WeatherState extends Equatable {
  /// {@macro weather_state}
  const WeatherState({
    this.lat = '0.0',
    this.lon = '0.0',
    this.currWeather,
    this.weeklyWeather,
  });

  /// A description for customProperty
  final String lat;
  final String lon;
  final CurrWeatherResp? currWeather;
  final WeeklyWeatherResp? weeklyWeather;

  @override
  List<Object> get props => [
        lat,
        lon,
      ];

  /// Creates a copy of the current WeatherState with property changes
  WeatherState copyWith({
    String? lat,
    String? lon,
    CurrWeatherResp? currWeather,
    WeeklyWeatherResp? weeklyWeather,
  }) {
    return WeatherState(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      weeklyWeather: weeklyWeather ?? this.weeklyWeather,
      currWeather: currWeather ?? this.currWeather,
    );
  }
}

/// {@template weather_initial}
/// The initial state of WeatherState
/// {@endtemplate}
class WeatherInitial extends WeatherState {
  /// {@macro weather_initial}
  const WeatherInitial() : super();
}

class WeatherPermissionFirstDenied extends WeatherState {
  /// {@macro weather_initial}
  const WeatherPermissionFirstDenied() : super();
}
