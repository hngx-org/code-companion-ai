import 'package:code_companion_ai/app/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class BotLoadingAnim extends StatelessWidget {
  const BotLoadingAnim({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColor.primaryColor3,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/bot.png",
                  ),
                  backgroundColor: AppColor.primaryColor2,
                ),
                const Gap(10),
                LoadingAnimationWidget.waveDots(
                    color: AppColor.primaryColor, size: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
