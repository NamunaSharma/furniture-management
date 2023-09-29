import 'dart:io';

import 'package:flutter/material.dart';
import 'package:furniture/controller/profilecontroller.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileScreen extends StatefulWidget {
  final dynamic data;

  const EditProfileScreen({Key? key, this.data}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  get data => null;

  // String profileImagePath = ''; // Initialize with an empty string

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCF5205),
      ),
      body: Stack(
        children: [
          Container(
            // Background Widget
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFCF5205), Color(0xFFE69558)],
              ),
            ),
          ),
          Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                data != null && data['ImageUrl'] == ''
                    ? Image.asset(
                        'images/profile.jpg',
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : data != null &&
                            data['ImageUrl'] != '' &&
                            controller.profileImagePath.isEmpty
                        ? Image.network(
                            data['ImageUrl'],
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                        : controller.profileImagePath.isNotEmpty
                            ? Image.file(
                                File(controller.profileImagePath.value),
                                width: 100,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make()
                            : Image.asset(
                                'images/profile.jpg',
                                width: 100,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make(),

// data['ImageUrl']=='' && controller.profileImagePath.isEmpty
//                     ? Image.asset(
//                         'images/profile.jpg',
//                         width: 100,
//                         fit: BoxFit.cover,
//                       ).box.roundedFull.clip(Clip.antiAlias).make()
//                     : data['ImageUrl']!= ''&& controller.profileImagePath.isEmpty?
//                     Image.network(data['ImageUrl'],width: 100,
//                         fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make():
//                     Image.file(
//                         File(controller.profileImagePath.value),
//                         width: 100,
//                         fit: BoxFit.cover,
//                       ).box.roundedFull.clip(Clip.antiAlias).make(),
                // CircleAvatar(
                //     radius: 60,
                //     backgroundImage:
                //         // profileImagePath.isEmpty
                //         AssetImage(
                //             'images/profile.jpg') // Use a default image when profileImagePath is empty
                //     // : FileImage(File(profileImagePath)), // Use the image from profileImagePath
                //     ),
                10.heightBox,
                ElevatedButton(
                  onPressed: () {
                    controller.changeImage(context);
                    // Implement logic to change the profile image here
                  },
                  child: Text(
                    "Change",
                    style: TextStyle(color: Colors.deepOrange),
                  ),
                ),
                Divider(),
                20.heightBox,
                TextField(
                  controller: controller.nameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: "Name",
                    labelText: "Full Name",
                  ),
                ),
                TextField(
                  controller: controller.passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Full Password",
                  ),
                ),
                20.heightBox,
                controller.isloading.value
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.brown),
                      )
                    : SizedBox(
                        height: 40,
                        width: context.screenWidth - 60,
                        child: ElevatedButton(
                          onPressed: () async {
                            controller.isloading(true);
                            await controller.uploadProfileImage();
                            await controller.updateProfile(
                                userName: controller.nameController.text,
                                password: controller.passController.text,
                                ImageUrl: controller.profileImageLink);
                            VxToast.show(context, msg: 'Updated');

                            // Implement logic to save profile changes here
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
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
          ),
        ],
      ),
    );
  }
}
