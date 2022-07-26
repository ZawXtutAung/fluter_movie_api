import 'package:flutter/material.dart';
import 'country.dart';
import 'embed_urls.dart';

class Results {
  Results({
    // @required this.actors,
    // @required this.directors,
    // @required this.escritors,
    // @required this.otherTitles,
    @required this.id,
    @required this.image,
    @required this.title,
    @required this.rating,
    @required this.year,
    @required this.titleOriginal,
    @required this.uuid,
    @required this.description,
    @required this.genres,
    @required this.countries,
    @required this.release,
    @required this.embedUrls,
    @required this.index,
    @required this.episodes,
    @required this.createdAt,
    @required this.updatedAt,
  });

  // List<dynamic>? actors;
  // List<dynamic> directors;
  // List<dynamic> escritors;
  // List<dynamic> otherTitles;
  String? id;
  String? image;
  String? title;
  String? rating;
  String? year;
  String? titleOriginal;
  String? uuid;
  String? description;
  List<Country>? genres;
  List<Country>? countries;
  String? release;
  List<EmbedUrl>? embedUrls;
  int? index;
  List<dynamic>? episodes;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        // actors: List<dynamic>.from(json["actors"].map((x) => x)),
        // directors: List<dynamic>.from(json["directors"].map((x) => x)),
        // escritors: List<dynamic>.from(json["escritors"].map((x) => x)),
        // otherTitles: List<dynamic>.from(json["otherTitles"].map((x) => x)),
        id: json["_id"],
        image: json["image"],
        title: json["title"],
        rating: json["rating"],
        year: json["year"],
        titleOriginal: json["titleOriginal"],
        uuid: json["uuid"],
        description: json["description"],
        genres:
            List<Country>.from(json["genres"].map((x) => Country.fromJson(x))),
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x))),
        release: json["release"],
        embedUrls: List<EmbedUrl>.from(
            json["embedUrls"].map((x) => EmbedUrl.fromJson(x))),
        index: json["index"],
        episodes: List<dynamic>.from(json["episodes"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        // "actors": List<dynamic>.from(actors.map((x) => x)),
        // "directors": List<dynamic>.from(directors.map((x) => x)),
        // "escritors": List<dynamic>.from(escritors.map((x) => x)),
        // "otherTitles": List<dynamic>.from(otherTitles.map((x) => x)),
        "_id": id,
        "image": image,
        "title": title,
        "rating": rating,
        "year": year,
        "titleOriginal": titleOriginal,
        "uuid": uuid,
        "description": description,
        "genres": List<dynamic>.from(genres!.map((x) => x.toJson())),
        "countries": List<dynamic>.from(countries!.map((x) => x.toJson())),
        "release": release,
        "embedUrls": List<dynamic>.from(embedUrls!.map((x) => x.toJson())),
        "index": index,
        "episodes": List<dynamic>.from(episodes!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
