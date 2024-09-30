import 'package:flutter/material.dart';

class SplashScreenProvider extends ChangeNotifier {
  bool _isLoading = true;
  bool get isloading => _isLoading;
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
