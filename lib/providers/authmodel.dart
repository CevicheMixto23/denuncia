import 'package:flutter/material.dart';

class Authmodel extends ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isEmailStage = true;
  String _userEmail = '';
  String _password = '';

  bool get isAuthenticated => _isAuthenticated;
  bool get isEmailStage => _isEmailStage;
  String get password => _password;
  String get userEmail => _userEmail;

  void goToEmailStage() {
    _isEmailStage = true;
    notifyListeners();
  }

  void goToPasswordStage() {
    _isEmailStage = false;
    notifyListeners();
  }

  void login(String email, String password) {
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }

  void reset() {
    _userEmail = '';
    _password = '';
    _isEmailStage = true;
    _isAuthenticated = false;
    notifyListeners();
  }

  void setEmail(String email) {
    _userEmail = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }
}
