import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> submitSignup(BuildContext context, {
  required String name,
  required String id,
  required String password,
}) async {
  final url = Uri.parse('http://localhost:8080/auth/signup');

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': id,
        'password': password,
        'nickname': name,
        'email': null,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      debugPrint('user ID=${responseBody['id']}');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('회원가입 성공!')),
        );
      }
    } else {
      throw Exception('회원가입 실패');
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('회원가입에 실패했습니다.')),
      );
    }
  }
}