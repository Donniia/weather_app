import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Domain/Entities/current.dart';
import 'package:weather_app/Domain/Entities/location.dart';

import '../../Core/result.dart';
import '../../Data/Response/weather_response.dart';
import '../Entities/forecast_day.dart';

abstract class BaseForecastRepository{
  Future<Result<Current>> getCurrentForecast(Position position,String date);
  Future<Result<Location>> getLocationData(Position position,String date);
  Future<Result<List<ForecastDay>>> getDailyForecast(Position position, String date);
}