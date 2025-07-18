import 'package:weather_app/Data/Response/astro.dart';
import 'package:weather_app/Data/Response/day.dart';

class ForecastDay {
  ForecastDay({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  final DateTime? date;
  final int? dateEpoch;
  final Day? day;
  final Astro? astro;
  final List<dynamic> hour;

  factory ForecastDay.fromJson(Map<String, dynamic> json){
    return ForecastDay(
      date: DateTime.tryParse(json["date"] ?? ""),
      dateEpoch: json["date_epoch"],
      day: json["day"] == null ? null : Day.fromJson(json["day"]),
      astro: json["astro"] == null ? null : Astro.fromJson(json["astro"]),
      hour: json["hour"] == null ? [] : List<dynamic>.from(json["hour"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    //"date": "${date?.year.toString().padLeft(4'0')}-${date.month.toString().padLeft(2'0')}-${date.day.toString().padLeft(2'0')}",
    "date_epoch": dateEpoch,
    "day": day?.toJson(),
    "astro": astro?.toJson(),
    "hour": hour.map((x) => x).toList(),
  };

}