import 'package:code_companion_ai/app/presentation/chat/model/chat_model.dart';
import 'package:code_companion_ai/app/presentation/chat/provider/chat_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SavedScreenProvider extends ChangeNotifier {
  ChatProvider getChatProvider(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);
    return chatProvider;
  }

  List<ChatModel> getChatModelList(BuildContext context) {
    final chatProvider = getChatProvider(context);
    return chatProvider.chatModel;
  }

  List<ChatModel?> getSavedAnswers(BuildContext context) {
    final chatModelList = getChatModelList(context);
    final filteredList =
        chatModelList.where((chatModel) => chatModel.isStar).toList();

    // final answers = filteredList.map((e) => e.answer).toList();

    return filteredList;
  }
}
