import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';

Future<bool> checkIdDuplicate(String userId) async {
  final url = Uri.parse('$baseUrl/auth/check-id?request=$userId');

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    // print(data);
    return data['success'];
  } else {
    throw Exception('아이디 중복 확인 실패: ${response.statusCode}');
  }
}
