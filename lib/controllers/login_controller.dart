import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_models.dart';

class LoginNotifier extends StateNotifier<LoginResponseModel?> {
  LoginNotifier() : super(null);

  Future<LoginResponseModel?> login(String password, String email) async {
    const String apiUrl = 'http://192.168.200.19:3000/api/v1/user/login';
    final Map<String, dynamic> requestData = {
      'password': password,
      'email': email,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(requestData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final dynamic responseBody = json.decode(response.body);

        if (responseBody is Map<String, dynamic>) {
          // Use the LoginResponseModel
          final LoginResponseModel loginResponse = LoginResponseModel.fromJson(responseBody);

          // Save token to SharedPreferences
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', loginResponse.token);

          debugPrint('Login successful. Token: ${loginResponse.token}');
          // Add navigation or other logic here

          // Get.snackbar('Login', 'Login successful');
          // Get.to(HomePage());
          return loginResponse;
        } else {
          debugPrint('Error: Response body is not a Map<String, dynamic>');
          return null;
          // Handle errors accordingly
        }
      } else {
        // Handle errors
        debugPrint('Login failed. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
        return null;
        // Handle errors accordingly
      }
    } catch (error) {
      // Handle network errors or exceptions
      debugPrint('Error during login: $error');
      // Handle errors accordingly
    }
    return null;
  }

}

final loginNotifierProvider = StateNotifierProvider<LoginNotifier, LoginResponseModel?>((ref) {
  return LoginNotifier();
});

 
  
