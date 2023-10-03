import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hng_authentication/authentication.dart';

class SignUpProvider extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void signup() async {
    isLoading = true;
    notifyListeners();

    final name = (nameController).text;
    final email = (emailController).text;
    final password = (passwordController).text;
    try {
      final authRepository = Authentication();
      final result = await authRepository.signUp(email, name, password);
      if (result != null) {
        // Registration failed, display an error message
        final data = json.decode(result.body);
        debugPrint('sign up result: >>> $data');
      } else {
        debugPrint('errror:   eeeeeee');
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      isLoading = false;
      notifyListeners();
    }
  }
}
