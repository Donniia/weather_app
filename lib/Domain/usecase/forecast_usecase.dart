import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Data/Response/weather_response.dart';
import 'package:weather_app/Domain/repository/forecast_repo.dart';

@injectable
class ForecastUseCase{
  BaseForecastRepository repository;
  @factoryMethod
  ForecastUseCase(this.repository);
  Future<Result<WeatherResponse>> invoke(Position position, String date){
    return repository.getWeatherForecast(position, date);
  }
}