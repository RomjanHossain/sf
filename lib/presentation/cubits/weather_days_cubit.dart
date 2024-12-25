import 'package:bloc/bloc.dart';

enum WeatherDays { today, nextDays }

class WeatherDaysCubit extends Cubit<WeatherDays> {
  WeatherDaysCubit() : super(WeatherDays.today);
  // void showToday() => emit(WeatherDays.today);
  // void showNextDays() => emit(WeatherDays.nextDays);
  void changeWeatherDays(WeatherDays weatherDays) => emit(weatherDays);
}
