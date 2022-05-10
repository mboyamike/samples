import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier {
  bool isLoading = false;
  String? error;
  bool get hasError => error != null;

  void unsetLoading() {
    isLoading = false;
    notifyListeners();
  }

  void unsetLoadingAndError() {
    isLoading = false;
    error = null;
    notifyListeners();
  }

  void setLoading() {
    isLoading = true;
    notifyListeners();
  }

  void setError(String errorMessage) {
    error = errorMessage;
    notifyListeners();
  }
}
