import 'package:firebase_auth/firebase_auth.dart';
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

  Future<void> registerOrLogin() async {
    try {
      // Intentar registrar primero
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _userEmail,
        password: _password,
      );
      _isAuthenticated = true;
      notifyListeners();
      print('Usuario registrado correctamente');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        try {
          // Si el usuario ya existe, intentamos iniciar sesión
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _userEmail,
            password: _password,
          );
          _isAuthenticated = true;
          notifyListeners();
          print('Usuario inició sesión correctamente');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'wrong-password') {
            throw Exception('La contraseña es incorrecta.');
          } else {
            throw Exception('Error al iniciar sesión: ${e.message}');
          }
        }
      } else {
        throw Exception('Error al registrar: ${e.message}');
      }
    }
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
