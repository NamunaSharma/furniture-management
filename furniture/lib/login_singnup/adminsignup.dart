// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'adminlogin.dart';

class AdminSignUp extends StatefulWidget {
  const AdminSignUp({super.key});

  @override
  State<AdminSignUp> createState() => _AdminSignUpState();
}

class _AdminSignUpState extends State<AdminSignUp> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _address = TextEditingController();
  final _mobile = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 1, 104, 128),
          height: 500,
          width: 500,
          child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                    controller: _username,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        icon: Icon(Icons.person),
                        labelText: "Username",
                        hintText: "Enter your full name",
                        iconColor: Colors.grey,
                        fillColor: Color.fromARGB(255, 252, 251, 252),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                    controller: _password,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        icon: Icon(Icons.password),
                        labelText: "Password",
                        hintText: "Enter your password",
                        fillColor: Color.fromARGB(255, 118, 103, 159),
                        iconColor: Colors.grey,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                    controller: _address,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        icon: Icon(Icons.location_city),
                        labelText: "Address",
                        hintText: "Enter your address",
                        iconColor: Colors.grey,
                        fillColor: Color.fromARGB(255, 252, 251, 252),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                    controller: _mobile,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        icon: Icon(Icons.mobile_friendly),
                        labelText: "Mobile Number",
                        hintText: "Enter your mobile number",
                        iconColor: Colors.grey,
                        fillColor: Color.fromARGB(255, 252, 251, 252),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Sign up Successful'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Something wrong"),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Sign up",
                      textScaleFactor: 1,
                      style:
                          TextStyle(color: Color.fromARGB(255, 250, 250, 249)),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text("Already have an account"),
                  SizedBox(
                    height: 20,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdminLogin()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange),
                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 20,
                        ),
                        label: const Text(
                          "Log In",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
