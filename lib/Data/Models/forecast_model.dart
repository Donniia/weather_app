import 'package:weather_app/Data/Models/forecast_day_model.dart';
import 'package:weather_app/Domain/Entities/forecast.dart';

class ForecastModel {
  ForecastModel({
    required this.forecastday,
  });

  final List<ForecastDayModel> forecastday;

  factory ForecastModel.fromJson(Map<String, dynamic> json){
    return ForecastModel(
      forecastday: json["forecastday"] == null ? [] : List<ForecastDayModel>.from(json["forecastday"]!.map((x) => ForecastDayModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "forecastday": forecastday.map((x) => x.toJson()).toList(),
  };

  Forecast toDomain(){
    return Forecast(forecastday: forecastday);
  }

}