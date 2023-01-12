import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FeedData with ChangeNotifier {
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMessage = '';

  Future<void> get fetchData async {
    final response = await get(
      Uri.parse('https://dev.api.spotlas.com/interview/feed?page=1'),
    );

    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        _error = false;
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _map = {};
      }
    } else {
      _error = true;
      _errorMessage = 'Something went wrong.';
      _map = {};
    }
    notifyListeners();
  }
}
