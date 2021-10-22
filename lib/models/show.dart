// To parse this JSON data, do
//
//     final show = showFromJson(jsonString);

import 'dart:convert';

List<Show> showFromJson(String str) =>
    List<Show>.from(json.decode(str).map((x) => Show.fromJson(x)));

class Show {
  Show({
    this.id,
    this.name,
    this.status,
    this.rating,
    this.image,
    this.summary,
  });

  int id;
  String name;
  String status;
  Rating rating;
  Image image;
  String summary;

  factory Show.fromJson(Map<String, dynamic> json) => Show(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        rating: Rating.fromJson(json["rating"]),
        image: Image.fromJson(json["image"]),
        summary: json["summary"],
      );
}

class Image {
  Image({
    this.medium,
    this.original,
  });

  String medium;
  String original;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json["medium"],
        original: json["original"],
      );

  Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
      };
}

class Rating {
  Rating({
    this.average,
  });

  double average;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"] == null ? null : json["average"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "average": average == null ? null : average,
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
