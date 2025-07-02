import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  String firstname = '';
  String lastname = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool isLoading = false;
  String? errorMessage;

  void setFirstname(String value) {
    firstname = value;
    notifyListeners();
  }

  void setLastname(String value) {
    lastname = value;
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    confirmPassword = value;
    notifyListeners();
  }

  bool validateFields() {
    if (firstname.isEmpty || lastname.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      errorMessage = "Tous les champs sont obligatoires.";
      notifyListeners();
      return false;
    }
    if (password != confirmPassword) {
      errorMessage = "Les mots de passe ne correspondent pas.";
      notifyListeners();
      return false;
    }
    errorMessage = null;
    return true;
  }

  Future<void> register() async {
    if (!validateFields()) return;
    isLoading = true;
    notifyListeners();
    // TODO: Appel API ici
    await Future.delayed(Duration(seconds: 2));
    isLoading = false;
    notifyListeners();
  }
} 