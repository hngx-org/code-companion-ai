import 'package:clipboard/clipboard.dart';
import 'package:code_companion_ai/app/styles/color.dart';
import 'package:code_companion_ai/app/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  final bool isUser;
  final String question;
  final String? answer;
  final DateTime time;
  final bool isStar;
  final Function() onStarred;

  const MessageBubble({
    super.key,
    required this.isUser,
    required this.question,
    required this.onStarred,
    required this.isStar,
    this.answer,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final t = DateFormat('h:mm a dd/MM/yy').format(time);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColor.primaryColor3,
          borderRadius: BorderRadius.only(
            topLeft:
                isUser ? const Radius.circular(20) : const Radius.circular(5),
            topRight:
                isUser ? const Radius.circular(5) : const Radius.circular(20),
            bottomLeft: const Radius.circular(20),
            bottomRight: const Radius.circular(20),
          ),
        ),
        child: isUser
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(t, style: AppTextStyle.black8),
                  Text(
                    question,
                    style: AppTextStyle.black14Thick,
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/images/bot.png",
                        ),
                        backgroundColor: AppColor.primaryColor2,
                      ),
                      const Gap(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(t, style: AppTextStyle.black8),
                            Text(
                              question,
                              softWrap: true,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.black14Thick,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  isUser
                      ? Container()
                      : Column(
                          children: [
                            const Gap(16),
                            Container(
                              padding: const EdgeInsets.all(12),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                answer.toString(),
                                style: AppTextStyle.black12Bold,
                              ),
                            ),
                            const Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // ClickToCopy.copy(answer.toString());
                                    onStarred();
                                  },
                                  child: Icon(
                                    isStar ? Iconsax.star1 : Iconsax.star,
                                    color: AppColor.primaryColor2,
                                    semanticLabel: "Add to favorites",
                                  ),
                                ),
                                const Gap(25),
                                InkWell(
                                  onTap: () {
                                    FlutterClipboard.copy(answer.toString());
                                  },
                                  child: const Icon(
                                    Iconsax.copy,
                                    color: AppColor.primaryColor2,
                                    semanticLabel: "Copy to Clipboard",
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                ],
              ),
      ),
    );
  }
}
