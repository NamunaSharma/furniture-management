// ignore_for_file: unused_local_variable, depend_on_referenced_packages, non_constant_identifier_names

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture/consts/firebase_consts.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var profileImagePath = ''.obs;
  var profileImageLink = '';
  var isloading = false.obs;
  var nameController = TextEditingController();
  var passController = TextEditingController();

  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileImagePath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async {
    var filename = basename(profileImagePath.value);
    var destination = 'images/${currentUser!.uid}/filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImagePath.value));
    profileImageLink = await ref.getDownloadURL();
  }

  updateProfile({
    required String userName,
    required String password,
    required String ImageUrl,
  }) async {
    var store = FirebaseFirestore.instance
        .collection(usersCollection)
        .doc(currentUser!.uid);
    await store.set(
      {'userName': userName, 'password': password, 'ImageUrl': ImageUrl},
      SetOptions(merge: true),
    );
    isloading(false);
  }
}
//   updateProfile(userName, password, ImageUrl) async {
//     var store = firestore.collection(usersCollection).doc(currentUser!.uid);
//     await store.set(
//         {'userName': userName, 'password': password, 'ImageUrl': ImageUrl},
//         SetOptions(merge: true));
//     isloading(false);
//   }
// }
