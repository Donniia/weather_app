import 'package:weather_app/Domain/Entities/location.dart';

class LocationModel {
  LocationModel({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    // required this.localtimeEpoch,
    required this.localtime,
  });

  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? tzId;
  // final int localtimeEpoch;
  final String? localtime;

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json["name"],
      region: json["region"],
      country: json["country"],
      lat: json["lat"],
      lon: json["lon"],
      tzId: json["tz_id"],
      //localtimeEpoch: json["localtime_epoch"],
      localtime: json["localtime"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "region": region,
    "country": country,
    "lat": lat,
    "lon": lon,
    "tz_id": tzId,
    //"localtime_epoch": localtimeEpoch,
    "localtime": localtime,
  };

  Location toDomain() {
    return Location(
      name: name,
      region: region,
      country: country,
      lat: lat,
      lon: lon,
      tzId: tzId,
      localtime: localtime,
    );
  }
}
