import 'package:flutter/material.dart';
import 'package:furniture/useroradmin.dart';
// import 'useroradmin.dart';
class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 239, 238, 241),
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/image 7.webp'), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Text(
              "Find the best                       Second-Hand Furniture !",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                  fontSize: 35),
            ),
          ),
          SizedBox(
            height: 250,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserorAdmin(),
                ),
              );
            },
            child: Text('Get Started'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown, elevation: 100),
          ),
        ],
      ),
    ));
  }
}