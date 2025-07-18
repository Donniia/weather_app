import 'package:geolocator/geolocator.dart';

import '../../Core/result.dart';
import '../../Data/Response/weather_response.dart';

abstract class BaseForecastRepository{
  Future<Result<WeatherResponse>> getWeatherForecast(Position position,String date);
}