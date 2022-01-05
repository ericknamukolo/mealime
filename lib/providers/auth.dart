// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mealime/models/otp.dart';

class Auth with ChangeNotifier {
  Otp? otp;
  String? token;

  Future<void> mobileRegistration(String phoneNumber) async {
    var url = 'http://165.227.238.146:8083/api/v1/auth/send-otp';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode({
        'phone_number': '+26$phoneNumber',
      }),
    );
    var data = json.decode(response.body);
    if (response.statusCode == 201) {
      print(data);
      otp = Otp(
          id: data['otp_id'], phoneNumber: '+26$phoneNumber', otp: data['otp']);
    } else {
      throw Exception('Enter a valid number');
    }

    notifyListeners();
  }

  Future<void> mobileVerification(int otpCode) async {
    var url = 'http://165.227.238.146:8083/api/v1/auth/verify-otp';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode({
        'otp_id': otp!.id,
        'phone_number': otp!.phoneNumber,
        'otp': otpCode,
      }),
    );
    var data = json.decode(response.body);

    if (otp!.otp == otpCode && response.statusCode == 201) {
      token = data['registration_token'];
    } else {
      throw Exception('Incorrect Pin');
    }
    notifyListeners();
  }

  Future<void> signIn(String phoneNumber, String password) async {
    var url = 'http://165.227.238.146:8083/api/v1/auth/signin';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode({
        'phone_number': '+26$phoneNumber',
        'password': password,
      }),
    );
    var data = json.decode(response.body);
    print(data);
    if (response.statusCode == 201) {
      token = data['token'];
    } else {
      throw Exception('incorrect password or phone number');
    }
    notifyListeners();
  }
}
//{{BASE}}