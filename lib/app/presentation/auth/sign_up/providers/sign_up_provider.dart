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
        // final data = json.decode(result);
        print('sign up result: >>> $result');
      isLoading = false;
      notifyListeners();
      } else {
        print('errror:   eeeeeee');
      isLoading = false;
      notifyListeners();
      }
    } on Exception catch (e) {
      print(e);
      isLoading = false;
      notifyListeners();
    }
  }
}
