import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Domain/usecase/current_forecast_usecase.dart';

import '../../Domain/Entities/current.dart';

class CurrentForecastViewModel extends Cubit<CurrentForecastState> {
  CurrentForecastUseCase useCase;
  CurrentForecastViewModel(this.useCase) : super(CurrentForeCastLoadingState());
  void getCurrentForecast(Position position, String date) async {
    emit(CurrentForeCastLoadingState());
    var result = await useCase.invoke(position, date);
    switch (result) {
      case Success<Current>():
        {
          emit(CurrentForeCastSuccessState(result.data));
        }
      case Error<Current>():
        {
          emit(CurrentForeCastErrorState(result.errorMsg));
        }
    }
  }
}

sealed class CurrentForecastState {}

class CurrentForeCastLoadingState extends CurrentForecastState {}

class CurrentForeCastSuccessState extends CurrentForecastState {
  Current? current;
  CurrentForeCastSuccessState(this.current);
}

class CurrentForeCastErrorState extends CurrentForecastState {
  String? errorMsg;
  CurrentForeCastErrorState(this.errorMsg);
}
