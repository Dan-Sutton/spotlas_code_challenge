import 'package:flutter/material.dart';

class AppActionsProvider with ChangeNotifier {
  bool _liked = false;
  bool _saved = false;

  bool get liked => _liked;
  bool get saved => _saved;

  void like() {
    _liked = !_liked;
    notifyListeners();
  }

  void save() {
    _saved = !_saved;
    notifyListeners();
  }
}
