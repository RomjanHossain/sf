// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:steadfast_task/presentation/pages/weather/bloc/bloc.dart';

void main() {
  group('WeatherEvent', () {  
    group('CustomWeatherEvent', () {
      test('supports value equality', () {
        expect(
          CustomWeatherEvent(),
          equals(const CustomWeatherEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomWeatherEvent(),
          isNotNull
        );
      });
    });
  });
}
