class GetApiModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  GetApiModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  GetApiModel.fromJson(Map<String, dynamic> json) {
    if (json["userId"] is int) {
      userId = json["userId"];
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["body"] is String) {
      body = json["body"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["userId"] = userId;
    data["id"] = id;
    data["title"] = title;
    data["body"] = body;
    return data;
  }
}
