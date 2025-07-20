import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Domain/Entities/current.dart';
import 'package:weather_app/Domain/repository/forecast_repo.dart';

@injectable
class CurrentForecastUseCase{
  BaseForecastRepository repository;
  @factoryMethod
  CurrentForecastUseCase(this.repository);
  Future<Result<Current>> invoke(Position position, String date){
    return repository.getCurrentForecast(position, date);
  }
}