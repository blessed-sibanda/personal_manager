class Note {
  int? id;
  String title;
  String content;
  String color;

  Note({
    this.id,
    this.title = '',
    this.content = '',
    this.color = 'grey',
  });

  factory Note.fromMap(Map<String, dynamic> noteMap) => Note(
        id: noteMap['id'],
        title: noteMap['title'],
        content: noteMap['content'],
        color: noteMap['color'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'content': content,
        'color': color,
      };

  @override
  String toString() {
    return 'Note id: $id, title: $title, content: $content, color: $color';
  }
}
