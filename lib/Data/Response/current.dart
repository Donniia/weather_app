import 'package:weather_app/Data/Response/condition.dart';

class Current {
  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  final double? lastUpdatedEpoch;
  final String? lastUpdated;
  final double? tempC;
  final double? tempF;
  final int? isDay;
  final Condition? condition;
  final double? windMph;
  final double? windKph;
  final int? windDegree;
  final String? windDir;
  final int? pressureMb;
  final double? pressureIn;
  final int? precipMm;
  final int? precipIn;
  final int? humidity;
  final int? cloud;
  final double? feelslikeC;
  final double? feelslikeF;
  final double? windchillC;
  final double? windchillF;
  final double? heatindexC;
  final double? heatindexF;
  final double? dewpointC;
  final double? dewpointF;
  final int? visKm;
  final int? visMiles;
  final double? uv;
  final double? gustMph;
  final double? gustKph;

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      lastUpdatedEpoch: (json["last_updated_epoch"] as num?)?.toDouble(),
      lastUpdated: json["last_updated"],
      tempC: (json["temp_c"] as num?)?.toDouble(),
      tempF: (json["temp_f"] as num?)?.toDouble(),
      isDay: json["is_day"] as int?,
      condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
      windMph: (json["wind_mph"] as num?)?.toDouble(),
      windKph: (json["wind_kph"] as num?)?.toDouble(),
      windDegree: (json["wind_degree"] as num?)?.toInt(),
      windDir: json["wind_dir"] as String?,
      pressureMb: (json["pressure_mb"] as num?)?.toInt(),
      pressureIn: (json["pressure_in"] as num?)?.toDouble(),
      precipMm: (json["precip_mm"] as num?)?.toInt(),
      precipIn: (json["precip_in"] as num?)?.toInt(),
      humidity: (json["humidity"] as num?)?.toInt(),
      cloud: (json["cloud"] as num?)?.toInt(),
      feelslikeC: (json["feelslike_c"] as num?)?.toDouble(),
      feelslikeF: (json["feelslike_f"] as num?)?.toDouble(),
      windchillC: (json["windchill_c"] as num?)?.toDouble(),
      windchillF: (json["windchill_f"] as num?)?.toDouble(),
      heatindexC: (json["heatindex_c"] as num?)?.toDouble(),
      heatindexF: (json["heatindex_f"] as num?)?.toDouble(),
      dewpointC: (json["dewpoint_c"] as num?)?.toDouble(),
      dewpointF: (json["dewpoint_f"] as num?)?.toDouble(),
      visKm: (json["vis_km"] as num?)?.toInt(),
      visMiles: (json["vis_miles"] as num?)?.toInt(),
      uv: (json["uv"] as num?)?.toDouble(),
      gustMph: (json["gust_mph"] as num?)?.toDouble(),
      gustKph: (json["gust_kph"] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    "last_updated_epoch": lastUpdatedEpoch,
    "last_updated": lastUpdated,
    "temp_c": tempC,
    "temp_f": tempF,
    "is_day": isDay,
    "condition": condition?.toJson(),
    "wind_mph": windMph,
    "wind_kph": windKph,
    "wind_degree": windDegree,
    "wind_dir": windDir,
    "pressure_mb": pressureMb,
    "pressure_in": pressureIn,
    "precip_mm": precipMm,
    "precip_in": precipIn,
    "humidity": humidity,
    "cloud": cloud,
    "feelslike_c": feelslikeC,
    "feelslike_f": feelslikeF,
    "windchill_c": windchillC,
    "windchill_f": windchillF,
    "heatindex_c": heatindexC,
    "heatindex_f": heatindexF,
    "dewpoint_c": dewpointC,
    "dewpoint_f": dewpointF,
    "vis_km": visKm,
    "vis_miles": visMiles,
    "uv": uv,
    "gust_mph": gustMph,
    "gust_kph": gustKph,
  };
}
