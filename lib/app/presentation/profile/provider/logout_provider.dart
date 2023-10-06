import 'package:code_companion_ai/app/di/locator.dart';
import 'package:code_companion_ai/data/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:hng_authentication/authentication.dart';

class LogoutProvider extends ChangeNotifier {
  final _db = locator<HiveDB>();

  bool isLoading = false;
  bool isDisabled = false;

  Future<bool> logout() async {
    try {
      isLoading = true;
      notifyListeners();

      final authRepository = Authentication();
      final result = await authRepository.logout(_db.get('email').toString());
      if (result != null) {
        _db.clear();
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
  }
}
