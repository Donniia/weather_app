import 'package:weather_app/Data/Models/astro_model.dart';
import 'package:weather_app/Data/Models/day_model.dart';
import 'package:weather_app/Domain/Entities/forecast_day.dart';

class ForecastDayModel {
  ForecastDayModel({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  final DateTime? date;
  final int? dateEpoch;
  final DayModel? day;
  final AstroModel? astro;
  final List<dynamic> hour;

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) {
    return ForecastDayModel(
      date: DateTime.tryParse(json["date"] ?? ""),
      dateEpoch: json["date_epoch"],
      day: json["day"] == null ? null : DayModel.fromJson(json["day"]),
      astro: json["astro"] == null ? null : AstroModel.fromJson(json["astro"]),
      hour: json["hour"] == null
          ? []
          : List<dynamic>.from(json["hour"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    //"date": "${date?.year.toString().padLeft(4'0')}-${date.month.toString().padLeft(2'0')}-${date.day.toString().padLeft(2'0')}",
    "date_epoch": dateEpoch,
    "day": day?.toJson(),
    "astro": astro?.toJson(),
    "hour": hour.map((x) => x).toList(),
  };

  ForecastDay toDomain() {
    return ForecastDay(
      date: date,
      dateEpoch: dateEpoch,
      day: day!.toDomain(),
      astro: astro!.toDomain(),
      hour: hour,
    );
  }
}
