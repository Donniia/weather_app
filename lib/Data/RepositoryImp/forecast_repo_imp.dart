import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Data/DataSoucre/forecast_data_source.dart';
import 'package:weather_app/Data/Response/weather_response.dart';
import 'package:weather_app/Domain/repository/forecast_repo.dart';

@Injectable(as: BaseForecastRepository)
class ForecastRepository extends BaseForecastRepository{
  BaseForecastDataSource dataSource;
  @factoryMethod
  ForecastRepository(this.dataSource);
  @override
  Future<Result<WeatherResponse>> getWeatherForecast(Position position, String date) {
    return dataSource.getWeatherForecast(position, date);
  }

}