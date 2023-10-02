import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hng_authentication/authentication.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login() async {
    isLoading = true;
    notifyListeners();

    final email = (emailController).text;
    final password = (passwordController).text;
    try {
      final authRepository = Authentication();
      final result = await authRepository.signIn(email, password);
      if (result != null) {
        // Registration failed, display an error message
        final data = json.decode(result.body);
        print('sign up result: >>> $data');
      } else {
        print('errror:   eeeeeee');
      }
    } on Exception catch (e) {
      print(e);
      isLoading = false;
      notifyListeners();
    }
  }
}
