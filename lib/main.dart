import 'package:code_companion_ai/app/di/locator.dart';
import 'package:code_companion_ai/app/presentation/onboarding/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(
    MultiProvider(
      providers: const [
        ///// YOU ARE TO DUPLICATE THIS LINE FOR EVERY PROVIDER
        // ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
      ],
      child: const CodeCompanion(),
    ),
  );
}

class CodeCompanion extends StatelessWidget {
  const CodeCompanion({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Companion',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}
