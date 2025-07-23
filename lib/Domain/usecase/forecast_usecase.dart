import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Domain/Entities/forecast_day.dart';

import '../repository/forecast_repo.dart';
@injectable
class DailyForecastUseCase{
  BaseForecastRepository repository;
  @factoryMethod
  DailyForecastUseCase(this.repository);
  Future<Result<List<ForecastDay>>> invoke(Position position,String date){
    return repository.getDailyForecast(position, date);
  }
}