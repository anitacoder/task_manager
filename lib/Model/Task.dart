class Task {
  int? id;
  String title;
  String description;
  DateTime creationTime;
  int isCompleted;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.creationTime,
    this.isCompleted = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'creationTime': creationTime.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      creationTime: DateTime.parse(map['creationTime']),
      isCompleted: map['isCompleted'],
    );
  }
}
