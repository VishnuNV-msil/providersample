import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class FutureNotifier with ChangeNotifier {
  var _data = null;

  get data => _data;

  void setToNull() {
    _data = null;
    print('setToNull is called');
    notifyListeners();
  }

  FutureNotifier() {

      fetchData().then((value) {
        _data = value;
        print('fetchData is called');
        notifyListeners();
      });
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    return "Data fetched successfully!";
  }
}
