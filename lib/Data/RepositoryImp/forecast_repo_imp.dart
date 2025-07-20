
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Data/DataSoucre/forecast_data_source.dart';
import 'package:weather_app/Domain/Entities/current.dart';
import 'package:weather_app/Domain/Entities/forecast_day.dart';
import 'package:weather_app/Domain/Entities/location.dart';
import 'package:weather_app/Domain/repository/forecast_repo.dart';

@Injectable(as: BaseForecastRepository)
class ForecastRepository extends BaseForecastRepository {
  BaseForecastDataSource dataSource;
  @factoryMethod
  ForecastRepository(this.dataSource);

  @override
  Future<Result<Current>> getCurrentForecast(Position position, String date) {
    return dataSource.getCurrentForecast(position, date);
  }

  @override
  Future<Result<Location>> getLocationData(Position position, String date) {
    return dataSource.getLocationData(position, date);
  }
  @override
  Future<Result<List<ForecastDay>>> getDailyForecast(Position position, String date) {
  return dataSource.getDailyForecast(position, date);
  }
}
