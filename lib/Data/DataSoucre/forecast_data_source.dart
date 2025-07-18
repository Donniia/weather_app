import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Data/ApiManager/api.dart';
import 'package:weather_app/Data/Response/weather_response.dart';

abstract class BaseForecastDataSource{
  Future<Result<WeatherResponse>> getWeatherForecast(Position position,String date);
}

@Injectable(as:BaseForecastDataSource )
class ForecastDataSource extends BaseForecastDataSource{
  Api api;
  @factoryMethod
  ForecastDataSource(this.api);
  @override
  Future<Result<WeatherResponse>> getWeatherForecast(Position position,String date) async {
    var result = await api.getWeatherForecast(position, date);
    switch (result) {

      case Success<WeatherResponse>():
      {
        return Success(result.data);
      }
      case Error<WeatherResponse>():
      {
        return Error(result.errorMsg);
      }
    }
  }

}