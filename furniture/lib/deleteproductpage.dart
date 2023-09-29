import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DeleteProductPage extends StatelessWidget {
  final String productId;
  final String currentImageUrl;

  DeleteProductPage({required this.productId, required this.currentImageUrl});

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
            title: Text('Product Deleted'),
            content: Text('The product has been deleted.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.of(context)
                      .pop(); // Navigate back to the previous screen
                },
                child: Text('OK'),
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
            title: Text('Error'),
            content: Text('Failed to delete the product.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('OK'),
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
      appBar: AppBar(
        title: Text('Delete Product'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.pink,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Are you sure you want to delete this product?',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    deleteProduct(context); // Call the deleteProduct function
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
