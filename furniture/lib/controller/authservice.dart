// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  TextEditingController AdminEmail = TextEditingController();
  TextEditingController AdminPassword = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  void adminLogin(context) async {}
}
