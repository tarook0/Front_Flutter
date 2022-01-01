import 'dart:convert';
import'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

var x;
var error;

Future postdata ({required String name ,required String email ,
  required String password ,
  required String password_confirmation}) async {
try{ final response = await http.post(
  //if running on real device keep it like this "http://192.168.1.107:8000/api/signup"
  //if running on emulator keep it like this "https://10.0.2.2:8000/api/signup" (not sure if you can remove the s or not)
  Uri.parse("http://192.168.1.107:8000/api/signup"),
  headers: <String, String>{
    "Content-Type": "application/json",
    "Accept": "application/json",
    'Charset' : 'utf-8',

  },
  body: jsonEncode({
    "name": name,
    "email": email,
    "password": password,
    "password_confirmation": password_confirmation,}),

);

x = response.statusCode;
print(response.body);}
catch(er){
   error= er.toString();
  print(error);
}

}
