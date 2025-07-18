import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Data/Response/current.dart';
import 'package:weather_app/Data/Response/forecast_day.dart';
import 'package:weather_app/Data/Response/location.dart';
import 'package:weather_app/Data/Response/weather_response.dart';
import 'package:weather_app/Domain/usecase/forecast_usecase.dart';

class ForecastViewModel extends Cubit<ForecastState> {
  ForecastUseCase useCase;
  ForecastViewModel(this.useCase) : super(ForeCastLoadingState());
  void getForecast(Position position, String date) async {
    emit(ForeCastLoadingState());
    var result = await useCase.invoke(position, date);
    switch (result) {
      case Success<WeatherResponse>():
        {
          emit(ForeCastSuccessState(result.data.forecast!.forecastday,result.data.location,result.data.current));
        }
      case Error<WeatherResponse>():
        {
          emit(ForeCastErrorState(result.errorMsg));
        }
    }
  }
}

sealed class ForecastState {}

class ForeCastLoadingState extends ForecastState {}

class ForeCastSuccessState extends ForecastState {
List<ForecastDay> forecasts;
Location? location;
Current? current;
  ForeCastSuccessState(this.forecasts,this.location,this.current);
}

class ForeCastErrorState extends ForecastState {
  String? errorMsg;
  ForeCastErrorState(this.errorMsg);
}
