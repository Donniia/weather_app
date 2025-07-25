

import 'package:weather_app/Domain/Entities/astro.dart';
import 'package:weather_app/Domain/Entities/day.dart';

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


}