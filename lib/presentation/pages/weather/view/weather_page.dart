import 'package:flutter/material.dart';
import 'package:steadfast_task/core/theme/colors.dart';
import 'package:steadfast_task/presentation/pages/weather/bloc/bloc.dart';
import 'package:steadfast_task/presentation/pages/weather/widgets/weather_body.dart';

/// {@template weather_page}
/// A description for WeatherPage
/// {@endtemplate}
class WeatherPage extends StatelessWidget {
  /// {@macro weather_page}
  const WeatherPage({super.key});

  /// The static route for WeatherPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const WeatherPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(),
      child: const Scaffold(
        body: WeatherView(),
      ),
    );
  }
}

/// {@template weather_view}
/// Displays the Body of WeatherView
/// {@endtemplate}
class WeatherView extends StatelessWidget {
  /// {@macro weather_view}
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
      ),
      child: const WeatherBody(),
    );
  }
}
