import 'package:code_companion_ai/app/di/locator.dart';
import 'package:code_companion_ai/app/widgets/text_field.dart';
import 'package:code_companion_ai/data/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:hng_authentication/authentication.dart';

class LoginProvider extends ChangeNotifier {
  final _db = locator<HiveDB>();


  bool isLoading = false;

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
          _db.save("email", result.email);
          _db.save("id", result.id);
          _db.save("name", result.name);
          _db.save("credits", result.credits);
          _db.save("cookie", result.cookie);
          isLoading = false;
          notifyListeners();
          return true;
        } else {
          debugPrint('errror:   eeeeeee');
          isLoading = false;
          notifyListeners();
          return false;
        }
      } on Exception catch (e) {
        debugPrint(e.toString());
        isLoading = false;
        notifyListeners();
        return false;
      }
    } else {
     
      return false;
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
