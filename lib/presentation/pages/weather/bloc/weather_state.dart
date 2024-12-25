part of 'weather_bloc.dart';

/// {@template weather_state}
/// WeatherState description
/// {@endtemplate}
class WeatherState extends Equatable {
  /// {@macro weather_state}
  const WeatherState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current WeatherState with property changes
  WeatherState copyWith({
    String? customProperty,
  }) {
    return WeatherState(
      customProperty: customProperty ?? this.customProperty,
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
