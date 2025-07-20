import 'package:weather_app/Data/Models/condition_model.dart';
import 'package:weather_app/Domain/Entities/day.dart';

class DayModel {
  DayModel({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  final double? maxtempC;
  final double? maxtempF;
  final double? mintempC;
  final double? mintempF;
  final double? avgtempC;
  final double? avgtempF;
  final double? maxwindMph;
  final double? maxwindKph;
  final double? totalprecipMm;
  final double? totalprecipIn;
  final double? totalsnowCm;
  final double? avgvisKm;
  final double? avgvisMiles;
  final int? avghumidity;
  final int? dailyWillItRain;
  final int? dailyChanceOfRain;
  final int? dailyWillItSnow;
  final int? dailyChanceOfSnow;
  final ConditionModel? condition;
  final double? uv;

  factory DayModel.fromJson(Map<String, dynamic> json) {
    return DayModel(
      maxtempC: (json["maxtemp_c"] as num?)?.toDouble(),
      maxtempF: (json["maxtemp_f"] as num?)?.toDouble(),
      mintempC: (json["mintemp_c"] as num?)?.toDouble(),
      mintempF: (json["mintemp_f"] as num?)?.toDouble(),
      avgtempC: (json["avgtemp_c"] as num?)?.toDouble(),
      avgtempF: (json["avgtemp_f"] as num?)?.toDouble(),
      maxwindMph: (json["maxwind_mph"] as num?)?.toDouble(),
      maxwindKph: (json["maxwind_kph"] as num?)?.toDouble(),
      totalprecipMm: (json["totalprecip_mm"] as num?)?.toDouble(),
      totalprecipIn: (json["totalprecip_in"] as num?)?.toDouble(),
      totalsnowCm: (json["totalsnow_cm"] as num?)?.toDouble(),
      avgvisKm: (json["avgvis_km"] as num?)?.toDouble(),
      avgvisMiles: (json["avgvis_miles"] as num?)?.toDouble(),
      avghumidity: json["avghumidity"] as int?,
      dailyWillItRain: json["daily_will_it_rain"] as int?,
      dailyChanceOfRain: json["daily_chance_of_rain"] as int?,
      dailyWillItSnow: json["daily_will_it_snow"] as int?,
      dailyChanceOfSnow: json["daily_chance_of_snow"] as int?,
      condition: json["condition"] == null
          ? null
          : ConditionModel.fromJson(json["condition"]),
      uv: (json["uv"] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    "maxtemp_c": maxtempC,
    "maxtemp_f": maxtempF,
    "mintemp_c": mintempC,
    "mintemp_f": mintempF,
    "avgtemp_c": avgtempC,
    "avgtemp_f": avgtempF,
    "maxwind_mph": maxwindMph,
    "maxwind_kph": maxwindKph,
    "totalprecip_mm": totalprecipMm,
    "totalprecip_in": totalprecipIn,
    "totalsnow_cm": totalsnowCm,
    "avgvis_km": avgvisKm,
    "avgvis_miles": avgvisMiles,
    "avghumidity": avghumidity,
    "daily_will_it_rain": dailyWillItRain,
    "daily_chance_of_rain": dailyChanceOfRain,
    "daily_will_it_snow": dailyWillItSnow,
    "daily_chance_of_snow": dailyChanceOfSnow,
    "condition": condition?.toJson(),
    "uv": uv,
  };

  Day toDomain() {
    return Day(
      maxtempC: maxtempC,
      maxtempF: maxtempF,
      mintempC: mintempC,
      mintempF: mintempF,
      avgtempC: avgtempC,
      avgtempF: avgtempF,
      maxwindMph: maxwindMph,
      maxwindKph: maxwindKph,
      totalprecipMm: totalprecipMm,
      totalprecipIn: totalprecipIn,
      totalsnowCm: totalsnowCm,
      avgvisKm: avgvisKm,
      avgvisMiles: avgvisMiles,
      avghumidity: avghumidity,
      dailyWillItRain: dailyWillItRain,
      dailyChanceOfRain: dailyChanceOfRain,
      dailyWillItSnow: dailyWillItSnow,
      dailyChanceOfSnow: dailyChanceOfSnow,
      condition: condition,
      uv: uv,
    );
  }
}
