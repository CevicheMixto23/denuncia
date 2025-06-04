import 'package:flutter/material.dart';

class TabIndexProvider with ChangeNotifier {
  int _currentIndex = 0; // El índice actual de la pestaña

  int get currentIndex => _currentIndex;

  void setIndex(int newIndex) {
    if (newIndex != _currentIndex) {
      _currentIndex = newIndex;
      notifyListeners(); // Notifica a los oyentes que el índice ha cambiado
    }
  }

  static of(BuildContext context, {required bool listen}) {}
}
