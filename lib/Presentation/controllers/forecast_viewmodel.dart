import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Domain/Entities/forecast_day.dart';

import '../../Domain/usecase/forecast_usecase.dart';

class DailyForecastViewModel extends Cubit<ForecastState>{
  DailyForecastUseCase useCase;
  DailyForecastViewModel(this.useCase):super(ForecastLoadingState());
  void getDailyForecast(Position position, String date) async{
   var result = await useCase.invoke(position, date);
   switch (result) {

     case Success<List<ForecastDay>>():
    {
      emit(ForecastSuccessState(result.data));
    }
     case Error<List<ForecastDay>>():
      {
        emit(ForecastErrorState(result.errorMsg));
      }
   }
  }

}
sealed class ForecastState{}
class ForecastSuccessState extends ForecastState{
  List<ForecastDay> forecastList;
  ForecastSuccessState(this.forecastList);
}
class ForecastErrorState extends ForecastState{
  String? errorMsg;
  ForecastErrorState(this.errorMsg);
}
class ForecastLoadingState extends ForecastState{}