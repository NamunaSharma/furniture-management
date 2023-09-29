import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:furniture/homescreen.dart';
import 'package:furniture/login_singnup/signup.dart';
import 'package:lottie/lottie.dart';
import '../home.dart';
import 'forgetpassword.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Lottie.asset("assets/animation_lmgiha5k.json"),
                height: 300,
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
                    backgroundColor: Color.fromARGB(255, 121, 3, 206),
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
                          MaterialPageRoute(builder: (context) => Home()));
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
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassword()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 121, 3, 206),
                  ),
                  icon: const Icon(
                    Icons.password_rounded,
                    size: 20,
                  ),
                  label: const Text(
                    "Forget Password",
                    style: TextStyle(fontSize: 18),
                  )),
              SizedBox(
                height: 10,
              ),
              const Text(
                "Dont have an account",
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 2,
              ),
              SizedBox(
                height: 30,
                child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 121, 3, 206),
                    ),
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 20,
                    ),
                    label: const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
