// ignore_for_file: use_build_context_synchronously

import 'package:code_companion_ai/app/presentation/auth/login/providers/login_provider.dart';
import 'package:code_companion_ai/app/presentation/auth/sign_up/screens/sign_up_screen.dart';
import 'package:code_companion_ai/app/presentation/bottom_nav/bottom_navigation.dart';
import 'package:code_companion_ai/app/styles/color.dart';
import 'package:code_companion_ai/app/styles/text_style.dart';
import 'package:code_companion_ai/app/widgets/buttons.dart';
import 'package:code_companion_ai/app/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  "Welcome!",
                  style: AppTextStyle.black30Bold,
                ),
                Text(
                  "Sign in to continue",
                  style: AppTextStyle.black14,
                ),
                const Gap(60),
                Text(
                  "Enter your email address",
                  style: AppTextStyle.black12Bold,
                ),
                const Gap(12),
                AppTextField(
                  controller: provider.emailController,
                  onChanged: (p0) {
                    provider.validateEmail(p0);
                  },
                  errorText: provider.emailErrorText,
                  hint: "e.g samshot@example.com",
                ),
                const Gap(20),
                Text(
                  "Enter your password",
                  style: AppTextStyle.black12Bold,
                ),
                const Gap(12),
                AppTextField(
                  controller: provider.passwordController,
                  onChanged: (p0) {
                    provider.validatePassword(p0);
                  },
                  hint: "",
                  errorText: provider.passwordErrorText,
                  isPassword: true,
                ),
                const Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot password?",
                      style: AppTextStyle.black12Bold
                          .copyWith(color: AppColor.primaryColor2),
                    ),
                  ],
                ),
                const Gap(52),
                Center(
                  child: AppButton(
                    buttonText: "Login",
                    isLoading: provider.isLoading,
                    isDisabled: provider.isDisabled,
                    buttonColor: AppColor.primaryColor2,
                    onPressed: () async {
                      /// THE AUTH PACKAGE HAS AN ISSUE SO
                      /// I WILL MOVE TO THE NEXT SCRREN
                      final push = await provider.login(); 
                      // const push = true;
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
                const Gap(8),
                Text(
                  "Don't have an account?",
                  style: AppTextStyle.black12Medium,
                ),
                const Gap(20),
                Center(
                  child: AppButton(
                    buttonText: "Sign up here",
                    buttonColor: AppColor.primaryColor2,
                    buttonType: ButtonType.outlined,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const SignUpScreen()));
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
