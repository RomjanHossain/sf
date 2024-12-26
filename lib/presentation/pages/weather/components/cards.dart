import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:steadfast_task/core/params/extensions.dart';
import 'package:steadfast_task/core/resources/svgs/svgs.dart';
import 'package:steadfast_task/presentation/pages/weather/bloc/bloc.dart';

class ListOfWeather extends StatelessWidget {
  const ListOfWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const WeatherCard();
      },
    );
  }
}

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherState = context.select((WeatherBloc cubit) => cubit.state);
    final currWeather = weatherState.currWeather;
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.3),
            Colors.blue.withOpacity(0.2),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.string(
            WeatherIconos.clouds_fill,
          ),
          CardTemp(
            title: 'Sunrise',
            time: '${currWeather?.sys.sunrise.toTime()} PM',
          ),
          CardTemp(
            title: 'Sunset',
            time: '${currWeather?.sys.sunset.toTime()} PM',
          ),
        ],
      ),
    );
  }
}

class WeatherWindCard extends StatelessWidget {
  const WeatherWindCard({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherState = context.select((WeatherBloc cubit) => cubit.state);
    final currWeather = weatherState.currWeather;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.3),
            Colors.blue.withOpacity(0.2),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.string(
            WeatherIconos.wind_fill,
          ),
          CardTemp(
            title: 'Wind',
            time: '${currWeather?.wind.speed} m/s',
          ),
          CardTemp(
            title: 'Direction',
            time: '${currWeather?.wind.deg} °',
          ),
        ],
      ),
    );
  }
}

class WeatherCloudsCard extends StatelessWidget {
  const WeatherCloudsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherState = context.select((WeatherBloc cubit) => cubit.state);
    final currWeather = weatherState.currWeather;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.3),
            Colors.blue.withOpacity(0.2),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.string(
            WeatherIconos.cloud_fill,
          ),
          CardTemp(
            title: 'Clouds',
            time: '${currWeather?.clouds.all} %',
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}

class CardTemp extends StatelessWidget {
  const CardTemp({
    required this.time,
    required this.title,
    super.key,
  });
  final String time;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          title,
          style: theme.textTheme.bodySmall!.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
        Text(
          time,
          style: theme.textTheme.titleMedium!.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }
}
