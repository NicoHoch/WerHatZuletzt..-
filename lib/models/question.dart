class Question {
  final int? id;
  final String german;
  final String english;
  final String type;

  const Question({
    this.id,
    required this.german,
    required this.english,
    required this.type
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'german': german,
      'egnlish': english,
      'type': type
    };
  }

  @override
  String toString() {
    return 'Question{id: $id, german: $german, english: $english, type: $type}';
  }
}