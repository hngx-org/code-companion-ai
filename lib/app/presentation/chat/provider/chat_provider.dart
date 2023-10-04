import 'dart:convert';

import 'package:code_companion_ai/app/di/locator.dart';
import 'package:code_companion_ai/app/presentation/chat/model/chat_model.dart';
import 'package:code_companion_ai/data/services/db_service.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final _db = locator<HiveDB>();

  List<ChatModel> chatModel = [];

  TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  void sendMessage() async {
    final text = messageController.text;
    final question =
        ChatModel(isUser: true, question: text, time: DateTime.now());
    chatModel.add(question);
    notifyListeners();
    final answer = ChatModel(
      isUser: false,
      question: text,
      time: DateTime.now(),
      answer:
          "My name is Samuel Ademujmi My name is Samuel Ademujmi My name is Samuel Ademujmi My name is Samuel Ademujmi My name is Samuel Ademujmi My name is Samuel Ademujmi My name is Samuel Ademujmi My name is Samuel Ademujmi v v My name is Samuel Ademujmi My name is Samuel Ademujmi",
    );
    chatModel.add(answer);

    messageController.clear();
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    scrollToBottom();
    saveToDB();
  }

  void scrollToBottom() {
    if (chatModel.length > 1) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  saveToDB() {
    String jsonData =
        jsonEncode(chatModel.map((chatModel) => chatModel.toJson()).toList());
    _db.save("messages", jsonData);
  }

  init() {
    chatModel = fromJsonToModel(_db.get("messages"));
    notifyListeners();
  }
}
