
// ignore_for_file: use_build_context_synchronously

import 'package:code_companion_ai/app/presentation/auth/login/screens/login_screen.dart';
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

  Future<void> signup(BuildContext context) async {
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
        ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor:
                                      Color.fromARGB(224, 246, 11, 11),
                                  duration: Duration(seconds: 2),
                                  content: Text('error Logging in')));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
        debugPrint('sign up result: >>> $result');
      } else {
        debugPrint('errror:   eeeeeee');
         ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor:
                                      Color.fromARGB(224, 246, 11, 11),
                                  duration: Duration(seconds: 2),
                                  content: Text('error Signing up')));
        isLoading = false;
        notifyListeners();
      }
    } on Exception catch (e) {
       ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(
                                  backgroundColor:
                                      const Color.fromARGB(224, 246, 11, 11),
                                  duration: const Duration(seconds: 2),
                                  content: Text(e.toString())));
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
