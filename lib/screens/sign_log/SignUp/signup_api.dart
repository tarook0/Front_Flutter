import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void postdata(
    {required String name,
    required String email,
    required String password,
    required String password_confirmation}) async {
  final response = await http.post(Uri.parse("http://10.0.2.2:8000/api/signup"),
      headers: <String, String>{
        'Charset': 'utf-8',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": password_confirmation,
        },
      ));
  // print((response.body));
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.

  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
