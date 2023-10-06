// ignore_for_file: unused_import, prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture/adminscreen.dart';
import 'package:furniture/adminselfmade.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 26, 38, 47),
      ),
      body: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 90,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_sharp),
                  prefixIconColor: Color.fromARGB(255, 94, 13, 194),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: "Enter the email address",
                  hintText: "Enter your full email",
                  fillColor: Color.fromARGB(255, 96, 81, 134),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _password,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  prefixIconColor: Color.fromARGB(255, 94, 13, 194),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: "Enter the password",
                  hintText: "Enter your password",
                  fillColor: Color.fromARGB(255, 118, 103, 159),
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 26, 38, 47),
                    // backgroundColor: Color.fromARGB(255, 121, 3, 206),
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold)),
                onPressed: () async {
                  var email = _email.text.trim();
                  var password = _password.text.trim();
                  if (email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please fill in all fields"),
                      ),
                    );
                    return;
                  }

                  try {
                    final User? firebaseUser = (await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email, password: password))
                        .user;
                    if (firebaseUser != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login successful")));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminDsh()));
                    } else {
                      print("Check the password");
                    }
                  } on FirebaseAuthException catch (e) {
                    print("Error $e");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Something wrong"),
                      ),
                    );
                  }
                },
                child: const Text(
                  "Log in",
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: Color.fromARGB(255, 250, 250, 249),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
            ],
          )),
    );
  }
}
