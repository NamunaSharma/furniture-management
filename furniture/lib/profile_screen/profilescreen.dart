// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, sort_child_properties_last

import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:furniture/consts/firebase_consts.dart';
import 'package:furniture/controller/profilecontroller.dart';
import 'package:furniture/login_singnup/loginpage.dart';
import 'package:furniture/profile_screen/editprofilescreen.dart';
import 'package:furniture/services/firestoreservices.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Uint8List? _image;

  Future<void> uploadImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null) {
      final bytes = await img.readAsBytes();
      final Reference storageReference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('profile_images/${currentUser?.uid}.jpg');

      final firebase_storage.UploadTask uploadTask =
          storageReference.putData(Uint8List.fromList(bytes));

      final firebase_storage.TaskSnapshot storageTaskSnapshot =
          await uploadTask.whenComplete(() => null);

      final String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();

      setState(() {
        _image = Uint8List.fromList(bytes);
      });

      // Store the download URL in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .update({'imageUrl': downloadUrl});
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    if (currentUser == null) {
      return const Scaffold();
    }
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 155, 153, 153),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 35, 47),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getUser(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            );
          } else {
            var data = snapshot.data!.docs[0];
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: const Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ).onTap(() {
                      controller.nameController.text = data['userName'];
                      controller.passController.text = data['password'];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(
                            data: data,
                            profileImage: _image, // Pass the image data
                            originalPassword: data[
                                'password'], // Pass the original plain password
                          ),
                        ),
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: SafeArea(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                if (_image != null)
                                  CircleAvatar(
                                    radius: 64,
                                    backgroundColor: Colors.white,
                                    backgroundImage: MemoryImage(_image!),
                                  )
                                else
                                  const CircleAvatar(
                                    radius: 100,
                                    backgroundImage: NetworkImage(
                                        'https://t3.ftcdn.net/jpg/04/12/57/22/360_F_412572270_OGw5hFLVwWoBCOdwWjLa1qGHsYU444PI.jpg'),
                                  ),
                                Positioned(
                                  child: IconButton(
                                    onPressed: uploadImage,
                                    icon: const Icon(Icons.add_a_photo),
                                  ),
                                  bottom: -10,
                                  left: 80,
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            "${data['userName']}"
                                .text
                                .fontWeight(FontWeight.bold)
                                .black
                                .make(),
                            "${data['email']}".text.black.make(),
                            const SizedBox(height: 20),
                            // Rest of your code...
                            ElevatedButton(
                              onPressed: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const LoginPage())));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 10, 29, 44),
                                padding: const EdgeInsets.all(16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Logout",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProfileScreen(),
  ));
}
