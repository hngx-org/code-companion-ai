import 'package:code_companion_ai/app/presentation/chat/widgets/message_bubble.dart';
import 'package:code_companion_ai/app/presentation/saved/provider/saved_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer<SavedScreenProvider>(
            builder: (context, savedScreenProvider, _) {
              final staredChat = savedScreenProvider.getSavedAnswers(context);
              return staredChat.isEmpty
                  ? const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text("Saved Screen"),
                        )
                      ],
                    )
                  : ListView.builder(
                      itemCount: staredChat.length,
                      itemBuilder: (context, index) {
                        return MessageBubble(
                          isUser: false,
                          question: staredChat[index]!.question,
                          isStar: staredChat[index]!.isStar,
                          time: staredChat[index]!.time,
                          answer: staredChat[index]!.answer,
                          onStarred: () {
                            final provider =
                                savedScreenProvider.getChatProvider(context);
                            var indexToUnStar = savedScreenProvider
                                .getChatModelList(context)
                                .indexOf(staredChat[index]!);

                            provider.star(indexToUnStar);
                            setState(() {});
                            // final provider = Provider.of<ChatProvider>(context,
                            //     listen: false);
                            // var p =
                            //     provider.chatModel.indexOf(staredChat[index]!);
                          },
                        );
                      },
                    );
            },
          ),
        ),
      ),
    );
  }
}
