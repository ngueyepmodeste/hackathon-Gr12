import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileViewModel with ChangeNotifier {
  Map<String, dynamic>? user;

  Future<void> fetchProfile() async {
    const token = 'TON_TOKEN_JWT'; // à remplacer dynamiquement
    const userId = '686522318505077a7db092ce'; // à récupérer après login

    final response = await http.get(
      Uri.parse('http://localhost:3000/api/students/$userId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      user = jsonDecode(response.body);
      notifyListeners();
    } else {
      throw Exception('Échec de la récupération du profil');
    }
  }
}
