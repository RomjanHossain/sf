import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:steadfast_task/core/params/extensions.dart';
import 'package:steadfast_task/core/resources/svgs/svgs.dart';
import 'package:steadfast_task/core/theme/colors.dart';
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
    final weatherBloc = context.select((WeatherBloc cubit) => cubit.state);
    final weekly = weatherBloc.weeklyWeather;
    if (weekly == null) {
      return const SizedBox();
    }
    return AnimatedContainer(
      duration: 500.milliseconds,
      child: Column(
        children: [
          const WeatherDaysTimelineTitle(),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: weekly.list.length,
              itemBuilder: (context, index) {
                final currDay = weekly.list[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: WeatherTimelineCard(
                    title: currDay.dt.toDay(),
                    icon: WeatherIconos.sunrise_fill,
                    temperature: currDay.main.temp.toCelsius(),
                    timeW: currDay.dt.toTime2(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherTimelineCard extends StatelessWidget {
  const WeatherTimelineCard({
    required this.title,
    required this.icon,
    required this.temperature,
    required this.timeW,
    super.key,
  });
  final String title;
  final String timeW;
  final String icon;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 25,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.3),
            primaryColor.withOpacity(0.2),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: SvgPicture.string(icon),
          ),
          Text(
            '$temperature °C',
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            timeW,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
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
          style: theme.textTheme.titleMedium!.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
