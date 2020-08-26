import 'dart:core';

class Attachment {
  final String title;
  final String link;
  final String id;
  final String thumbnail;
  final String type;

  Attachment({this.id, this.title, this.link, this.thumbnail, this.type});

  factory Attachment.fromJson(Map<String, dynamic> json) {
    if (json["driveFile"] != null) {
      return Attachment(
        id: json["driveFile"]["driveFile"]["id"],
        title: json["driveFile"]["driveFile"]["title"],
        link: json["driveFile"]["driveFile"]["alternateLink"],
        thumbnail: json["driveFile"]["driveFile"]["thumbnailUrl"],
        type: "file",
      );
    } else if (json["link"] != null) {
      return Attachment(
        title: json["link"]["title"],
        link: json["link"]["url"],
        thumbnail: json["link"]["thumbnailUrl"],
        type: "link",
      );
    } else if (json["youtubeVideo"] != null) {
      return Attachment(
        id: json["youtubeVideo"]["id"],
        title: json["youtubeVideo"]["title"],
        link: json["youtubeVideo"]["alternateLink"],
        thumbnail: json["youtubeVideo"]["thumbnailUrl"],
        type: "youtube",
      );
    } else if (json["form"] != null) {
      //return the assignment using the previously given parameters
      return Attachment(
        title: json["form"]["title"],
        link: json["form"]["formUrl"],
        thumbnail: json["form"]["thumbnailUrl"],
        type: "form",
      );
    } else {
      return Attachment(
        type: "other",
      );
    }
  }

  void output() {
    print("ID: $id | Title: $title | Link: $link | Thumbnail: $thumbnail");
  }
}