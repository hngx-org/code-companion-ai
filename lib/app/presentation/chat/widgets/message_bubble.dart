import 'package:code_companion_ai/app/styles/color.dart';
import 'package:code_companion_ai/app/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MessageBubble extends StatelessWidget {
  final bool isUser;
  final String question;
  final String? answer;
  final DateTime time;

  const MessageBubble({
    super.key,
    required this.isUser,
    required this.question,
    this.answer,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
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
                  Text(time.toIso8601String(), style: AppTextStyle.black8),
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
                      const CircleAvatar(),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(time.toIso8601String(),
                              style: AppTextStyle.black8),
                          Text(
                            question,
                            style: AppTextStyle.black14Thick,
                          ),
                        ],
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
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.copy,
                                  color: AppColor.grey,
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
