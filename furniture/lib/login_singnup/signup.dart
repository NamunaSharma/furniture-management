import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture/consts/firebase_consts.dart';

import 'loginpage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFDF4F5),
      appBar: AppBar(
        title: const Text('Signup'),
        backgroundColor: Color.fromARGB(255, 121, 3, 206),
      ),
      body: SingleChildScrollView(
        child: Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("images/paw1end.png"),
          //     // fit: BoxFit.cover,
          //   ),
          // ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    //usernanme
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
                        label: Text('Email'),
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
                        label: Text('Password'),
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
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            var userName = userNameController.text;
                            var email = emailController.text;
                            var password = passwordController.text;

                            // Creating an account
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                )
                                .then((value) => {
                                      FirebaseFirestore.instance
                                          .collection("users")
                                          .doc()
                                          .set({
                                        'userName': userName,
                                        'email': email,
                                        "password": password,
                                        "id": currentUser!.uid,
                                      })
                                    });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));

                            // Showing error
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(
                            //     content: Text("Error creating user. Please try again."),
                            //     backgroundColor: Colors.red,
                            //   ),
                            // );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          backgroundColor: Color.fromARGB(255, 121, 3, 206),
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
