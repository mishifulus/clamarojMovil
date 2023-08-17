import 'package:flutter/foundation.dart';

class AuthNotifier extends ChangeNotifier {
  bool _isLoggedIn = false;
  String? _userEmail;

  bool get isLoggedIn => _isLoggedIn;
  String? get userEmail => _userEmail;

  void logIn(String userEmail) {
    _isLoggedIn = true;
    _userEmail = userEmail;
    notifyListeners();
  }

  void logOut() {
    _isLoggedIn = false;
    _userEmail = null;
    notifyListeners();
  }
}