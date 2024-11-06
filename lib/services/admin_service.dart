import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AdminService {
  static const url = 'http://localhost:8000/api/';
  Future getNotes() async {
    var response = await http.get(Uri.parse(url+'notes'));
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      return 'Error';
    }
  }
  Future postNotes(String title, String content) async {
    var response = await http.post(
      Uri.parse(url+'notes'),
      body: {
        'title': title,
        'content': content,
      }
    );
    if (response.statusCode == 200) {
      return 'Success';
    } else {
      return 'Error';
    }
  }
}