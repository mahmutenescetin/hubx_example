import 'package:hubx_example/features/home/domain/entities/question.dart';

class QuestionModel extends Question {
  QuestionModel({
    required super.id,
    required super.question,
    required super.image,
    required super.options,
    required super.correctAnswer,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    final String questionText = json['title'] ?? json['question'] ?? '';
    final String imageUrl = json['image_uri'] ?? json['image'] ?? '';
    final String subtitle = json['subtitle'] ?? '';
    final String uri = json['uri'] ?? '';

    final List<String> optionsList = [];
    if (subtitle.isNotEmpty) {
      optionsList.add(subtitle);
    }

    if (uri.isNotEmpty) {
      optionsList.add(uri);
    }

    return QuestionModel(
      id: json['id'] ?? 0,
      question: questionText,
      image: imageUrl,
      options: optionsList,
      correctAnswer: json['correctAnswer'] ?? json['order'] ?? 0,
    );
  }

  factory QuestionModel.fromString(String data) {
    return QuestionModel(
      id: 1,
      question: data,
      image: '',
      options: [data],
      correctAnswer: 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'image': image,
      'options': options,
      'correctAnswer': correctAnswer,
    };
  }
}
