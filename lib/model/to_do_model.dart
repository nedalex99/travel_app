class ToDo {
  String? title;

  ToDo({this.title});

  factory ToDo.fromJson(Map<String, dynamic> json) =>
      ToDo(title: json['title']);

  Map<String, dynamic> toJson() => {'title': title};
}
