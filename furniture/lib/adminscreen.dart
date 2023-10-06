// ignore_for_file: unused_import, prefer_const_constructors_in_immutables, prefer_const_constructors, use_build_context_synchronously, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
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

  @override
  State<Adminn> createState() => _AdminnState();
}

class _AdminnState extends State<Adminn> {
  @override
  Widget build(BuildContext context) {
    final productData = widget.productData; // Access the product data

    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: const Color.fromARGB(255, 233, 235, 233),
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: const Color.fromARGB(255, 15, 39, 58),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  productData['p_imgs'],
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Name: ${productData['p_name']}",
                style: TextStyle(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 15, 39, 58),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Category: ${productData['p_category']}",
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 15, 39, 58),
                ),
              ),
              Text(
                "Used Period: ${productData['p_used']}",
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 15, 39, 58),
                ),
              ),
              Text(
                "Price: ${productData['p_price']}",
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 15, 39, 58),
                ),
              ),
              // Text(
              //   "Subcategory: ${productData['p_subcategory']}",
              //   style: TextStyle(
              //     fontSize: 16,
              //     color: const Color.fromARGB(255, 15, 39, 58),
              //   ),
              // ),
              SizedBox(height: 10),
              Text(
                "Description:",
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 15, 39, 58),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${productData['p_desc']}",
                style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 15, 39, 58),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Seller Information",
                style: TextStyle(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 15, 39, 58),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Seller Name: ${productData['p_seller']}",
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 15, 39, 58),
                ),
              ),
              Text(
                "Seller Location: ${productData['p_sellerloc']}",
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 15, 39, 58),
                ),
              ),
              Text(
                "Seller Number: ${productData['seller number']}",
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 15, 39, 58),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 15, 39, 58),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    child: const Text(
                      'Approve',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Product Rejected"),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 15, 39, 58),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    child: const Text(
                      'Reject',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
