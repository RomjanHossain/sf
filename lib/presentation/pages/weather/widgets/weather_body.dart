import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:steadfast_task/core/resources/svgs/svgs.dart';
import 'package:steadfast_task/presentation/pages/weather/bloc/bloc.dart';
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
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        final theme = Theme.of(context);
        final size = MediaQuery.sizeOf(context);
        return Column(
          children: [
            Text(
              'Dhaka',
              style: theme.textTheme.headlineMedium!.copyWith(
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
                  style: theme.textTheme.bodySmall!
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
                  '132°C',
                  style: theme.textTheme.displayLarge!.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
            //! current status
            Text(
              'Partly Cloud - H :17°C L : 11°C',
              style: theme.textTheme.bodySmall!.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
            ),
            const WeatherDaysTimeline(),
          ],
        );
      },
    );
  }
}
