// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:steadfast_task/presentation/pages/weather/bloc/bloc.dart';

void main() {
  group('WeatherBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          WeatherBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final weatherBloc = WeatherBloc();
      expect(weatherBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<WeatherBloc, WeatherState>(
      'CustomWeatherEvent emits nothing',
      build: WeatherBloc.new,
      act: (bloc) => bloc.add(const CustomWeatherEvent()),
      expect: () => <WeatherState>[],
    );
  });
}
