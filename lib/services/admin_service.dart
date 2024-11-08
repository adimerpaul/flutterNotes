import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:localstorage/localstorage.dart';

class AdminService {
  static const url = 'http://localhost:8000/api/';
  Future login(String email, String password) async {
    var response = await http.post(
      Uri.parse(url+'login'),
      body: {
        'email': email,
        'password': password,
      }
    );
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      // print(jsonResponse);
      var token = jsonResponse['token'];
      localStorage.setItem('token', token);
      return true;
    } else {
      return false;
    }
  }
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