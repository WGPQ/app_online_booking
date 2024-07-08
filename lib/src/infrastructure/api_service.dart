import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:app_online_booking/src/domain/entities/user.dart';

class ApiService {
  final String baseUrl = 'https://login-flutter-9daf8.firebaseio.com/users';

  Future<void> createUser(CustomUser user) async {
    final url = '$baseUrl.json';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(user),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to create user');
    }
  }

  Future<CustomUser?> login(String email, String password) async {
    final url = '$baseUrl.json';
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to create user');
    }
    final Map<String, dynamic> data = json.decode(response.body);
    for (final userId in data.keys) {
      final user = data[userId];
      if (user['email'] == email && user['password'] == password) {
        return CustomUser.fromJson(user);
      }
    }

    return null;
  }
}
