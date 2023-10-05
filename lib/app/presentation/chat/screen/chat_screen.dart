import 'package:code_companion_ai/app/presentation/chat/provider/chat_provider.dart';
import 'package:code_companion_ai/app/presentation/chat/widgets/message_bubble.dart';
import 'package:code_companion_ai/app/presentation/new%20payment/screen/subscription_options.dart';
import 'package:code_companion_ai/app/styles/color.dart';
import 'package:code_companion_ai/app/styles/text_style.dart';
import 'package:code_companion_ai/app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final initprovider = Provider.of<ChatProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      initprovider.init();
    });
    return Scaffold(
      body: SafeArea(
        child: Consumer<ChatProvider>(builder: (context, provider, _) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            provider.scrollToBottom();
          });
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SubscriptionOptions()));
                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.22,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16))),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "3 credits left",
                              style: AppTextStyle.black12Medium
                                  .copyWith(color: AppColor.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.18,
                    decoration: const BoxDecoration(
                        color: AppColor.primaryColor2,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16))),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          const Gap(16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome!",
                                    style: AppTextStyle.black30Bold
                                        .copyWith(color: AppColor.white),
                                  ),
                                  Text(
                                    "What would you like to work on?",
                                    style: AppTextStyle.black16Medium
                                        .copyWith(color: AppColor.white),
                                  ),
                                ],
                              ),
                              const CircleAvatar()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: provider.chatModel.isEmpty
                    ? Center(
                        child: Text(
                          "Hey there...\n You can ask me anything about coding!\n\n Just type your question below!!",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.black16Medium,
                        ),
                      )
                    : SingleChildScrollView(
                        controller: provider.scrollController,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: provider.chatModel
                                .map((chat) => MessageBubble(
                                      isUser: chat.isUser,
                                      question: chat.question,
                                      time: chat.time,
                                      answer: chat.answer,
                                    ))
                                .toList()),
                      ),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AppTextField(
                  controller: provider.messageController,
                  suffix: InkWell(
                    onTap: () {
                      provider.sendMessage();
                    },
                    child: const Icon(
                      Icons.send_rounded,
                    ),
                  ),
                  hint: "Ask anything about coding....",
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
