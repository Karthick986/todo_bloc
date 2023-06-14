class GetTodosModel {
  List<GetTodoData>? getTodoData;

  GetTodosModel({this.getTodoData});

  factory GetTodosModel.fromJson(List json) =>
      GetTodosModel(getTodoData: List<GetTodoData>.from(
        json.map((x) => GetTodoData.fromJson(x))));
}

class GetTodoData {
  int? userId, id;
  String? title;
  bool? completed;

  GetTodoData({this.userId, this.id, this.title, this.completed});

  factory GetTodoData.fromJson(Map<String, dynamic> json) =>
      GetTodoData(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );
}