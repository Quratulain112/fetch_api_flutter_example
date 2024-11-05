import 'dart:convert';

import 'package:http/http.dart ' as http;

class ApiCode {
  static Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data);
    }
    throw Exception("Failed");
  }
}
