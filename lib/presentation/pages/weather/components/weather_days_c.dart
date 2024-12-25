import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:steadfast_task/presentation/cubits/weather_days_cubit.dart';
import 'package:steadfast_task/presentation/pages/weather/bloc/bloc.dart';

class WeatherDaysTimeline extends StatelessWidget {
  const WeatherDaysTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherDaysCubit(),
      child: const WeatherDaysTimelineView(),
    );
  }
}

class WeatherDaysTimelineView extends StatelessWidget {
  const WeatherDaysTimelineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WeatherDaysTimelineTitle(),
        Center(
          child: Text(
            'Hello My Frield',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ],
    );
  }
}

class WeatherDaysTimelineTitle extends StatelessWidget {
  const WeatherDaysTimelineTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimeLineTileWidget(
          weather: WeatherDays.today,
          title: 'Today',
        ),
        SizedBox(
          width: 10,
        ),
        TimeLineTileWidget(
          weather: WeatherDays.nextDays,
          title: 'Next Days',
        ),
      ],
    );
  }
}

class TimeLineTileWidget extends StatelessWidget {
  const TimeLineTileWidget({
    required this.weather,
    required this.title,
    super.key,
  });

  final WeatherDays weather;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final weatherCubit =
        context.select((WeatherDaysCubit cubit) => cubit.state);
    return GestureDetector(
      onTap: () {
        if (weather != weatherCubit) {
          context.read<WeatherDaysCubit>().changeWeatherDays(weather);
        }
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: weather == weatherCubit
              ? theme.colorScheme.surface.withOpacity(0.2)
              : theme.colorScheme.primary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        duration: 500.milliseconds,
        child: Text(
          title,
          style: theme.textTheme.titleSmall!.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
