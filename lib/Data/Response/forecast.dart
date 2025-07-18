import 'package:weather_app/Data/Response/forecast_day.dart';

class Forecast {
  Forecast({
    required this.forecastday,
  });

  final List<ForecastDay> forecastday;

  factory Forecast.fromJson(Map<String, dynamic> json){
    return Forecast(
      forecastday: json["forecastday"] == null ? [] : List<ForecastDay>.from(json["forecastday"]!.map((x) => ForecastDay.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "forecastday": forecastday.map((x) => x.toJson()).toList(),
  };

}