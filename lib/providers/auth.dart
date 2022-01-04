import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InN0dWRlbnRJZCI6IjE3MjExMDU1MDExIiwiZW1haWwiOiJlcmlja25hbXVvbG8xQGdtYWlsLmNvbSIsInVzZXJyb2xhIjpudWxsfSwiaWF0IjoxNjM0MzEzMTAzfQ.vQYTODGUOTUN6CA7OgZiwePO4Rqjfsm2Z9660oaczOE';

  Future<void> mobileRegistration(String phoneNumber) async {
    var url = 'http://165.227.238.146:8083/api/v1/auth/send-otp';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        'phone_number': '+26$phoneNumber',
      }),
    );
    var data = json.decode(response.body);
    if (response.statusCode == 201) {
      print(data);
    } else {
      throw Exception('Enter a valid number');
    }

    notifyListeners();
  }
}
