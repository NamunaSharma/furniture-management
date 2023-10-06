// ignore_for_file: unused_import

import 'package:furniture/consts/firebase_consts.dart';
import 'package:furniture/models/categorymodel.dart';

class FirestoreServices {
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  static getProduct(category) {
    return firestore
        .collection('products')
        // .collection(productCollection)
        .where('p_category', isEqualTo: category)
        .where('p_approved', isEqualTo: 'true')
        .snapshots();
  }

  static updateUserData(String id, Map<String, String> map) {}
  // static getProduct(category) async {
  //   return firestore
  //       .collection(productCollection)
  //       .where('p_category', isEqualTo: category)
  //       .where('status',
  //           isEqualTo: 'approved') // Add this filter for approved products
  //       .snapshots();
  // }
}
