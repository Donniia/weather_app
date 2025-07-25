import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Domain/Entities/location.dart';
import '../repository/forecast_repo.dart';

@injectable
class LocationUseCase{
  BaseForecastRepository repository;
  LocationUseCase(this.repository);
  Future<Result<Location>> invoke(Position position, String date){
    return repository.getLocationData(position, date);
  }
}