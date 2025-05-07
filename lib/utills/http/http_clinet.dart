import 'dart:convert';

import 'package:http/http.dart' as http;

class THttpHelper {
  static const String _baseUser =
      'http://your-api-url.com'; //Replace with Api base Url

//Helper method to make a Get requested
  static Future<Map<String, dynamic>> get(String endPoint) async {
    final response = await http.get(Uri.parse('$_baseUser/$endPoint'));
    return _handleRespone(response);
  }

  static Future<Map<String, dynamic>> post(
      String endPoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$_baseUser/$endPoint'),
      headers: {'content-Type': 'application /json'},
      body: json.encode(data),
    );
    return _handleRespone(response);
  }

  static Future<Map<String, dynamic>> put(String endPoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$_baseUser/$endPoint'),
      headers: {'content-Type': 'application /json'},
      body: json.encode(data),
    );
    return _handleRespone(response);
  }

  static Future<Map<String, dynamic>> delete(String endPoint) async {
    final response = await http.delete(Uri.parse('$_baseUser/$endPoint'));
    return _handleRespone(response);
  }

  static Map<String, dynamic> _handleRespone(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
