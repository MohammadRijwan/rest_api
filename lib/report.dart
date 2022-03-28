///hello every one today we will learn how to integrate REST API in our App
///1. we need Dio Plugin to get the response from the api
///2. we need rest Api end point i.e we have https://api.spaceflightnewsapi.net/v3/reports
///3. we need to create a model of json Data
///4. we need screen to display data
///ok lets start
import 'dart:convert';

class Report {
  Report({
    this.id,
    this.title,
    this.url,
    this.imageUrl,
    this.newsSite,
    this.summary,
    this.publishedAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? url;
  String? imageUrl;
  String? newsSite;
  String? summary;
  DateTime? publishedAt;
  DateTime? updatedAt;

  factory Report.fromRawJson(String str) => Report.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        imageUrl: json["imageUrl"],
        newsSite: json["newsSite"],
        summary: json["summary"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
        "imageUrl": imageUrl,
        "newsSite": newsSite,
        "summary": summary,
        "publishedAt": publishedAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

// now its done
