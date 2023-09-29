import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Column(
        children: [
          Text("Payment method"),
          ElevatedButton(onPressed: (){}, child: Text("Pay"))
        ],
      ),
    );
  }
}
