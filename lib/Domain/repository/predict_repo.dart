
import 'package:weather_app/Domain/Entities/prediction_data.dart';

abstract class PredictRepository {
  Future<int?>filterWeatherData(PredictionData data);
  Future<int?> getPrediction(List<int> data);
}
