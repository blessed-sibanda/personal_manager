import 'base_model.dart';

class Note {
  int? id;
  String title;
  String content;
  String color;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.color,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        color: json['color'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'color': color,
      };
}

class NotesManager extends BaseModel {}
