import 'package:code_companion_ai/app/presentation/auth/login/screens/login_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'AI CodeCampers',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
            Image.asset(
              'assets/images/pic.png',
              height: 400,
            ),
            const Text(
              ' your one-stop solution for seamless code debugging and expert coding assistance through chat! ',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomContainer(
              fillColor: Colors.purpleAccent,
              width: 280,
              height: 50,
              useShadow: false,
              borderColor: Colors.white,
              borderRadius: 40,
              child: Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            CustomContainer(
              fillColor: Colors.purpleAccent,
              width: 280,
              height: 50,
              useShadow: false,
              borderColor: Colors.white,
              borderRadius: 40,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const LoginScreen()));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
              ),
            )
          ],
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
