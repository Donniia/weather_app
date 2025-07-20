import 'package:weather_app/Domain/Entities/astro.dart';

class AstroModel {
  AstroModel({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
  });

  final String? sunrise;
  final String? sunset;
  final String? moonrise;
  final String? moonset;
  final String? moonPhase;

  factory AstroModel.fromJson(Map<String, dynamic> json) {
    return AstroModel(
      sunrise: json["sunrise"],
      sunset: json["sunset"],
      moonrise: json["moonrise"],
      moonset: json["moonset"],
      moonPhase: json["moon_phase"],
    );
  }

  Map<String, dynamic> toJson() => {
    "sunrise": sunrise,
    "sunset": sunset,
    "moonrise": moonrise,
    "moonset": moonset,
    "moon_phase": moonPhase,
    // "moon_illumination": moonIllumination,
    // "is_moon_up": isMoonUp,
    // "is_sun_up": isSunUp,
  };

  Astro toDomain() {
    return Astro(
      sunrise: sunrise,
      sunset: sunset,
      moonrise: moonrise,
      moonset: moonset,
      moonPhase: moonPhase,
    );
  }
}
