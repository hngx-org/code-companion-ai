
import 'package:code_companion_ai/app/presentation/onboarding/screens/onboarding.dart';
import 'package:flutter/material.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/confetti.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/checked.png',
                  width: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Payment Successful',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                RichText(
                  text: const TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Your transaction has ',
                        ),
                        TextSpan(
                          text: 'Successfully ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        TextSpan(
                          text: 'been completed',
                        )
                      ]),
                ),
                const SizedBox(
                  height: 200,
                ),
                InkWell(
                  //change this to the homeScreen
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const OnboardingScreen()));
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.home,
                            size: 50,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
