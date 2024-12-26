import 'package:steadfast_task/core/params/api_constraints.dart';
import 'package:steadfast_task/data/datasources/remote/dio_service/api_key.dart';
import 'package:steadfast_task/data/datasources/remote/dio_service/dio_builder.dart';
import 'package:steadfast_task/data/models/curr_weather_resp.dart';

class WeatherService {
  Future<CurrWeatherResp> getCurrWeather(String lat, String lon) async {
    final dioBuilderResponse = await DioBuilder().buildNonCachedDio();

    final response = await dioBuilderResponse.dio.get(
      /* These are the constant that we have created in api_constants.dart, base url is embedded in the DioBuilder. */
      ApiConstraints.currentWeather(lat, lon, API_KEY),
      options: dioBuilderResponse.dioOptions,
      // data: requestModel.toJson(),
    );
    return CurrWeatherResp.fromJson(response.data as Map<String, dynamic>);
  }
}
