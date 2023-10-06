
// ignore_for_file: non_constant_identifier_names, unused_import, duplicate_import, unnecessary_null_comparison

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  // ... (existing code)
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> update({
    required String productId,
    required String name,
    required String category,
    // required String subcategory,
    required String used_period,
    required String description,
    required String price,
    required String seller_name,
    required String seller_number,
    required String seller_location,
    required Uint8List file,
  }) async {
    String resp = "Some Error Occurred";
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
        // Check if there's a new image to upload
        String imageUrl = "";
        if (file != null) {
          String imageName = DateTime.now().millisecondsSinceEpoch.toString();
          imageUrl = await uploadImageToStorage('images/$imageName.jpg', file);
        }

        // Create a map of updated fields
        Map<String, dynamic> updatedData = {
          if (name.isNotEmpty) 'p_name': name,
          if (category.isNotEmpty) 'p_category': category,
          // if (subcategory.isNotEmpty) 'p_subcategory': subcategory,
          if (used_period.isNotEmpty) 'p_used': used_period,
          if (price.isNotEmpty) 'p_price': price,
          if (description.isNotEmpty) 'p_desc': description,
          if (seller_name.isNotEmpty) 'p_seller': seller_name,
          if (seller_number.isNotEmpty) 'seller number': seller_number,
          if (seller_location.isNotEmpty) 'p_sellerloc': seller_location,
          if (imageUrl.isNotEmpty) 'p_imgs': imageUrl,
        };

        // Update the document in Firestore
        await _firestore
            .collection('products')
            .doc(productId)
            .update(updatedData);

        resp = 'success';
      }
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
}
