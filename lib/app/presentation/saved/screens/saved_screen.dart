import 'package:code_companion_ai/app/presentation/auth/login/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer<LoginProvider>(builder: (context, provider, _) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Saved Screen"),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
