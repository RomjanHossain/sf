/// {@template api_constraints}
/// ApiConstraints description
/// {@endtemplate}
class ApiConstraints {
  const ApiConstraints._();

  /// {@macro api_constraints}
  static const ApiConstraints instance = ApiConstraints._();
  static String currentWeather(String lat, String lon, String apiKey) =>
      'data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';

  static String weeklyWeather(String lat, String lon, String apiKey) =>
      'data/2.5/forecast?lat=$lat&lon=$lon&cnt=7&appid=$apiKey';
}
