import 'package:code_companion_ai/app/presentation/chat/widgets/message_bubble.dart';
import 'package:code_companion_ai/app/presentation/saved/provider/saved_screen_provider.dart';
import 'package:code_companion_ai/app/styles/color.dart';
import 'package:code_companion_ai/app/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
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
      body: Consumer<SavedScreenProvider>(
        builder: (context, savedScreenProvider, _) {
          final staredChat = savedScreenProvider.getSavedAnswers(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColor.primaryColor2,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(50),
                    Text(
                      "Favourites",
                      style: AppTextStyle.black25Bold
                          .copyWith(color: AppColor.white),
                    ),
                    const Gap(
                      30,
                    )
                  ],
                ),
              ),
              staredChat.isEmpty
                  ? Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tap on the star ',
                              style: AppTextStyle.black12Bold,
                            ),
                            const Icon(
                              Iconsax.star,
                            ),
                            Text(
                              ' Icon to save to favourites',
                              style: AppTextStyle.black12Bold,
                            )
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: staredChat.length,
                          itemBuilder: (context, index) {
                            return MessageBubble(
                              isUser: false,
                              question: staredChat[index]!.question,
                              isStar: staredChat[index]!.isStar,
                              time: staredChat[index]!.time,
                              answer: staredChat[index]!.answer,
                              onStarred: () {
                                final provider = savedScreenProvider
                                    .getChatProvider(context);
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
                        ),
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
