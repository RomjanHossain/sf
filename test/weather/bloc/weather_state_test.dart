// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:steadfast_task/presentation/pages/weather/bloc/bloc.dart';

void main() {
  group('WeatherState', () {
    test('supports value equality', () {
      expect(
        WeatherState(),
        equals(
          const WeatherState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const WeatherState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const weatherState = WeatherState(
            customProperty: 'My property',
          );
          expect(
            weatherState.copyWith(),
            equals(weatherState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const weatherState = WeatherState(
            customProperty: 'My property',
          );
          final otherWeatherState = WeatherState(
            customProperty: 'My property 2',
          );
          expect(weatherState, isNot(equals(otherWeatherState)));

          expect(
            weatherState.copyWith(
              customProperty: otherWeatherState.customProperty,
            ),
            equals(otherWeatherState),
          );
        },
      );
    });
  });
}
