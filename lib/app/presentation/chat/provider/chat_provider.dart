import 'dart:convert';

import 'package:code_companion_ai/app/di/locator.dart';
import 'package:code_companion_ai/app/presentation/chat/model/chat_model.dart';
import 'package:code_companion_ai/data/const.dart';
import 'package:code_companion_ai/data/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:hngx_openai/repository/openai_repository.dart';

class ChatProvider extends ChangeNotifier {
  final _db = locator<HiveDB>();
  OpenAIRepository openAI = OpenAIRepository();

  List<ChatModel> chatModel = [];
  String cookie = "";
  bool isResponseLoading = false;

  TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  void sendMessage() async {
    final text = messageController.text;
    final question = ChatModel(
        isUser: true, question: text, isStar: false, time: DateTime.now());

    chatModel.add(question);
    isResponseLoading = true;
    messageController.clear();
    notifyListeners();
    String answer = await consultOpenAI(text);
    answer = answer.substring(answer.indexOf(":") + 1).trim();
    final bot = ChatModel(
        isUser: false,
        question: text,
        isStar: false,
        time: DateTime.now(),
        answer: answer);
    chatModel.add(bot);

    isResponseLoading = false;
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

  Future<String> consultOpenAI(String data) async {
    final List<ChatModel> userChat =
        chatModel.where((chatModel) => chatModel.isUser).toList();
    List<String> history = [prompt];
    for (var e in userChat) {
      history.add(e.question);
    }
    history.removeLast();
    return await openAI.getChatCompletions(
        history, "${prompt}Now answer this question $data", cookie);
  }

  star(int index) {
    chatModel[index].isStar = !chatModel[index].isStar;
    saveToDB();
    notifyListeners();
  }

  saveToDB() async {
    String jsonData =
        jsonEncode(chatModel.map((chatModel) => chatModel.toJson()).toList());
    await _db.save("messages", jsonData);
  }

  init() {
    chatModel = fromJsonToModel(_db.get("messages"));
    notifyListeners();
    cookie = (_db.get("cookie") as String).split(";").first;
  }

  @override
  void dispose() {
    scrollController.dispose();
    messageController.dispose();

    super.dispose();
  }
}
