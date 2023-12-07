// // // ignore_for_file: unused_import, prefer_const_constructors

// // import 'package:flutter/material.dart';
// // import 'package:furniture/category_screen/payment.dart';
// // import 'package:furniture/consts/lists.dart';
// // import 'package:velocity_x/velocity_x.dart';

// // class ItemDetails extends StatelessWidget {
// //   final String? title;
// //   final dynamic data;
// //   const ItemDetails({Key? key, required this.title, this.data})
// //       : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Color.fromARGB(255, 241, 235, 235),
// //       appBar: AppBar(
// //           backgroundColor: Color.fromARGB(255, 8, 35, 47),
// //           title: title!.text.white.fontWeight(FontWeight.bold).make(),
// //           actions: [
// //             IconButton(
// //                 onPressed: () {},
// //                 icon: Icon(
// //                   Icons.share,
// //                   color: Colors.white,
// //                 )),
// //           ]),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: Padding(
// //               padding: EdgeInsets.all(8.0),
// //               child: SingleChildScrollView(
// //                 child: Column(
// //                   children: [
// //                     VxSwiper.builder(
// //                       autoPlay: true,
// //                       height: 250.0,
// //                       itemCount: data['p_imgs'].length,
// //                       aspectRatio: 16 / 9,
// //                       // viewportFraction: 1,
// //                       itemBuilder: (context, index) {
// //                         return Image.network(
// //                           "${data['p_imgs']}",
// //                           // data['p_imgs'],
// //                           width: 160,
// //                           height: 110,
// //                           fit: BoxFit.fill,
// //                         );

// //                         // Image.network(
// //                         //   data["p_imgs"][index],
// //                         //   width: double.infinity,
// //                         //   fit: BoxFit.fill,
// //                         // );
// //                       },
// //                     ),
// //                     10.heightBox,
// //                     //title and details
// //                     title!.text.bold
// //                         .size(20)
// //                         .color(
// //                           Color.fromARGB(255, 8, 35, 47),
// //                         )
// //                         .fontWeight(FontWeight.bold)
// //                         .make(),
// //                     10.heightBox,
// //                     "${data['p_price']}"
// //                         .text
// //                         .color(
// //                           Color.fromARGB(255, 8, 35, 47),
// //                         )
// //                         .fontWeight(FontWeight.bold)
// //                         .size(18)
// //                         .make(),
// //                     10.heightBox,
// //                     10.heightBox,
// //                     "Description"
// //                         .text
// //                         .bold
// //                         .size(15)
// //                         .color(Color.fromARGB(255, 8, 1, 0))
// //                         .fontWeight(FontWeight.bold)
// //                         .make(),
// //                     10.heightBox,
// //                     "${data['p_desc']}"
// //                         .text
// //                         .color(const Color.fromARGB(255, 0, 0, 0))
// //                         .make(),
// //                     Row(
// //                       children: [
// //                         Expanded(
// //                             child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               "Seller Details:",
// //                               style: TextStyle(
// //                                 fontSize: 18,
// //                                 color: Color.fromARGB(255, 8, 35, 47),
// //                               ),
// //                             ),
// //                             "Seller"
// //                                 .text
// //                                 .white
// //                                 .fontWeight(FontWeight.bold)
// //                                 .color(
// //                                   Color.fromARGB(255, 8, 35, 47),
// //                                 )
// //                                 .make(),
// //                             5.heightBox,
// //                             "${data['p_seller']}"
// //                                 .text
// //                                 .fontWeight(FontWeight.bold)
// //                                 .color(
// //                                   Color.fromARGB(255, 8, 35, 47),
// //                                 )
// //                                 .size(13)
// //                                 .make(),
// //                             3.heightBox,
// //                             Row(
// //                               children: [
// //                                 "Used for:"
// //                                     .text
// //                                     .fontWeight(FontWeight.bold)
// //                                     .color(
// //                                       Color.fromARGB(255, 8, 35, 47),
// //                                     )
// //                                     .make(),
// //                                 "${data['p_used']}"
// //                                     .text
// //                                     .fontWeight(FontWeight.bold)
// //                                     .color(Colors.black)
// //                                     .size(13)
// //                                     .make(),
// //                               ],
// //                             ),
// //                             3.heightBox,
// //                             Row(
// //                               children: [
// //                                 "Address =:"
// //                                     .text
// //                                     .fontWeight(FontWeight.bold)
// //                                     .color(
// //                                       Color.fromARGB(255, 8, 35, 47),
// //                                     )
// //                                     .make(),
// //                                 "${data['p_sellerloc']}"
// //                                     .text
// //                                     .fontWeight(FontWeight.bold)
// //                                     .color(Colors.black)
// //                                     .size(13)
// //                                     .make(),
// //                               ],
// //                             ),
// //                           ],
// //                         )),
// //                       ],
// //                     )
// //                         .box
// //                         .height(100.0)
// //                         .padding(EdgeInsets.symmetric(horizontal: 16))
// //                         .color(Color.fromARGB(255, 202, 200, 200))
// //                         .make(),

// // ignore_for_file: unused_import, duplicate_ignore, prefer_const_constructors, deprecated_member_use

// // ignore_for_file: unused_import

// // ignore_for_file: unused_import

// // ignore_for_file: unused_import

// //                     //description
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Container(
// //             width: double.infinity,
// //             height: 60.0,
// //             decoration: BoxDecoration(
// //               color: Color.fromARGB(255, 94, 93, 95),
// //               borderRadius: BorderRadius.circular(8),
// //             ),
// //             child: ElevatedButton(
// //               onPressed: () {
// //                 Navigator.push(context,
// //                     MaterialPageRoute(builder: (context) => Payment()));
// //                 // Handle button press here
// //               },
// //               style: ElevatedButton.styleFrom(
// //                 padding: EdgeInsets.all(12.0),
// //                 backgroundColor: Color.fromARGB(255, 8, 35, 47),
// //               ),
// //               child: Text(
// //                 "Buy ",
// //                 style: TextStyle(
// //                   color: Colors.white,
// //                   fontSize: 18.0,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_paypal/flutter_paypal.dart';
// import 'package:furniture/category_screen/constants.dart';
// import 'package:furniture/category_screen/payment.dart';
// import 'package:furniture/consts/lists.dart';
// import 'package:velocity_x/velocity_x.dart';

// class ItemDetails extends StatelessWidget {
//   final String? title;
//   final dynamic data;
//   const ItemDetails({Key? key, required this.title, this.data})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 8, 35, 47),
//         // backgroundColor: Color.fromARGB(255, 125, 87, 63),
//         iconTheme: IconThemeData(color: Colors.white), // Corrected iconTheme
//         title: Text(
//           title!,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white, // Set the title text color
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.all(8.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Image.network(
//                       "${data['p_imgs']}",
//                       // data['p_imgs'],
//                       height: 400,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                     10.heightBox,
//                     title!.text.bold
//                         .size(24)
//                         .color(Color.fromARGB(255, 8, 35, 47))
//                         .make(),
//                     10.heightBox,
//                     "${data['p_price']}".text.bold.size(18).make(),
//                     10.heightBox,
//                     "Description"
//                         .text
//                         .bold
//                         .size(15)
//                         .color(Color.fromARGB(255, 8, 1, 0))
//                         .make(),
//                     10.heightBox,
//                     "${data['p_desc']}".text.size(14).make(),
//                     Divider(),
//                     Text(
//                       "Seller Details:",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Color.fromARGB(255, 8, 35, 47),
//                       ),
//                     ),
//                     "Seller: ${data['p_seller']}".text.bold.size(16).make(),
//                     "Used for: ${data['p_used']}".text.bold.size(16).make(),
//                     "Address: ${data['p_sellerloc']}".text.bold.size(16).make(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Container(
//               width: double.infinity,
//               height: 60.0,
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 94, 93, 95),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (BuildContext context) => UsePaypal(
//                             sandboxMode: true,
//                             clientId: "${Constants.clientId}",
//                             secretKey: "${Constants.secretKey}",
//                             returnURL: "${Constants.returnURL}",
//                             cancelURL: "${Constants.cancelURL}",
//                             transactions: const [
//                               {
//                                 "amount": {
//                                   "total": '10.12',
//                                   "currency": "USD",
//                                   "details": {
//                                     "subtotal": '10.12',
//                                     "shipping": '0',
//                                     "shipping_discount": 0
//                                   }
//                                 },
//                                 "description":
//                                     "The payment transaction description.",
//                                 // "payment_options": {
//                                 //   "allowed_payment_method":
//                                 //       "INSTANT_FUNDING_SOURCE"
//                                 // },
//                                 "item_list": {
//                                   "items": [
//                                     {
//                                       "name": "A demo product",
//                                       "quantity": 1,
//                                       "price": '10.12',
//                                       "currency": "USD"
//                                     }
//                                   ],

//                                   // shipping address is not required though
//                                   "shipping_address": {
//                                     "recipient_name": "Jane Foster",
//                                     "line1": "Travis County",
//                                     "line2": "",
//                                     "city": "Austin",
//                                     "country_code": "US",
//                                     "postal_code": "73301",
//                                     "phone": "+00000000",
//                                     "state": "Texas"
//                                   },
//                                 }
//                               }
//                             ],
//                             note: "Contact us for any questions on your order.",
//                             onSuccess: (Map params) async {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text("Payment successful")),
//                               );
//                               print("onSuccess: $params");
//                             },
//                             onError: (error) {
//                               print("onError: $error");
//                             },
//                             onCancel: (params) {
//                               print('cancelled: $params');
//                             }),
//                       ),
//                     );
//                   },
//                   child: Text('Pay With PayPal'))),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_paypal/flutter_paypal.dart';
// import 'package:furniture/category_screen/constants.dart';
// import 'package:furniture/category_screen/payment.dart';
// import 'package:furniture/consts/lists.dart';
// import 'package:velocity_x/velocity_x.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ItemDetails extends StatefulWidget {
//   final String? title;
//   final dynamic data;
//   const ItemDetails({Key? key, required this.title, this.data})
//       : super(key: key);

//   @override
//   _ItemDetailsState createState() => _ItemDetailsState();
// }

// class _ItemDetailsState extends State<ItemDetails> {
//   late ScaffoldMessengerState _scaffoldMessenger;
//   bool isProductBought = false;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize isProductBought based on saved value
//     loadProductBoughtStatus();
//   }

//   Future<void> loadProductBoughtStatus() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       isProductBought = prefs.getBool('isProductBought') ?? false;
//     });
//   }

//   Future<void> saveProductBoughtStatus(bool value) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setBool('isProductBought', value);
//   }

// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, avoid_print

//   @override
//   Widget build(BuildContext context) {
//     _scaffoldMessenger = ScaffoldMessenger.of(context);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 8, 35, 47),
//         iconTheme: IconThemeData(color: Colors.white),
//         title: Text(
//           widget.title!,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.all(8.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Image.network(
//                       "${widget.data['p_imgs']}",
//                       height: 400,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                     10.heightBox,
//                     widget.title!.text.bold
//                         .size(24)
//                         .color(Color.fromARGB(255, 8, 35, 47))
//                         .make(),
//                     10.heightBox,
//                     "${widget.data['p_price']}".text.bold.size(18).make(),
//                     10.heightBox,
//                     "Description"
//                         .text
//                         .bold
//                         .size(15)
//                         .color(Color.fromARGB(255, 8, 1, 0))
//                         .make(),
//                     10.heightBox,
//                     "${widget.data['p_desc']}".text.size(14).make(),
//                     Divider(),
//                     Text(
//                       "Seller Details:",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Color.fromARGB(255, 8, 35, 47),
//                       ),
//                     ),
//                     "Seller: ${widget.data['p_seller']}"
//                         .text
//                         .bold
//                         .size(16)
//                         .make(),
//                     "Used for: ${widget.data['p_used']}"
//                         .text
//                         .bold
//                         .size(16)
//                         .make(),
//                     "Address: ${widget.data['p_sellerloc']}"
//                         .text
//                         .bold
//                         .size(16)
//                         .make(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Visibility(
//             visible: !isProductBought,
//             child: Container(
//               width: double.infinity,
//               height: 60.0,
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 94, 93, 95),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (BuildContext context) => UsePaypal(
//                         sandboxMode: true,
//                         clientId: "${Constants.clientId}",
//                         secretKey: "${Constants.secretKey}",
//                         returnURL: "${Constants.returnURL}",
//                         cancelURL: "${Constants.cancelURL}",
//                         transactions: const [
//                           {
//                             "amount": {
//                               "total": '10.12',
//                               "currency": "USD",
//                               "details": {
//                                 "subtotal": '10.12',
//                                 "shipping": '0',
//                                 "shipping_discount": 0
//                               }
//                             },
//                             "description":
//                                 "The payment transaction description.",
//                             "item_list": {
//                               "items": [
//                                 {
//                                   "name": "A demo product",
//                                   "quantity": 1,
//                                   "price": '10.12',
//                                   "currency": "USD"
//                                 }
//                               ],
//                               "shipping_address": {
//                                 "recipient_name": "Jane Foster",
//                                 "line1": "Travis County",
//                                 "line2": "",
//                                 "city": "Austin",
//                                 "country_code": "US",
//                                 "postal_code": "73301",
//                                 "phone": "+00000000",
//                                 "state": "Texas"
//                               },
//                             }
//                           }
//                         ],
//                         note: "Contact us for any questions on your order.",
//                         onSuccess: (Map params) async {
//                           print("onSuccess: $params");
//                           setState(() {
//                             isProductBought = true;
//                           });
//                           // Save the updated isProductBought status
//                           saveProductBoughtStatus(true);
//                           _scaffoldMessenger.showSnackBar(
//                             const SnackBar(
//                               content: Text("Payment done successfully"),
//                               backgroundColor: Color.fromARGB(255, 22, 23, 23),
//                             ),
//                           );
//                         },
//                         onError: (error) {
//                           print("onError: $error");
//                         },
//                         onCancel: (params) {
//                           print('cancelled: $params');
//                         },
//                       ),
//                     ),
//                   );
//                 },
//                 child: Text('Pay With PayPal'),
//               ),
//             ),
//           ),
//           Visibility(
//             visible: isProductBought,
//             child: Container(
//               width: double.infinity,
//               height: 60.0,
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 94, 93, 95),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Center(
//                 child: Text(
//                   'Item Already Bought',
//                   style: TextStyle(
//                     color: Colors.red,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:furniture/category_screen/constants.dart';
import 'package:furniture/login_singnup/loginpage.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemDetails extends StatefulWidget {
  final String? title;
  final dynamic data;
  const ItemDetails({Key? key, required this.title, this.data})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  late ScaffoldMessengerState _scaffoldMessenger;
  bool isProductBought = false;

  @override
  void initState() {
    super.initState();
    // Initialize isProductBought based on saved value
    loadProductBoughtStatus();
  }

  Future<void> loadProductBoughtStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isProductBought =
          prefs.getBool('isProductBought_${widget.data['p_name']}') ?? false;
    });
  }

  Future<void> saveProductBoughtStatus(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isProductBought_${widget.data['p_name']}', value);
  }

  void showReceiptScreen() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Payment Receipt'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product Name: ${widget.data['p_name']}',
                style: TextStyle(color: Colors.black),
              ),
              Text('Price: ${widget.data['p_price']}'),
              Text(
                  'Transaction ID:'), // You can fetch and display the actual transaction ID here
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                // Redirect to login screen or any other screen after payment
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Checkout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 35, 47),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.title!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      "${widget.data['p_imgs']}",
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    10.heightBox,
                    widget.title!.text.bold
                        .size(24)
                        .color(Color.fromARGB(255, 8, 35, 47))
                        .make(),
                    10.heightBox,
                    "${widget.data['p_price']}".text.bold.size(18).make(),
                    10.heightBox,
                    "Description"
                        .text
                        .bold
                        .size(15)
                        .color(Color.fromARGB(255, 8, 1, 0))
                        .make(),
                    10.heightBox,
                    "${widget.data['p_desc']}".text.size(14).make(),
                    Divider(),
                    Text(
                      "Seller Details:",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 8, 35, 47),
                      ),
                    ),
                    "Seller: ${widget.data['p_seller']}"
                        .text
                        .bold
                        .size(16)
                        .make(),
                    "Used for: ${widget.data['p_used']}"
                        .text
                        .bold
                        .size(16)
                        .make(),
                    "Address: ${widget.data['p_sellerloc']}"
                        .text
                        .bold
                        .size(16)
                        .make(),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: !isProductBought,
            child: Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 94, 93, 95),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => UsePaypal(
                        sandboxMode: true,
                        clientId: "${Constants.clientId}",
                        secretKey: "${Constants.secretKey}",
                        returnURL: "${Constants.returnURL}",
                        cancelURL: "${Constants.cancelURL}",
                        transactions: const [
                          {
                            "amount": {
                              "total": '10.12',
                              "currency": "USD",
                              "details": {
                                "subtotal": '10.12',
                                "shipping": '0',
                                "shipping_discount": 0
                              }
                            },
                            "description":
                                "The payment transaction description.",
                            "item_list": {
                              "items": [
                                {
                                  "name": "A demo product",
                                  "quantity": 1,
                                  "price": '10.12',
                                  "currency": "USD"
                                }
                              ],
                              "shipping_address": {
                                "recipient_name": "Jane Foster",
                                "line1": "Travis County",
                                "line2": "",
                                "city": "Austin",
                                "country_code": "US",
                                "postal_code": "73301",
                                "phone": "+00000000",
                                "state": "Texas"
                              },
                            }
                          }
                        ],
                        note: "Contact us for any questions on your order.",
                        onSuccess: (Map params) async {
                          print("onSuccess: $params");
                          setState(() {
                            isProductBought = true;
                          });
                          // Save the updated isProductBought status
                          saveProductBoughtStatus(true);
                          _scaffoldMessenger.showSnackBar(
                            const SnackBar(
                              content: Text("Payment done successfully"),
                              backgroundColor: Color.fromARGB(255, 22, 23, 23),
                            ),
                          );
                          // Show receipt screen after payment
                          showReceiptScreen();
                        },
                        onError: (error) {
                          print("onError: $error");
                        },
                        onCancel: (params) {
                          print('cancelled: $params');
                        },
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 10, 29, 44),
                ),
                child: Text(
                  'Pay With PayPal',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Visibility(
            visible: isProductBought,
            child: Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 94, 93, 95),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Furniture sold out',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
