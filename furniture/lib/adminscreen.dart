import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'approvedata.dart';
import 'add_data.dart';
import "adminselfmade.dart";

class Adminn extends StatefulWidget {
  final Map<String, dynamic> productData;
  final String productId;
  Adminn({Key? key, required this.productData, required this.productId})
      : super(key: key);
  // const Adminn({super.key});

  @override
  State<Adminn> createState() => _AdminnState();
}

class _AdminnState extends State<Adminn> {
  @override
  Widget build(BuildContext context) {
    final productData = widget.productData; // Access the product data

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 235, 233),
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(255, 203, 207, 215),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              productData['p_imgs'], // Use the product data here
              width: 200,
              height: 160,
              fit: BoxFit.fill,
            ),
            Text("Name: ${productData['p_name']}",
                style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 15, 39, 58))),
            SizedBox(height: 10),
            Text("Category: ${productData['p_category']}",
                style: TextStyle(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 15, 39, 58))),
            Text("Used Period: ${productData['p_used']}",
                style: TextStyle(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 15, 39, 58))),
            Text("Price: ${productData['p_price']}",
                style: TextStyle(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 15, 39, 58))),
            Text("Subcategory: ${productData['p_subcategory']}",
                style: TextStyle(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 15, 39, 58))),
            Text("Description: ${productData['p_desc']}",
                style: TextStyle(
                    fontSize: 13,
                    color: const Color.fromARGB(255, 15, 39, 58))),
            Text("Seller name: ${productData['p_seller']}",
                style: TextStyle(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 15, 39, 58))),
            SizedBox(height: 10),
            Text(
              "Seller location: ${productData['p_sellerloc']}",
              style: TextStyle(
                  fontSize: 13, color: const Color.fromARGB(255, 15, 39, 58)),
            ),
            Text("Seller number: ${productData['seller number']}",
                style: TextStyle(
                    fontSize: 13,
                    color: const Color.fromARGB(255, 15, 39, 58))),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    String productId = widget.productId.toString();
                    // 'KbnBI3F0tcfCznBdsC9v'; // Replace with the actual product ID
                    await StoreData().updateProductStatus(productId, 'true');
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Product Approved"),
                    ));
                  },
                  child: const Text('Approved'),
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Product Rejected"),
                    ));
                  },
                  child: const Text('Reject'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
