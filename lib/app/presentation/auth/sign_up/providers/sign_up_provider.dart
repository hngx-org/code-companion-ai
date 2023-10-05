
import 'package:code_companion_ai/app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:hng_authentication/authentication.dart';

class SignUpProvider extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? passwordErrorText;
  String? emailErrorText;

  Future<void> signup() async {
    isLoading = true;
    notifyListeners();

    final name = (nameController).text;
    final email = (emailController).text;
    final password = (passwordController).text;
    try {
      final authRepository = Authentication();
      final result = await authRepository.signUp(email, name, password);
      debugPrint('Signing up');
      if (result != null) {
        // Registration failed, display an error message
        debugPrint('sign up result: >>> $result');
      } else {
        debugPrint('errror:   eeeeeee');
        isLoading = false;
        notifyListeners();
      }
    } on Exception catch (e) {
     debugPrint(e.toString());
      isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  validatePassword(String e) {
    passwordErrorText = validatePasswordTextFields(e);
    notifyListeners();
  }

  validateEmail(String e) {
    emailErrorText = validateEmailTextFields(e);
    notifyListeners();
  }
}
