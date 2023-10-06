

// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_build_context_synchronously, unused_import

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:furniture/controller/profilecontroller.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileScreen extends StatefulWidget {
  final dynamic data;
  final Uint8List? profileImage; // Add this parameter
  final String originalPassword; // Add this parameter

  const EditProfileScreen({
    Key? key,
    required this.data,
    this.profileImage,
    required this.originalPassword,
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Create a TextEditingController for the name
  // final TextEditingController _nameController = TextEditingController();

  // // Create a TextEditingController for the password
  // final TextEditingController _passwordController = TextEditingController();

  // get controller => null;

  @override
  // void initState() {
  //   super.initState();
  //   // Initialize the name and password controllers with the passed values
  //   _nameController.text = widget.data['userName'];
  //   _passwordController.text = widget.originalPassword;
  // }

  @override
  // void dispose() {
  //   // Dispose of the controllers when the screen is disposed
  //   // _nameController.dispose();
  //   // _passwordController.dispose();
  //   // super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 35, 47),
      ),
      body: Stack(
        children: [
          Container(
            // color: Color.fromARGB(255, 8, 35, 47),
            // Background Widget
            height: 200,
            // decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // colors: [Colors., Colors.purple],
            // ),
            // ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Profile Image
              widget.profileImage != null
                  ? CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(widget.profileImage!),
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : Image.asset(
                      'images/profile.jpg',
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ElevatedButton(
                onPressed: () {
                  // Implement logic to change the profile image here
                  controller.changeImage(context);
                },
                child: Text(
                  "Change",
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ),
              Divider(),
              20.heightBox,
              // Name TextField
              TextField(
                controller: controller.nameController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: "Name",
                  labelText: "Full Name",
                ),
              ),
              // Password TextField
              TextField(
                controller: controller.passController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Full Password",
                ),
              ),
              20.heightBox,
              // Save Button
              ElevatedButton(
                onPressed: () async {
                  controller.isloading(true);
                  await controller.uploadProfileImage();
                  await controller.updateProfile(
                    userName: controller.nameController.text,
                    password: controller.passController.text,
                    // userName: _nameController.text,
                    // password: _passwordController.text,
                    ImageUrl: controller.profileImageLink,
                  );
                  VxToast.show(context, msg: 'Updated');

                  // Implement logic to save profile changes here
                },
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          )
              .box
              .white
              .shadowSm
              .padding(EdgeInsets.all(16))
              .margin(EdgeInsets.only(top: 50))
              .make(),
        ],
      ),
    );
  }
}
