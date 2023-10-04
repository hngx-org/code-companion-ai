import 'dart:convert';

import 'package:code_companion_ai/app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:hng_authentication/authentication.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isDisabled = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? passwordErrorText;
  String? emailErrorText;

  Future<bool> login() async {
    final email = (emailController).text;
    final password = (passwordController).text;
    validateEmail(email);
    validatePassword(password);

    if (emailErrorText == null && passwordErrorText == null) {
      try {
        isLoading = true;
        notifyListeners();

        final authRepository = Authentication();
        final result = await authRepository.signIn(email, password);
        if (result != null) {
          // Registration failed, display an error message
          final data = json.decode(result.body);
          debugPrint('sign up result: >>> $data');

          return true;
        } else {
          debugPrint('errror:   eeeeeee');
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
    } else {
      isDisabled = true;
      notifyListeners();
      return false;
    }
  }

  validatePassword(String e) {
    passwordErrorText = validatePasswordTextFields(e);
    if (passwordErrorText == null && emailErrorText == null) {
      isDisabled = false;
    } else {
      isDisabled = true;
    }
    notifyListeners();
  }

  validateEmail(String e) {
    emailErrorText = validateEmailTextFields(e);
    if (passwordErrorText == null && emailErrorText == null) {
      isDisabled = false;
    } else {
      isDisabled = true;
    }
    notifyListeners();
  }
}
