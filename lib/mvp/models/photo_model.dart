import 'dart:convert';

import 'index.dart';

class Photo {
  int id;
  int width;
  int height;
  String url;
  String photographer;
  String photographerUrl;
  int photographerId;
  Src src;
  bool liked;

  Photo({
    this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.photographerId,
    this.src,
    this.liked,
  });

  factory Photo.fromRawJson(String str) => Photo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    id: json["id"] == null ? null : json["id"],
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
    url: json["url"] == null ? null : json["url"],
    photographer:
    json["photographer"] == null ? null : json["photographer"],
    photographerUrl:
    json["photographer_url"] == null ? null : json["photographer_url"],
    photographerId:
    json["photographer_id"] == null ? null : json["photographer_id"],
    src: json["src"] == null ? null : Src.fromJson(json["src"]),
    liked: json["liked"] == null ? null : json["liked"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "width": width == null ? null : width,
    "height": height == null ? null : height,
    "url": url == null ? null : url,
    "photographer": photographer == null ? null : photographer,
    "photographer_url": photographerUrl == null ? null : photographerUrl,
    "photographer_id": photographerId == null ? null : photographerId,
    "src": src == null ? null : src.toJson(),
    "liked": liked == null ? null : liked,
  };
}
