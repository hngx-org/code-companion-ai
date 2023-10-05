import 'dart:convert';

class ChatModel {
  final bool isUser;
  final String question;
  final String? answer;
  final DateTime time;
  bool isStar;

  ChatModel({
    required this.isUser,
    required this.question,
    required this.isStar,
    this.answer,
    required this.time,
  });

  Map<String, dynamic> toJson() {
    return {
      'isUser': isUser,
      'question': question,
      'isStar': isStar,
      'answer': answer,
      'time': time.toIso8601String(),
    };
  }
}

List<ChatModel> fromJsonToModel(String jsonData) {
  List<dynamic> decodedList = jsonDecode(jsonData);
  return decodedList.map((dynamic decodedChatModel) {
    return ChatModel(
      isUser: decodedChatModel['isUser'] as bool,
      question: decodedChatModel['question'] as String,
      isStar: decodedChatModel['isStar'] as bool,
      answer: decodedChatModel['answer'] as String?,
      time: DateTime.parse(decodedChatModel['time'] as String),
    );
  }).toList();
}
