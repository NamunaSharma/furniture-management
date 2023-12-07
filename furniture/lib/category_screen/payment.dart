// import 'package:flutter/material.dart';
// import 'package:flutter_paypal/flutter_paypal.dart';
// import 'package:furniture/category_screen/constants.dart';
// import 'package:furniture/home_screen/homescreen.dart';
// import 'package:furniture/paymentsuccess.dart';

// class Payment extends StatefulWidget {
//   const Payment({super.key});

//   @override
//   State<Payment> createState() => _PaymentState();
// }

// class _PaymentState extends State<Payment> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (BuildContext context) => UsePaypal(
//                           sandboxMode: true,
//                           clientId: "${Constants.clientId}",
//                           secretKey: "${Constants.secretKey}",
//                           returnURL: "${Constants.returnURL}",
//                           cancelURL: "${Constants.cancelURL}",
//                           transactions: const [
//                             {
//                               "amount": {
//                                 "total": '10.12',
//                                 "currency": "USD",
//                                 "details": {
//                                   "subtotal": '10.12',
//                                   "shipping": '0',
//                                   "shipping_discount": 0
//                                 }
//                               },
//                               "description":
//                                   "The payment transaction description.",
//                               // "payment_options": {
//                               //   "allowed_payment_method":
//                               //       "INSTANT_FUNDING_SOURCE"
//                               // },
//                               "item_list": {
//                                 "items": [
//                                   {
//                                     "name": "A demo product",
//                                     "quantity": 1,
//                                     "price": '10.12',
//                                     "currency": "USD"
//                                   }
//                                 ],

//                                 // shipping address is not required though
//                                 "shipping_address": {
//                                   "recipient_name": "Jane Foster",
//                                   "line1": "Travis County",
//                                   "line2": "",
//                                   "city": "Austin",
//                                   "country_code": "US",
//                                   "postal_code": "73301",
//                                   "phone": "+00000000",
//                                   "state": "Texas"
//                                 },
//                               }
//                             }
//                           ],
//                           note: "Contact us for any questions on your order.",
//                           onSuccess: (Map params) async {
//                             print("onSuccess: $params");
//                           },
//                           onError: (error) {
//                             print("onError: $error");
//                           },
//                           onCancel: (params) {
//                             print('cancelled: $params');
//                           }),
//                     ),
//                   );
//                 },
//                 child: Text('Pay With PayPal')
//                 )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}