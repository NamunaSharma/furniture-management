// ignore_for_file: depend_on_referenced_packages, unused_import, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, use_build_context_synchronously, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crypto/crypto.dart'; // For password hashing
import 'dart:convert'; // For password hashing
import 'loginpage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  String? name;

  String _hashPassword(String password) {
    final salt = 'your_salt'; // Replace with your own salt
    final codec = utf8;
    final key = utf8.encode('$salt$password');
    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(codec.encode(password));
    return digest.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Signup'),
        backgroundColor: Color.fromARGB(255, 8, 35, 47),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: userNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "*required";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Username',
                        hintText: 'Enter Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "*required";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        labelText: 'Email',
                        hintText: 'Enter Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "*required";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility),
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            var userName = userNameController.text;
                            var email = emailController.text;
                            var password = passwordController.text;

                            try {
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .createUserWithEmailAndPassword(
                                email: email,
                                password: password,
                              );

                              // Send email verification
                              await userCredential.user!
                                  .sendEmailVerification();

                              // Hash the password
                              String hashedPassword = _hashPassword(password);

                              // Get the Firebase Authentication user's 'uid'
                              String userId = userCredential.user!.uid;

                              // Add user data to Firestore with the Firebase Authentication 'uid'
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(userId)
                                  .set({
                                'userName': userName,
                                'email': email,
                                'password':
                                    hashedPassword, // Store the hashed password
                                'id': userId,
                              });

                              // Navigate to the login page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            } catch (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "Error creating user. Please try again."),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          backgroundColor: Color.fromARGB(255, 8, 35, 47),
                        ),
                        child: const Text(
                          'SignUp',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
