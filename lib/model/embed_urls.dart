import 'package:flutter/material.dart';

class EmbedUrl {
  EmbedUrl({
    @required this.server,
    @required this.url,
    @required this.priority,
  });

  Server? server;
  String? url;
  int? priority;

  factory EmbedUrl.fromJson(Map<String, dynamic> json) => EmbedUrl(
        server: serverValues.map[json["server"]],
        url: json["url"],
        priority: json["priority"],
      );

  Map<String, dynamic> toJson() => {
        "server": serverValues.reverse[server],
        "url": url,
        "priority": priority,
      };
}

enum Server {
  FEMBED,
  DOODSTREAM,
  UQLOAD,
  UPSTREAM,
  STREAMSB,
  MYSTREAM,
  VIP,
  STREAMTAPE,
  USERSCLOUD,
  MOBILE,
  GDRIVE,
  VIDEOS
}

final serverValues = EnumValues({
  "doodstream": Server.DOODSTREAM,
  "fembed": Server.FEMBED,
  "gdrive": Server.GDRIVE,
  "mobile": Server.MOBILE,
  "mystream": Server.MYSTREAM,
  "streamsb": Server.STREAMSB,
  "streamtape": Server.STREAMTAPE,
  "upstream": Server.UPSTREAM,
  "uqload": Server.UQLOAD,
  "userscloud": Server.USERSCLOUD,
  "videos": Server.VIDEOS,
  "vip": Server.VIP
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
