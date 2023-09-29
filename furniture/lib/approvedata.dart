// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// final FirebaseStorage _storage = FirebaseStorage.instance;
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Future<String> postToApprovedProducts(Map<String, dynamic> productData) async {
//   String resp = "Some Error Occurred";
//   try {
//     await _firestore.collection('approvedproducts').add({
//       'p_name': productData['p_name'],
//       'p_category': productData['p_category'],
//       'p_subcategory': productData['p_subcategory'],
//       'p_used': productData['p_used'],
//       'p_price': productData['p_price'],
//       'p_seller': productData['p_seller'],
//       'p_desc': productData['p_desc'],
//       'seller number': productData['seller number'],
//       'p_sellerloc': productData['p_sellerloc'],
//       'p_imgs': productData['p_imgs'],
//     });
//     resp = 'success';
//   } catch (err) {
//     resp = err.toString();
//   }
//   return resp;
// }
