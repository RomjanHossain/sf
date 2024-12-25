// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:steadfast_task/presentation/pages/weather/weather.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WeatherBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => WeatherBloc(),
          child: MaterialApp(home: WeatherBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
