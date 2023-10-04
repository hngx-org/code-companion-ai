import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hng_authentication/authentication.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<bool> login() async {
    try {
      isLoading = true;
      notifyListeners();

      final email = (emailController).text;
      final password = (passwordController).text;
      final authRepository = Authentication();
      final result = await authRepository.signIn(email, password);
      if (result != null) {
        // Registration failed, display an error message
        // final data = json.decode(result.body);
        print('lpgin  result: >>> $result');
        isLoading = false;
        notifyListeners();

        return true;
      } else {
        print('errror:   eeeeeee');
        isLoading = false;
        notifyListeners();
        return false;
      }
    } on Exception catch (e) {
      print(e);
      isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
