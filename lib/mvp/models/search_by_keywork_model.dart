// To parse this JSON data, do
//
//     final searchByKeyWord = searchByKeyWordFromJson(jsonString);

import 'dart:convert';

class SearchByKeyWord {
  int totalResults;
  int page;
  int perPage;
  List<Photo> photos;
  String nextPage;

  SearchByKeyWord({
    this.totalResults,
    this.page,
    this.perPage,
    this.photos,
    this.nextPage,
  });

  factory SearchByKeyWord.fromRawJson(String str) =>
      SearchByKeyWord.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchByKeyWord.fromJson(Map<String, dynamic> json) =>
      SearchByKeyWord(
        totalResults:
            json["total_results"] == null ? null : json["total_results"],
        page: json["page"] == null ? null : json["page"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        photos: json["photos"] == null
            ? null
            : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        nextPage: json["next_page"] == null ? null : json["next_page"],
      );

  Map<String, dynamic> toJson() => {
        "total_results": totalResults == null ? null : totalResults,
        "page": page == null ? null : page,
        "per_page": perPage == null ? null : perPage,
        "photos": photos == null
            ? null
            : List<dynamic>.from(photos.map((x) => x.toJson())),
        "next_page": nextPage == null ? null : nextPage,
      };
}

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

class Src {
  String original;
  String large2X;
  String large;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;

  Src({
    this.original,
    this.large2X,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });

  factory Src.fromRawJson(String str) => Src.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Src.fromJson(Map<String, dynamic> json) => Src(
        original: json["original"] == null ? null : json["original"],
        large2X: json["large2x"] == null ? null : json["large2x"],
        large: json["large"] == null ? null : json["large"],
        medium: json["medium"] == null ? null : json["medium"],
        small: json["small"] == null ? null : json["small"],
        portrait: json["portrait"] == null ? null : json["portrait"],
        landscape: json["landscape"] == null ? null : json["landscape"],
        tiny: json["tiny"] == null ? null : json["tiny"],
      );

  Map<String, dynamic> toJson() => {
        "original": original == null ? null : original,
        "large2x": large2X == null ? null : large2X,
        "large": large == null ? null : large,
        "medium": medium == null ? null : medium,
        "small": small == null ? null : small,
        "portrait": portrait == null ? null : portrait,
        "landscape": landscape == null ? null : landscape,
        "tiny": tiny == null ? null : tiny,
      };
}
