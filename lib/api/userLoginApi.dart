import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:islam_app/config/config.dart';
import 'package:islam_app/model/user.dart';

import 'package:http/http.dart' as http;

Future<dynamic> loginUser(
    String email,
    String password,
    ) async {
  Map<String, dynamic> list = {
    "email": email,
    "password": password,
    "device_type": "android",
    "token": "32423423dsfd2342",
  };

  Map<String, String> headers = {
    'Accept': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
    'Content-Type': 'application/json',
  };
  final response = await http.post(BASE_URL + "/user/login",
      headers: headers, body: jsonEncode(list));
  if (response.statusCode == 200) {
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    if (responseBody["status"] == true) {
      print(responseBody['user']);
 //     FirebaseMessaging fcm = new FirebaseMessaging();
      User user =  User.fromJson(responseBody["user"]);
    /*  fcm.getToken().then((value) => {
        print(value),
       // ChatAPI.updateToken(value, user.id.toString())

      });*/
      // FirebaseFirestore.instance.collection('users').doc(user.id.toString()).set({'token':await fcm.getToken()},SetOptions(merge: true));
      return user;
    } else {
      return responseBody["message"];
    }
  } else {
    // throw Exception(jsonDecode(response.body)['message']);
    return null;
  }
}
