// import 'package:flutter/material.dart';
// class Sofa extends StatefulWidget {
//   const Sofa({super.key});

//   @override
//   State<Sofa> createState() => _SofaState();
// }

// class _SofaState extends State<Sofa> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ,
//       appBar: AppBar(

//       ),
//       body: Column(
//         children: [
//         Image.asset('images/darkgrey.jpg',height: 200,width: double.infinity,),
//         Text("Dark Grey Sofa"),
//         Text("Nrs 800"),
//         Text("Category: Sofa"),
//         Text("Seller Details"),
//         Text("Seller name:Namuna Sharma"),
//         Text("Seller number:987665432"),
//         Text("Seller location:Banasathali"),

// ignore_for_file: file_names, prefer_const_constructors, deprecated_member_use, unused_import

//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:furniture/category_screen/item_details.dart';
import 'package:furniture/category_screen/payment.dart';

class Sofa extends StatefulWidget {
  const Sofa({Key? key}) : super(key: key);

  @override
  State<Sofa> createState() => _SofaState();
}

class _SofaState extends State<Sofa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set your desired background color here
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 35, 47),
        title: Text("Product Details"), // Add a title for your app bar
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/darkgrey.jpg',
              height: 500,
              width: double.infinity,
              fit: BoxFit.cover, // Ensure the image covers the entire width
            ),
            SizedBox(height: 16), // Add some spacing
            Text(
              "Dark Grey Sofa",
              style: TextStyle(
                fontSize: 24, // Increase font size
                fontWeight: FontWeight.bold, // Make the text bold
              ),
            ),
            SizedBox(height: 8), // Add some spacing
            Text(
              "Nrs 800",
              style: TextStyle(
                fontSize: 18, // Customize font size
                color: Colors.green, // Change text color
              ),
            ),
            SizedBox(height: 16), // Add some spacing
            Text(
              "Category: Sofa",
              style: TextStyle(
                fontSize: 16, // Customize font size
              ),
            ),
            SizedBox(height: 24), // Add some spacing
            Divider(
              color: Colors.grey, // Add a divider line
            ),
            SizedBox(height: 16), // Add some spacing
            Text(
              "Seller Details",
              style: TextStyle(
                fontSize: 20, // Customize font size
                fontWeight: FontWeight.bold, // Make the text bold
              ),
            ),
            SizedBox(height: 8), // Add some spacing
            Text(
              "Seller name: Namuna Sharma",
              style: TextStyle(
                fontSize: 16, // Customize font size
              ),
            ),
            Text(
              "Seller number: 987665432",
              style: TextStyle(
                fontSize: 16, // Customize font size
              ),
            ),
            Text(
              "Seller location: Banasathali",
              style: TextStyle(
                fontSize: 16, // Customize font size
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 94, 93, 95),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ItemDetails(
                              title: '',
                            )),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(12.0),
                  primary: Color.fromARGB(255, 8, 35, 47),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Buy",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ), // Add some spacing
          ],
        ),
      ),
    );
  }
}
