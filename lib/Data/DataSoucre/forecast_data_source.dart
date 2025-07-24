import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Data/ApiManager/api.dart';
import 'package:weather_app/Data/Response/weather_response.dart';
import 'package:weather_app/Domain/Entities/forecast_day.dart';
import 'package:weather_app/Domain/Entities/location.dart';
import '../../Domain/Entities/current.dart';

abstract class BaseForecastDataSource {
  Future<Result<Current>> getCurrentForecast(Position position, String date);
  Future<Result<Location>> getLocationData(Position position, String date);
  Future<Result<List<ForecastDay>>> getDailyForecast(
    Position position,
    String date,
  );
}

@Injectable(as: BaseForecastDataSource)
class ForecastDataSource extends BaseForecastDataSource {
  Api api;
  @factoryMethod
  ForecastDataSource(this.api);

  @override
  Future<Result<Current>> getCurrentForecast(
    Position position,
    String date,
  ) async {
    var result = await api.getWeatherForecast(position, date);
    switch (result) {
      case Success<WeatherResponse>():
        {
          return Success(result.data.current!.toDomain());
        }

      case Error<WeatherResponse>():
        {
          return Error(result.errorMsg);
        }
    }
  }

  @override
  Future<Result<Location>> getLocationData(
    Position position,
    String date,
  ) async {
    var result = await api.getWeatherForecast(position, date);
    switch (result) {
      case Success<WeatherResponse>():
        {
          return Success(result.data.location!.toDomain());
        }
      case Error<WeatherResponse>():
        {
          return Error(result.errorMsg);
        }
    }
  }

  @override
  Future<Result<List<ForecastDay>>> getDailyForecast(
    Position position,
    String date,
  ) async {
    var result = await api.getWeatherForecast(position, date);
    switch (result) {
      case Success<WeatherResponse>():
        {
          return Success(
            result.data.forecast!.forecastday
                .map((forecastday) => forecastday.toDomain())
                .toList(),
          );
        }
      case Error<WeatherResponse>():
        {
          return Error(result.errorMsg);
        }
    }
  }
}
