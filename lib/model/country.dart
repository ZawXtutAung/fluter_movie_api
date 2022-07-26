import 'package:flutter/material.dart';

class Country {
  Country({
    @required this.name,
    @required this.uuid,
  });

  String? name;
  String? uuid;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "uuid": uuid,
      };
}
