// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DeleteProductPage extends StatelessWidget {
  final String productId;
  final String currentImageUrl;

  const DeleteProductPage(
      {required this.productId, required this.currentImageUrl});

  Future<void> deleteProduct(BuildContext context) async {
    try {
      // Delete the product document from Firestore
      await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .delete();

      // If an image is associated with the product, delete it from Firebase Storage
      if (currentImageUrl.isNotEmpty) {
        Reference storageRef =
            FirebaseStorage.instance.refFromURL(currentImageUrl);
        await storageRef.delete();
      }

      // Show a confirmation dialog and navigate back to the previous screen
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Product Deleted'),
            content: const Text('The product has been deleted.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.of(context)
                      .pop(); // Navigate back to the previous screen
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (error) {
      print("Error deleting product: $error");
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to delete the product.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Delete Product'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Are you sure you want to delete this product?',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    deleteProduct(context); // Call the deleteProduct function
                  },
                  child: const Text('Delete'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
