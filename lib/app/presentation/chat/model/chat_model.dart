import 'dart:convert';

class ChatModel {
  final bool isUser;
  final String question;
  final String? answer;
  final DateTime time;

  ChatModel({
    required this.isUser,
    required this.question,
    this.answer,
    required this.time,
  });

  Map<String, dynamic> toJson() {
    return {
      'isUser': isUser,
      'question': question,
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
        answer: decodedChatModel['answer'] as String?,
        time: DateTime.parse(decodedChatModel['time'] as String),
      );
    }).toList();
  }