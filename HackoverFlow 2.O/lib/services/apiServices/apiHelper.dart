import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  static Future<List<Map<String, dynamic>>> callApiAndParseList(String apiPath) async {
    final response = await http.get(Uri.parse(apiPath));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<Map<String, dynamic>> callApiAndParse(String apiPath) async {
    final response = await http.get(Uri.parse(apiPath));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
