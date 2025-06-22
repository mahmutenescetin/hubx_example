class Question {
  final int id;
  final String question;
  final String image;
  final List<String> options;
  final int correctAnswer;

  Question({
    required this.id,
    required this.question,
    required this.image,
    required this.options,
    required this.correctAnswer,
  });
}
