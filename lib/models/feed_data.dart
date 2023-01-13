import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FeedData with ChangeNotifier {
  List<dynamic> _map = [];
  bool _error = false;
  String _errorMessage = '';

  List<dynamic> get map => _map;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  void saveLocation(String id) {
    int locId = _map.indexWhere((e) => e['spot']['id'] == id);
    _map[locId]['spot']['is_saved'] = !_map[locId]['spot']['is_saved'];
    notifyListeners();
  }

  void likeImage(String id) {
    print(id);
    int imgId = _map.indexWhere((e) => e['author']['id'] == id);
    print(imgId);
    notifyListeners();
  }

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
        _map = [];
      }
    } else {
      _error = true;
      _errorMessage = 'Something went wrong.';
      _map = [];
    }
    notifyListeners();
  }

  // void initialValues() {
  //   _map = [];
  //   _error = false;
  //   _errorMessage = '';
  //   notifyListeners();
  // }
}
