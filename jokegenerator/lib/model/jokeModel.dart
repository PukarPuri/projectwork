

class jokeModel {
  String? id;
  String? title;

  jokeModel({
   required this.id,
   required this.title,
  });

  factory jokeModel.fromJson(Map<String, dynamic> json) => jokeModel(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };

}