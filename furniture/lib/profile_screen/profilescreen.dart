import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furniture/consts/firebase_consts.dart';
import 'package:furniture/consts/lists.dart';
import 'package:furniture/controller/profilecontroller.dart';
import 'package:furniture/login_singnup/loginpage.dart';
import 'package:furniture/profile_screen/editprofilescreen.dart';
import 'package:furniture/services/firestoreservices.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    if (currentUser == null) {
      print("currentUser is null");
      return Scaffold();
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 234, 234),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 35, 47),
      ),
      body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(
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
                      padding: EdgeInsets.all(8),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ).onTap(() {
                        controller.nameController.text = data['userName'];
                        controller.passController.text = data['password'];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfileScreen(
                              data: data,
                            ), // Replace EditProfileScreen with the actual screen you want to navigate to
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SafeArea(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              data['ImageUrl'] == ''
                                  ? Image.asset(
                                      'images/profile.jpg',
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make()
                                  : Image.network(
                                      data['ImageUrl'],
                                      fit: BoxFit.cover,
                                    ),
                              // : Image.network(
                              //     data['ImageUrl'],
                              //     width: 100,
                              //     fit: BoxFit.cover,
                              //   )
                              //     .box
                              //     .roundedFull
                              //     .clip(Clip.antiAlias)
                              //     .make(),

                              SizedBox(height: 10), //  spacing
                              "${data['userName']}"
                                  .text
                                  .fontWeight(FontWeight.bold)
                                  .white
                                  .make(),
                              "${data['email']}".text.white.make(),
                              const SizedBox(height: 20), //  more spacing
                              ListView.separated(
                                shrinkWrap: true,
                                separatorBuilder: ((context, index) {
                                  return Divider(
                                    color: Colors.orange,
                                    height: 20,
                                  );
                                }),
                                itemBuilder: ((context, index) {
                                  return ListTile(
                                    leading: Image.asset(
                                      profileButtonsIcons[index],
                                      width: 40,
                                    ),
                                    title:
                                        profileButtonsList[index].text.make(),
                                  );
                                }),
                                itemCount: profileButtonsList.length,
                              )
                                  .box
                                  .white
                                  .rounded
                                  .padding(EdgeInsets.symmetric(horizontal: 16))
                                  .shadowSm
                                  .make(),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () async {
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => LoginPage())));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: EdgeInsets.all(16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.logout,
                                      color: Colors.deepPurple,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Logout",
                                      style: TextStyle(
                                        color: Colors.black,
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
          }),
    );
  }
}
