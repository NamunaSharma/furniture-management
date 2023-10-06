// ignore_for_file: unused_import, duplicate_ignore, non_constant_identifier_names

// ignore_for_file: unused_import

// ignore_for_file: unused_import

// ignore_for_file: unused_import

// ignore_for_file: unused_import

// ignore_for_file: unused_import

// ignore_for_file: unused_import

// ignore_for_file: unused_import

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> post({
    required String userId,
    required String name,
    required String category,
    // required String subcategory,
    required String used_period,
    required String description,
    required String price,
    required String seller_name,
    required String seller_number,
    required seller_location,
    required Uint8List file,
    required bool p_approved,
  }) async {
    String resp = "Some Error Occured";
    try {
      if (name.isNotEmpty ||
          category.isNotEmpty ||
          // subcategory.isNotEmpty ||
          description.isNotEmpty ||
          price.isNotEmpty ||
          used_period.isNotEmpty ||
          seller_name.isNotEmpty ||
          seller_number.isNotEmpty ||
          seller_location.isNotEmpty) {
        String imageName = DateTime.now().millisecondsSinceEpoch.toString();
        // Specify the child name with the path or URL within Firebase Storage
        String imageUrl =
            await uploadImageToStorage('images/$imageName.jpg', file);
        // String imageUrl = await uploadImageToStorage('images', file);
        await _firestore.collection('products').add({
          'userId': userId,
          'p_name': name,
          'p_category': category,
          // 'p_subcategory': subcategory,
          'p_used': used_period,
          'p_price': price,
          'p_seller': seller_name,
          'p_desc': description,
          'seller number': seller_number,
          'p_sellerloc': seller_location,
          'p_imgs': imageUrl,
          'p_approved': p_approved,
        });
      }
      resp = 'success';
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }

  Future<List<DocumentSnapshot>> getPendingProducts() async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('products')
        .where('p_approved', isEqualTo: 'true')
        .get();

    return querySnapshot.docs;
  }

  Future<String> approveProduct(String productId) async {
    try {
      await _firestore
          .collection('products')
          .doc(productId)
          .update({'p_approved': 'true'});
      return 'success';
    } catch (err) {
      return err.toString();
    }
  }

  // Add a function to update the status of a product
  Future<void> updateProductStatus(String productId, String p_approved) async {
    await _firestore
        .collection('products')
        .doc(productId)
        .update({'p_approved': 'true'});
  }
}
