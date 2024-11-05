import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AdminService {
  static const url = 'https://3ed8-2800-cd0-afc8-eb00-d986-f1d1-af11-967a.ngrok-free.app/api/';
  Future getNotes() async {
    var response = await http.get(Uri.parse(url+'notes'));
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      return 'Error';
    }
  }
}