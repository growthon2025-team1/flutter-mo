import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getUserInfo(String token) async {
  final response = await http.get(
    Uri.parse('http://localhost:8080/auth/me'),
    headers: {
      'Authorization': '$token',
    },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    debugPrint('${data}');

    return data;
  } else {
    throw Exception('사용자 정보를 불러오는 데 실패했습니다.');
  }
}
