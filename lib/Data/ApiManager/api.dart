import 'dart:convert';
import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/Core/result.dart';
import 'package:weather_app/Data/ApiManager/api_endpoints.dart';
import 'package:weather_app/Data/Response/weather_response.dart';
import 'package:http/http.dart' as http;

@singleton
class Api {
  Future<Result<WeatherResponse>> getWeatherForecast(
    Position position,
    String date,
  ) async {
    var url = Uri.https(ApiEndPoints.baseURl, ApiEndPoints.forecastEndpoint, {
      "q": "${position.latitude},${position.longitude}",
      "hour": "24",
      "dt": date,
      "key": ApiEndPoints.apiKey,
    });
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var forecastResponse = WeatherResponse.fromJson(json);
      return Success(forecastResponse);
    }on SocketException {
      return Error("No internet connection. Please check your network.");
    }on HttpException {
      return Error("Couldn't retrieve data. Server error.");
    } on FormatException {
      return Error("Bad response format. Please try again later.");
    }catch (e) {
      return Error("Unexpected error: $e");
    }
  }
}
