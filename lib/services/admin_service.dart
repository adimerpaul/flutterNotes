import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AdminService {
  static const url = 'https://2e80-2800-cd0-afc8-eb00-69d9-a2b0-5150-ee07.ngrok-free.app/api/';
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
  Future putNotes(int id, String title, String content) async {
    var response = await http.put(
      Uri.parse(url+'notes/$id'),
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
  Future deleteNotes(int id) async {
    var response = await http.delete(Uri.parse(url+'notes/$id'));
    if (response.statusCode == 200) {
      return 'Success';
    } else {
      return 'Error';
    }
  }
}