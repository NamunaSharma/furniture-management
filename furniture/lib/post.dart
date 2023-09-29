// // import 'package:flutter/material.dart';
// // import 'package:furniture/updateproductpage.dart';
// // import 'package:intl/intl.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:furniture/addproduct.dart';
// // import 'package:furniture/postproductdetails.dart';
// // import 'package:velocity_x/velocity_x.dart';

// // class Post extends StatelessWidget {
// //   const Post({Key? key});

// //   @override
// //   Widget build(BuildContext context) {
// //     String formattedDate =
// //         DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now());

// //     return Scaffold(
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(builder: (context) => AddProduct()),
// //           );
// //         },
// //         child: Icon(Icons.add),
// //       ),
// //       appBar: AppBar(
// //         automaticallyImplyLeading: false,
// //         title: Text(
// //           "Post a Product",
// //           style: TextStyle(color: Colors.white, fontSize: 16),
// //         ),
// //         backgroundColor: Colors.orange,
// //         actions: [
// //           Center(
// //             child: Text(
// //               formattedDate,
// //               style: TextStyle(color: Colors.purple),
// //             ),
// //           ),
// //         ],
// //       ),
// //       body: StreamBuilder<QuerySnapshot>(
// //           // Listen to changes in the products collection in real-time
// //           stream: FirebaseFirestore.instance.collection('products').snapshots(),
// //           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return CircularProgressIndicator();
// //             } else if (snapshot.hasError) {
// //               return Text('Error: ${snapshot.error}');
// //             } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// //               return Center(
// //                 child: Text('No products available.'),
// //               );
// //             } else {
// //               // Display the product list
// //               final products = snapshot.data!.docs;
// //               return ListView.builder(
// //                 itemCount: snapshot.data!.docs.length,
// //                 itemBuilder: (context, index) {
// //                   final productData =
// //                       products[index].data() as Map<String, dynamic>;
// //                   final String productName = productData['p_name'] ?? '';
// //                   final String productPrice = productData['p_price'] ?? '';
// //                   final bool isProductApproved =
// //                       productData['p_approved'] == 'true';
// //                   final String imageURL = productData['p_imgs'] ?? '';

// //                   return ListTile(
// //                     onTap: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) => ProductDetails(
// //                             title: productName,
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                     tileColor: Colors.grey,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(20),
// //                     ),
// //                     leading: SizedBox(
// //                       width: 100,
// //                       height: 100,
// //                       child: Image.network(
// //                         imageURL,
// //                         width: 50,
// //                         height: 50,
// //                         fit: BoxFit.cover,
// //                         errorBuilder: (context, error, stackTrace) {
// //                           // Display a placeholder or error message when the image fails to load
// //                           return Icon(Icons.error);
// //                         },
// //                       ),
// //                     ),
// //                     title: Text(
// //                       productName,
// //                       style: TextStyle(color: Colors.black),
// //                     ),
// //                     subtitle: Text(
// //                       "Price: $productPrice",
// //                       style: TextStyle(color: Colors.black),
// //                     ),
// //                     trailing: isProductApproved
// //                         ? null
// //                         : IconButton(
// //                             icon: Icon(Icons.edit),
// //                             onPressed: () {
// //                               Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                   builder: (context) => UpdateProductPage(
// //                                     productId: products[index].id,
// //                                   ),
// //                                 ),
// //                               );
// //                             },
// //                           ),
// //                   ).box.margin(EdgeInsets.only(bottom: 8)).make();
// //                 },
// //               );
// //             }
// //             // ...
// //             // return ListView.builder(
// //             //   itemCount: snapshot.data!.docs.length,
// //             //   itemBuilder: (context, index) {
// //             //     final productData =
// //             //         products[index].data() as Map<String, dynamic>;
// //             //     final String productName = productData['p_name'] ?? '';
// //             //     final String productPrice = productData['p_price'] ?? '';
// //             //     final bool isProductApproved =
// //             //         productData['p_approved'] == 'true';
// //             //     final String firstImage = productData['p_imgs'] ?? '';

// //             //     return ListTile(
// //             //       onTap: () {
// //             //         Navigator.push(
// //             //           context,
// //             //           MaterialPageRoute(
// //             //             builder: (context) => ProductDetails(
// //             //               title: productName,
// //             //             ),
// //             //           ),
// //             //         );
// //             //       },
// //             //       tileColor: Colors.grey,
// //             //       shape: RoundedRectangleBorder(
// //             //         borderRadius: BorderRadius.circular(20),
// //             //       ),
// //             //       leading: SizedBox(
// //             //         width: 100,
// //             //         height: 100,
// //             //         child: Image.network(
// //             //           firstImage,
// //             //           width: 50,
// //             //           height: 50,
// //             //           fit: BoxFit.cover,
// //             //           errorBuilder: (context, error, stackTrace) {
// //             //             // Display a placeholder or error message when the image fails to load
// //             //             return Icon(Icons.error);
// //             //           },
// //             //         ),
// //             //       ),
// //             //       title: Text(
// //             //         productName,
// //             //         style: TextStyle(color: Colors.black),
// //             //       ),
// //             //       subtitle: Text(
// //             //         "Price: $productPrice",
// //             //         style: TextStyle(color: Colors.black),
// //             //       ),
// //             //       trailing: isProductApproved
// //             //           ? null
// //             //           : IconButton(
// //             //               icon: Icon(Icons.edit),
// //             //               onPressed: () {
// //             //                 Navigator.push(
// //             //                   context,
// //             //                   MaterialPageRoute(
// //             //                     builder: (context) => UpdateProductPage(
// //             //                       productId: products[index].id,
// //             //                     ),
// //             //                   ),
// //             //                 );
// //             //               },
// //             //             ),
// //             //     ).box.margin(EdgeInsets.only(bottom: 8)).make();
// //             //   },
// //             // );
// //           }),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:furniture/addproduct.dart';
// import 'package:furniture/postproductdetails.dart';
// import 'package:furniture/updateproductpage.dart';
// import 'package:intl/intl.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:velocity_x/velocity_x.dart';

// class Post extends StatelessWidget {
//   const Post({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     String formattedDate =
//         DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now());

//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => AddProduct()),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text(
//           "Post a Product",
//           style: TextStyle(color: Colors.white, fontSize: 16),
//         ),
//         backgroundColor: Colors.orange,
//         actions: [
//           Center(
//             child: Text(
//               formattedDate,
//               style: TextStyle(color: Colors.purple),
//             ),
//           ),
//         ],
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('products').snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(
//               child: Text('No products available.'),
//             );
//           } else {
//             final products = snapshot.data!.docs;

//             return ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (context, index) {
//                 final productData =
//                     products[index].data() as Map<String, dynamic>;
//                 final String productName = productData['p_name'] ?? '';
//                 final String productPrice = productData['p_price'] ?? '';
//                 final bool isProductApproved =
//                     productData['p_approved'] == 'true';
//                 final String imageURL = productData['p_imgs'] ?? '';
//                 print(imageURL);

//                 return ListTile(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ProductDetails(
//                           title: productName,
//                         ),
//                       ),
//                     );
//                   },
//                   tileColor: Colors.grey,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   leading: SizedBox(
//                     width: 100,
//                     height: 100,
//                     child: CircleAvatar(
//                       radius: 40,
//                       child: Image.network(
//                         imageURL,
//                         width: 50,
//                         height: 50,
//                         fit: BoxFit.cover,
//                         errorBuilder: (context, error, stackTrace) {
//                           // Display a placeholder or error message when the image fails to load
//                           return Icon(Icons.error);
//                         },
//                       ),
//                     ),
//                   ),
//                   title: Text(
//                     productName,
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   subtitle: Text(
//                     "Price: $productPrice",
//                     style: TextStyle(color: Colors.black),
// //                   ),
// //                   trailing: isProductApproved
// //                       ? null
// //                       : IconButton(
// //                           icon: Icon(Icons.edit),
// //                           onPressed: () {
// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(
// //                                 builder: (context) => UpdateProductPage(
// //                                   productId: products[index].id,
// //                                 ),
// //                               ),
// //                             );
// //                           },
// //                         ),
// //                 ).box.margin(EdgeInsets.only(bottom: 8)).make();
// //               },
// //             );
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:furniture/updateproductpage.dart';
// import 'package:intl/intl.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:furniture/addproduct.dart';
// import 'package:furniture/postproductdetails.dart';
// import 'package:velocity_x/velocity_x.dart';

// class Post extends StatelessWidget {
//   const Post({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     String formattedDate =
//         DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now());

//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => AddProduct()),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text(
//           "Post a Product",
//           style: TextStyle(color: Colors.white, fontSize: 16),
//         ),
//         backgroundColor: Colors.orange,
//         actions: [
//           Center(
//             child: Text(
//               formattedDate,
//               style: TextStyle(color: Colors.purple),
//             ),
//           ),
//         ],
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         // Listen to changes in the products collection in real-time
//         stream: FirebaseFirestore.instance.collection('products').snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(
//               child: Text('No products available.'),
//             );
//           } else {
//             // Display the product list
//             final products = snapshot.data!.docs;
//             // ...
//             return // ...
// // ...
// // ...// ...
// // ...

//                 ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (context, index) {
//                 final productData =
//                     products[index].data() as Map<String, dynamic>;
//                 final String productName = productData['p_name'] ?? '';
//                 final String productPrice = productData['p_price'] ?? '';
//                 final bool isProductApproved =
//                     productData['p_approved'] == 'true';

//                 // Retrieve the list of image URLs from the 'p_imgs' field
//                 // final productImages = productData['p_imgs'] ?? [];

//                 return ListTile(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ProductDetails(
//                           title: productName,
//                         ),
//                       ),
//                     );
//                   },
//                   tileColor: Colors.grey,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   leading: SizedBox(
//                     width: 100,
//                     height: 100,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: snapshot.data!.docs.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: EdgeInsets.only(right: 4.0),
//                           child: Image.network(
//                             productData['p_imgs'], // Use the product data here
//                             // width: 200,
//                             // height: 160,
//                             fit: BoxFit.fitHeight,
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   title: Text(
//                     productName,
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   subtitle: Text(
//                     "Price: $productPrice",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   trailing: isProductApproved
//                       ? null
//                       : IconButton(
//                           icon: Icon(Icons.edit),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => UpdateProductPage(
//                                   productId: products[index].id,
//                                 ),
//                               ),
//                             );
//                             // Handle edit button click here
//                           },
//                         ),
//                 ).box.margin(EdgeInsets.only(bottom: 8)).make();
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:furniture/updateproductpage.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furniture/addproduct.dart';
import 'package:furniture/postproductdetails.dart';
import 'package:velocity_x/velocity_x.dart';

class Post extends StatelessWidget {
  const Post({Key? key});

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
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
        backgroundColor: Colors.orange,
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
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
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
                  tileColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
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
                                  productId: products[index].id,
                                ),
                              ),
                            );
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
