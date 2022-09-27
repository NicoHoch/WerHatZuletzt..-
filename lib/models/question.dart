class Question {
  final int? id;
  final String question;
  final bool free;

  const Question({
    this.id,
    required this.question,
    required this.free,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'free': free,
    };
  }

  @override
  String toString() {
    return 'Question{id: $id, question: $question, free: $free}';
  }
}