import 'package:freezed_annotation/freezed_annotation.dart';

// part 'curr_weather_resp.freezed.dart';
part 'curr_weather_resp.g.dart';

@JsonSerializable()
class CurrWeatherResp {
  @JsonKey(name: "coord")
  Coord coord;
  @JsonKey(name: "weather")
  List<Weather> weather;
  @JsonKey(name: "base")
  String base;
  @JsonKey(name: "main")
  Main main;
  @JsonKey(name: "visibility")
  int visibility;
  @JsonKey(name: "wind")
  Wind wind;
  @JsonKey(name: "clouds")
  Clouds clouds;
  @JsonKey(name: "dt")
  int dt;
  @JsonKey(name: "sys")
  Sys sys;
  @JsonKey(name: "timezone")
  int timezone;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "cod")
  int cod;

  CurrWeatherResp({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory CurrWeatherResp.fromJson(Map<String, dynamic> json) =>
      _$CurrWeatherRespFromJson(json);

  Map<String, dynamic> toJson() => _$CurrWeatherRespToJson(this);
}

@JsonSerializable()
class Clouds {
  @JsonKey(name: "all")
  int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}

@JsonSerializable()
class Coord {
  @JsonKey(name: "lon")
  double lon;
  @JsonKey(name: "lat")
  double lat;

  Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);
}

@JsonSerializable()
class Main {
  @JsonKey(name: "temp")
  double temp;
  @JsonKey(name: "feels_like")
  double feelsLike;
  @JsonKey(name: "temp_min")
  double tempMin;
  @JsonKey(name: "temp_max")
  double tempMax;
  @JsonKey(name: "pressure")
  int pressure;
  @JsonKey(name: "humidity")
  int humidity;
  @JsonKey(name: "sea_level")
  int seaLevel;
  @JsonKey(name: "grnd_level")
  int grndLevel;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}

@JsonSerializable()
class Sys {
  @JsonKey(name: "type")
  int type;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "country")
  String country;
  @JsonKey(name: "sunrise")
  int sunrise;
  @JsonKey(name: "sunset")
  int sunset;

  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);
}

@JsonSerializable()
class Weather {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "main")
  String main;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "icon")
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Wind {
  @JsonKey(name: "speed")
  double speed;
  @JsonKey(name: "deg")
  int deg;

  Wind({
    required this.speed,
    required this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);
}
