import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:weather_app/Domain/Entities/prediction_data.dart';
import 'package:weather_app/Domain/repository/predict_repo.dart';
import 'package:http/http.dart' as http;

@Injectable(as: PredictRepository)
class PredictRepoImp extends PredictRepository {
  @override
  Future<int?> filterWeatherData(PredictionData data) async {
    List<int> predictData = [];
    if (data.conditionText == "Patchy rain nearby") {
      predictData.add(1);
    } else {
      predictData.add(0);
    }

    if (data.conditionText == "Sunny") {
      predictData.add(1);
    } else {
      predictData.add(0);
    }

    if (data.avgTemp! >= 28) {
      predictData.add(1);
    } else {
      predictData.add(0);
    }
    if (data.avgTemp! <= 28) {
      predictData.add(1);
    } else {
      predictData.add(0);
    }
    if (data.avgHumidity! > 70) {
      predictData.add(1);
    } else {
      predictData.add(0);
    }

    return await getPrediction(predictData);
  }

  @override
  Future<int?> getPrediction(List<int> data) async {
    final url = Uri.parse("http://192.168.8.163:5001/predict");
    final Map<String, dynamic> body = {'features': data};
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );


      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        final prediction = jsonBody['prediction'];
        print("Request body: ${json.encode(body)}");
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");

        if (prediction is List && prediction.isNotEmpty) {
          return prediction.first;
        } else if (prediction is int) {
          return prediction;
        } else {
          print('Unexpected prediction format: $prediction');
          return null;
        }
      } else {
        print('Failed to get prediction');
        return null;
      }
    } catch (e) {
      print('Error in getPrediction: $e');
      return null;
    }
  }
}
