// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, unused_field, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> deleteProduct(String productId, String userId) async {
    // Delete the product document
    await _firestore.collection('products').doc(productId).delete();

    // Check if there are any other products associated with the user
    final userProductsSnapshot = await _firestore
        .collection('products')
        .where('userId', isEqualTo: userId)
        .get();

    if (userProductsSnapshot.docs.isEmpty) {
      // If there are no other products associated with the user, delete the user document
      await _firestore.collection('users').doc(userId).delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 39, 58),
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('User Products'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('products').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<QueryDocumentSnapshot> products = snapshot.data!.docs;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                const DataColumn(
                  label: Text('User',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const DataColumn(
                  label: Text('Email',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const DataColumn(
                  label: Text('Product',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const DataColumn(
                  label: Text('Category',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const DataColumn(
                  label: Text('Actions',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
              rows: products.map((product) {
                var productData = product.data() as Map<String, dynamic>;
                String userId = productData['userId'];
                String productName = productData['p_name'];
                String productCategory = productData['p_category'];
                String productId = product.id;

                return DataRow(
                  cells: [
                    DataCell(
                      FutureBuilder<DocumentSnapshot>(
                        future:
                            _firestore.collection('users').doc(userId).get(),
                        builder: (context, userSnapshot) {
                          if (userSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          if (!userSnapshot.hasData ||
                              !userSnapshot.data!.exists) {
                            return const Text('User Not Found');
                          }
                          var userData =
                              userSnapshot.data!.data() as Map<String, dynamic>;
                          String userName = userData['userName'];
                          String userEmail = userData['email'];
                          return Text('$userName');
                        },
                      ),
                    ),
                    DataCell(
                      FutureBuilder<DocumentSnapshot>(
                        future:
                            _firestore.collection('users').doc(userId).get(),
                        builder: (context, userSnapshot) {
                          if (userSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          if (!userSnapshot.hasData ||
                              !userSnapshot.data!.exists) {
                            return const Text('User Not Found');
                          }
                          var userData =
                              userSnapshot.data!.data() as Map<String, dynamic>;
                          String userEmail = userData['email'];
                          return Text('$userEmail');
                        },
                      ),
                    ),
                    DataCell(Text('$productName')),
                    DataCell(Text('$productCategory')),
                    DataCell(
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          deleteProduct(productId, userId);
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
