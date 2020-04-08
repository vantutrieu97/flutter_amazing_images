import 'dart:convert';

import 'package:flutteramazingiamges/mvp/models/index.dart';

class CuratedPhoto {
  int page;
  int perPage;
  List<Photo> photos;
  String nextPage;

  CuratedPhoto({
    this.page,
    this.perPage,
    this.photos,
    this.nextPage,
  });

  factory CuratedPhoto.fromRawJson(String str) => CuratedPhoto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CuratedPhoto.fromJson(Map<String, dynamic> json) => CuratedPhoto(
    page: json["page"],
    perPage: json["per_page"],
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
    nextPage: json["next_page"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "per_page": perPage,
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
    "next_page": nextPage,
  };
}

