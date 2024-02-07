import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/signup_models.dart';
class SignUpNotfier extends StateNotifier<UserModel?> {
  SignUpNotfier() : super(null);

  

  Future<UserModel?> signUp(String name, String password, String confirmPassword, String email) async {
    const String apiUrl = 'http://192.168.200.19:3000/api/v1/user/signup';
    final Map<String, dynamic> requestData = {
      'displayName': name,
      'password': password,
      'passwordConform': confirmPassword,
      'email': email,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(requestData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        final dynamic responseBody = json.decode(response.body);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => SecondScreen()),
          //   );
        // Get.snackbar('SignUp', 'Signup successful');
        // Get.to(const HomePage());
        if (responseBody is Map<String, dynamic>) {
          // Save token to SharedPreferences
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', responseBody['token']);

          // Parse user data
          if (responseBody.containsKey('user')) {
            final UserModel user = UserModel.fromJson(responseBody['user']);
            debugPrint('Sign-up successful for user: ${user.displayName}, ${user
                .email}');
            // Add navigation or other logic here
          } else {
            debugPrint('Error: User data not found in the response');
            // Handle errors accordingly
          }
        } else {
          debugPrint('Error: Response body is not a Map<String, dynamic>');
          // Handle errors accordingly
        }
      } else {
        // Handle errors
        print('Sign-up failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        // Handle errors accordingly
      }
    } catch (error) {
      // Handle network errors or exceptions
      print('Error during sign-up: $error');
      // Handle errors accordingly
    }
    return null;
  }
}

final signUpNotifierProvider = StateNotifierProvider<SignUpNotfier, UserModel?>((ref) {
  return SignUpNotfier();
});

