import 'package:weather_app/Domain/Entities/condition.dart';

class ConditionModel {
  ConditionModel({required this.text, required this.icon, required this.code});

  final String? text;
  final String? icon;
  final int? code;

  factory ConditionModel.fromJson(Map<String, dynamic> json) {
    return ConditionModel(
      text: json["text"],
      icon: json["icon"],
      code: json["code"],
    );
  }

  Map<String, dynamic> toJson() => {"text": text, "icon": icon, "code": code};

  Condition toDomain() {
    return Condition(text: text, icon: icon, code: code);
  }
}
