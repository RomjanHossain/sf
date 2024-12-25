// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:steadfast_task/presentation/pages/weather/weather.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WeatherPage', () {
    group('route', () {
      test('is routable', () {
        expect(WeatherPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders WeatherView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: WeatherPage()));
      expect(find.byType(WeatherView), findsOneWidget);
    });
  });
}
