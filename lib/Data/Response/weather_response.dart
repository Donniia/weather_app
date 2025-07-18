import 'package:weather_app/Data/Response/current.dart';
import 'package:weather_app/Data/Response/forecast.dart';
import 'package:weather_app/Data/Response/location.dart';

class WeatherResponse {
  WeatherResponse({
    required this.location,
    required this.current,
    required this.forecast,
  });

  final Location? location;
  final Current? current;
  final Forecast? forecast;

  factory WeatherResponse.fromJson(Map<String, dynamic> json){
    return WeatherResponse(
      location: json["location"] == null ? null : Location.fromJson(json["location"]),
      current: json["current"] == null ? null : Current.fromJson(json["current"]),
      forecast: json["forecast"] == null ? null : Forecast.fromJson(json["forecast"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
    "current": current?.toJson(),
    "forecast": forecast?.toJson(),
  };

}