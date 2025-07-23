import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Domain/Entities/prediction_data.dart';
import 'package:weather_app/Domain/repository/predict_repo.dart';

class WeatherPredictionViewModel extends Cubit<PredictionState> {
  final PredictRepository repository;

  WeatherPredictionViewModel(this.repository) : super(PredictionInitialState());

  Future<void> getPrediction(PredictionData data) async {


    try {
      final int? prediction = await repository.filterWeatherData(data);


      if (prediction == null) {
        emit(PredictionErrorState("No prediction received"));
      } else if (prediction == 1) {
        emit(PredictionSuitableState("Suitable for playing"));
      } else {
        emit(PredictionNotRecomState("Not Recommended"));
      }
    } catch (e) {

      emit(PredictionErrorState("Error during prediction"));
    }
  }
}


sealed class PredictionState {}

class PredictionSuitableState extends PredictionState {
  String? prediction;
  PredictionSuitableState(this.prediction);
}

class PredictionNotRecomState extends PredictionState {
  String? prediction;
  PredictionNotRecomState(this.prediction);
}

class PredictionErrorState extends PredictionState {
  String? errorMsg;
  PredictionErrorState(this.errorMsg);
}

class PredictionInitialState extends PredictionState {}
