import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final String userId;

  const ProductDetailsPage({Key? key, required this.userId}) : super(key: key);

  @override
  ProductDetails createState() => ProductDetails();
}

class ProductDetails extends State<ProductDetailsPage> {
  late Future<DocumentSnapshot> userFuture;
  late Query productQuery;

  @override
  void initState() {
    super.initState();
    userFuture = fetchUserDetails(widget.userId);
    productQuery = FirebaseFirestore.instance
        .collection('products')
        .where('userId', isEqualTo: widget.userId);
  }

  Future<DocumentSnapshot> fetchUserDetails(String userId) async {
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return userSnapshot;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: userFuture,
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!userSnapshot.hasData) {
            return Center(child: Text('User not found'));
          }

          String userName = userSnapshot.data!['userName'];
          String email = userSnapshot.data!['email'];

          return StreamBuilder<QuerySnapshot>(
            stream: productQuery.snapshots(),
            builder: (context, productSnapshot) {
              if (productSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              int numberOfProducts = productSnapshot.data!.docs.length;

              return SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User ID: ${widget.userId}',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      'User Name: $userName',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      'Email: $email',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    // Text(
                    //   'Number of Products Posted: $numberOfProducts',
                    //   style: TextStyle(fontSize: 18.0),
                    // ),
                    SizedBox(height: 16.0),
                    Text(
                      'Products Posted:',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 8.0),
                    if (numberOfProducts > 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: productSnapshot.data!.docs
                            .map((doc) => Text(
                                  doc['p_name'],
                                  style: TextStyle(fontSize: 16.0),
                                ))
                            .toList(),
                      )
                    else
                      Text(
                        'No products posted yet.',
                        style: TextStyle(fontSize: 16.0),
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
