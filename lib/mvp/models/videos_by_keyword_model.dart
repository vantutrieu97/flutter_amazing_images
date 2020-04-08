import 'dart:convert';

class VideosByKeyWord {
  int page;
  int perPage;
  int totalResults;
  String url;
  List<Video> videos;

  VideosByKeyWord({
    this.page,
    this.perPage,
    this.totalResults,
    this.url,
    this.videos,
  });

  factory VideosByKeyWord.fromRawJson(String str) =>
      VideosByKeyWord.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VideosByKeyWord.fromJson(Map<String, dynamic> json) =>
      VideosByKeyWord(
        page: json["page"],
        perPage: json["per_page"],
        totalResults: json["total_results"],
        url: json["url"],
        videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total_results": totalResults,
        "url": url,
        "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
      };
}

class Video {
  int id;
  int width;
  int height;
  String url;
  String image;
  dynamic fullRes;
  List<dynamic> tags;
  int duration;
  User user;
  List<VideoFile> videoFiles;
  List<VideoPicture> videoPictures;

  Video({
    this.id,
    this.width,
    this.height,
    this.url,
    this.image,
    this.fullRes,
    this.tags,
    this.duration,
    this.user,
    this.videoFiles,
    this.videoPictures,
  });

  factory Video.fromRawJson(String str) => Video.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        image: json["image"],
        fullRes: json["full_res"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        duration: json["duration"],
        user: User.fromJson(json["user"]),
        videoFiles: List<VideoFile>.from(
            json["video_files"].map((x) => VideoFile.fromJson(x))),
        videoPictures: List<VideoPicture>.from(
            json["video_pictures"].map((x) => VideoPicture.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
        "image": image,
        "full_res": fullRes,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "duration": duration,
        "user": user.toJson(),
        "video_files": List<dynamic>.from(videoFiles.map((x) => x.toJson())),
        "video_pictures":
            List<dynamic>.from(videoPictures.map((x) => x.toJson())),
      };
}

class User {
  int id;
  String name;
  String url;

  User({
    this.id,
    this.name,
    this.url,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}

class VideoFile {
  int id;
  Quality quality;
  FileType fileType;
  int width;
  int height;
  String link;

  VideoFile({
    this.id,
    this.quality,
    this.fileType,
    this.width,
    this.height,
    this.link,
  });

  factory VideoFile.fromRawJson(String str) =>
      VideoFile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VideoFile.fromJson(Map<String, dynamic> json) => VideoFile(
        id: json["id"],
        quality: qualityValues.map[json["quality"]],
        fileType: fileTypeValues.map[json["file_type"]],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quality": qualityValues.reverse[quality],
        "file_type": fileTypeValues.reverse[fileType],
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "link": link,
      };
}

enum FileType { VIDEO_MP4 }

final fileTypeValues = EnumValues({"video/mp4": FileType.VIDEO_MP4});

enum Quality { HD, SD, HLS }

final qualityValues =
    EnumValues({"hd": Quality.HD, "hls": Quality.HLS, "sd": Quality.SD});

class VideoPicture {
  int id;
  String picture;
  int nr;

  VideoPicture({
    this.id,
    this.picture,
    this.nr,
  });

  factory VideoPicture.fromRawJson(String str) =>
      VideoPicture.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VideoPicture.fromJson(Map<String, dynamic> json) => VideoPicture(
        id: json["id"],
        picture: json["picture"],
        nr: json["nr"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "picture": picture,
        "nr": nr,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
