// ignore_for_file: use_build_context_synchronously

import 'package:code_companion_ai/app/presentation/auth/login/providers/login_provider.dart';
import 'package:code_companion_ai/app/presentation/bottom_nav/bottom_navigation.dart';
import 'package:code_companion_ai/app/styles/color.dart';
import 'package:code_companion_ai/app/styles/text_style.dart';
import 'package:code_companion_ai/app/widgets/buttons.dart';
import 'package:code_companion_ai/app/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer<LoginProvider>(builder: (context, provider, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(26),
                Text(
                  "Change Password",
                  style: AppTextStyle.black25Bold,
                ),
                const Gap(60),
                Text(
                  "Enter  old password",
                  style: AppTextStyle.black12Bold,
                ),
                const Gap(12),
                AppTextField(
                  controller: provider.emailController,
                  hint: "e.g samshot@example.com",
                ),
                const Gap(20),
                Text(
                  "Enter new password",
                  style: AppTextStyle.black12Bold,
                ),
                const Gap(12),
                AppTextField(
                  controller: provider.passwordController,
                  hint: "",
                  isPassword: true,
                ),
                const Gap(20),
                Text(
                  "Confirm new password",
                  style: AppTextStyle.black12Bold,
                ),
                const Gap(12),
                AppTextField(
                  controller: provider.passwordController,
                  hint: "",
                  isPassword: true,
                ),
                const Gap(12),
                const Gap(52),
                Center(
                  child: AppButton(
                    buttonText: "Reset Password",
                    isLoading: provider.isLoading,
                    buttonColor: AppColor.primaryColor2,
                    onPressed: () async {
                      /// THE AUTH PACKAGE HAS AN ISSUE SO
                      /// I WILL MOVE TO THE NEXT SCRREN
                      // final push = await provider.login();
                      const push = true;
                      if (push) {
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    const BottomNavigation()));
                      }
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
