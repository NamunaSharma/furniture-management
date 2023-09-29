import 'package:flutter/material.dart';
import 'login_singnup/adminlogin.dart';
import 'login_singnup/loginpage.dart';

class UserorAdmin extends StatefulWidget {
  const UserorAdmin({Key? key}) : super(key: key);

  @override
  State<UserorAdmin> createState() => _UserorAdminState();
}

class _UserorAdminState extends State<UserorAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 55, 17, 151),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Are you a user or an admin ?",
                  style: TextStyle(
                      fontSize: 25, color: Color.fromRGBO(250, 250, 250, 1)),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminLogin(),
                      ),
                    );
                  },
                  child: Text(
                    'Admin',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    'User',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
