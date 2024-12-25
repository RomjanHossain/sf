import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(const WeatherInitial()) {
    on<CustomWeatherEvent>(_onCustomWeatherEvent);
  }

  FutureOr<void> _onCustomWeatherEvent(
    CustomWeatherEvent event,
    Emitter<WeatherState> emit,
  ) {
    // TODO: Add Logic
  }
}
