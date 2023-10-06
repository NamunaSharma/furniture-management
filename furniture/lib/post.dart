// ignore_for_file: depend_on_referenced_packages, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors, duplicate_ignore, unused_local_variable

import 'package:flutter/material.dart';
import 'package:furniture/updateproductpage.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:furniture/addproduct.dart';
import 'package:furniture/postproductdetails.dart';
import 'package:velocity_x/velocity_x.dart';

class Post extends StatelessWidget {
  const Post({Key? key});

  get productId => null;

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now());

    final User? user =
        FirebaseAuth.instance.currentUser; // Get the current user

    return Scaffold(
      backgroundColor: Colors.white,
      // Color.fromARGB(255, 155, 153, 153),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 8, 35, 47),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProduct()),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Post a Product",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        backgroundColor: Color.fromARGB(255, 8, 35, 47),
        actions: [
          Center(
            child: Text(
              formattedDate,
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('products')
            .where('userId', isEqualTo: user?.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No products available.'),
            );
          } else {
            final products = snapshot.data!.docs;

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final productData =
                    products[index].data() as Map<String, dynamic>;
                final String productName = productData['p_name'] ?? '';
                final String productPrice = productData['p_price'] ?? '';
                final bool isProductApproved =
                    productData['p_approved'] == 'true';

                // Retrieve the image URL for the product
                final String imageUrl = productData['p_img'] ?? '';
                // final String imageUrl = productData['p_img'] ?? '';

                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(
                          title: productName,
                        ),
                      ),
                    );
                  },
                  tileColor: const Color.fromARGB(231, 255, 255, 255),

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.black)),
                  leading: SizedBox(
                    width: 80,
                    height: 100,
                    child: Image.network(
                      productData['p_imgs'], // Use the product data here
                      width: 200,
                      height: 60,
                      fit: BoxFit.fill,
                    ), // Use the appropriate fit
                  ),
                  //  Image.network(
                  //   imageUrl, // Use the product image URL here
                  //   width: 200,
                  //   height: 60,
                  //   fit: BoxFit.fill,
                  // ),

                  title: Text(
                    productName,
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    "Price: $productPrice",
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: isProductApproved
                      ? null
                      : IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateProductPage(
                                        productId: products[index].id)));
                          },
                        ),
                ).box.margin(EdgeInsets.only(bottom: 8)).make();
              },
            );
          }
        },
      ),
    );
  }
}
