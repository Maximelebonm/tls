import 'dart:convert';
import 'package:http/http.dart' as http;

class Student {
  String baseUrl = "http://localhost:8000/auth/users";
  Future<List> getAllStudent() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      //var response = await http.get(baseUrl, body : json);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}