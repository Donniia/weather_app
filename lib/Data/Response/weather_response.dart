import 'package:weather_app/Data/Models/current_model.dart';
import 'package:weather_app/Data/Models/forecast_model.dart';
import 'package:weather_app/Data/Models/location_model.dart';

class WeatherResponse {
  WeatherResponse({
    required this.location,
    required this.current,
    required this.forecast,
  });

  final LocationModel? location;
  final CurrentModel? current;
  final ForecastModel? forecast;

  factory WeatherResponse.fromJson(Map<String, dynamic> json){
    return WeatherResponse(
      location: json["location"] == null ? null : LocationModel.fromJson(json["location"]),
      current: json["current"] == null ? null : CurrentModel.fromJson(json["current"]),
      forecast: json["forecast"] == null ? null : ForecastModel.fromJson(json["forecast"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
    "current": current?.toJson(),
    "forecast": forecast?.toJson(),
  };

}