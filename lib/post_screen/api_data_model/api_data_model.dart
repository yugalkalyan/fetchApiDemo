



class ApiDataModel {
  ApiDataModel({
    required this.id,
    required this.title,
    required this.user,
    required this.body,
    required this.timelineUrl,
  });

  int id;
  String title;
  User user;
  String body;
  String timelineUrl;

  factory ApiDataModel.fromJson(Map<String, dynamic> json) => ApiDataModel(
    id: json["id"]??0000,
    title: json["title"]??"N/A",
    user: User.fromJson(json["user"]),
    body: json["body"]??"N/A",
    timelineUrl: json["timeline_url"]??"N/A",
  );

}



class User {
  User({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.htmlUrl,
    required this.type,
  });

  String login;
  int id;
  String avatarUrl;
  String htmlUrl;
  String type;

  factory User.fromJson(Map<String, dynamic> json) => User(
    login: json["login"]??"N/A",
    id: json["id"]??0000,
    avatarUrl: json["avatar_url"]??"N/A",
    htmlUrl: json["html_url"]??"N/A",
    type: json["type"]??"N/A",
  );

}
