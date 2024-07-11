import 'dart:core';

class Data {
  int? id;
  String? title;

  int? userId;
  int? albumId;
  String? url;
  String? thumbnailUrl;

  Data({
    this.id,
    this.title,
    this.userId,
    this.albumId,
    this.url,
    this.thumbnailUrl,
  });

  factory Data.fromJson(Map<dynamic, dynamic> json) {
    return Data(
      id: json['id'],
      title: json['title'],
      userId: json['userId'],
      albumId: json['albumId'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
