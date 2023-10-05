import 'package:code_companion_ai/app/presentation/auth/login/screens/login_screen.dart';
import 'package:code_companion_ai/app/presentation/auth/sign_up/screens/sign_up_screen.dart';
import 'package:code_companion_ai/app/styles/color.dart';
import 'package:code_companion_ai/app/styles/text_style.dart';
import 'package:code_companion_ai/app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(20),
                Text(
                  'Code Companion AI',
                  style: AppTextStyle.black25Bold,
                ),
                const Spacer(),
                Image.asset(
                  'assets/images/pic.png',
                  height: 250,
                ),
                const Gap(20),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Your one-stop solution for seamless \n',
                        style: AppTextStyle.black16Medium,
                      ),
                      TextSpan(
                        text: ' code debugging ',
                        style: AppTextStyle.black16Medium.copyWith(
                            backgroundColor: Colors.red, color: AppColor.white),
                      ),
                      TextSpan(
                        text: ' and expert coding assistance through chat! ',
                        style: AppTextStyle.black16Medium,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Center(
                  child: AppButton(
                    buttonText: "Get Started",
                    buttonColor: AppColor.primaryColor,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const SignUpScreen()));
                    },
                  ),
                ),
                const Gap(15),
                Center(
                  child: AppButton(
                    buttonText: "Login ",
                    buttonColor: AppColor.primaryColor,
                    buttonType: ButtonType.outlined,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const LoginScreen()));
                    },
                  ),
                ),
                const Gap(15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  // You can choose to set fill color
  final Color fillColor;
  // Set the width of the container
  final double width;
  // Set the height of the container
  final double height;
  // Set the borderRadius of the container
  final double borderRadius;
  // Color of the border of the container
  final Color borderColor;
  // Set how far the shadow extends
  final double shadowOffset;
  // Do I need shadow for the container of not
  final bool useShadow;
  // Content of the container
  final Widget? child;
  // Padding to apply to the children
  final EdgeInsets? padding;
  // Border Width
  final double borderWidth;
  // Alignment
  final Alignment? alignment;

  const CustomContainer({
    super.key,
    required this.fillColor,
    required this.width,
    required this.height,
    this.borderColor = Colors.black,
    this.borderRadius = 8.0,
    this.shadowOffset = 4.0,
    this.useShadow = true,
    this.child,
    this.padding,
    this.borderWidth = 2,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        color: fillColor,
        boxShadow: useShadow
            ? [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 0,
                  offset: Offset(shadowOffset, shadowOffset),
                  spreadRadius: 0,
                )
              ]
            : null,
      ),
      child: child ?? const SizedBox(),
    );
  }
}
