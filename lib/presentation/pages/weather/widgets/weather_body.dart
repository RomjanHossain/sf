import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:steadfast_task/core/params/extensions.dart';
import 'package:steadfast_task/core/resources/svgs/svgs.dart';
import 'package:steadfast_task/data/datasources/remote/api_service/weather_service.dart';
import 'package:steadfast_task/presentation/pages/weather/bloc/bloc.dart';
import 'package:steadfast_task/presentation/pages/weather/components/cards.dart';
import 'package:steadfast_task/presentation/pages/weather/components/weather_days_c.dart';

/// {@template weather_body}
/// Body of the WeatherPage.
///
/// Add what it does
/// {@endtemplate}
class WeatherBody extends StatelessWidget {
  /// {@macro weather_body}
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherBloc, WeatherState>(
      builder: (context, state) {
        final theme = Theme.of(context);
        final currWeather = state.currWeather;
        if (state is WeatherPermissionFirstDenied || currWeather == null) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Weather Permission Denied',
                style: theme.textTheme.headlineMedium!
                    .copyWith(color: Colors.white),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<WeatherBloc>().add(const CustomWeatherEvent());
                },
                child: const Text('Allow Permission'),
              ),
            ],
          );
        }
        final size = MediaQuery.sizeOf(context);
        return ListView(
          children: [
            SizedBox(
              height: size.height / 10,
            ),
            Text(
              '${currWeather?.name}',
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineLarge!.copyWith(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onPrimary,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.string(WeatherIconos.locationSvg),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Current Location',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            //! Current Wethear with ICNO
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.string(
                  WeatherIconos.sun_cloudy_fill,
                  width: size.width / 2.9,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${currWeather?.main.temp.toCelsius()}°C',
                  style: theme.textTheme.displayLarge!.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 70,
                  ),
                ),
              ],
            ),
            //! current status
            Text(
              '${currWeather?.weather.firstOrNull?.description} - H :${currWeather?.main.tempMax.toCelsius()}°C L : ${currWeather?.main.tempMin.toCelsius()}°C',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const WeatherDaysTimeline(),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
              // child: const ListOfWeather(),
              child: const Column(
                children: [
                  WeatherCard(),
                  WeatherWindCard(),
                  WeatherCloudsCard(),
                ],
              ),
            ),
          ],
        );
      },
      listener: (BuildContext context, WeatherState state) {
        print('Curr state -> $state');
      },
    );
  }
}
