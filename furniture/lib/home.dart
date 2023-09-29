import 'package:flutter/material.dart';
import 'package:furniture/addproduct.dart';
import 'package:furniture/category_screen/category_screen.dart';
import 'package:furniture/exitdialog.dart';
import 'package:furniture/home_controller.dart';
import 'package:furniture/home_screen/homescreen.dart';
import 'package:furniture/post.dart';
import 'package:furniture/profile_screen/profilescreen.dart';
import 'package:furniture/strings.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navbarItem = [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.category,
            size: 26,
          ),
          label: categories),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.add, // New icon for "Add"
          size: 26,
        ),
        label: add, // Label for "Add"
      ),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 26,
          ),
          label: account),
    ];
    var navBody = [
      HomeScreen(),
      CategoryScreen(),
      Post(),
      // AddProduct(),
      ProfileScreen(),
    ];
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => exitDialog(context));
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Obx(
              () => Expanded(
                child: navBody.elementAt(controller.currentNavIndex.value),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentNavIndex.value,
            selectedItemColor: Color.fromARGB(255, 251, 251, 251),
            unselectedItemColor: Color.fromARGB(255, 183, 181, 181),
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            backgroundColor: Color.fromARGB(255, 8, 35, 47),
            type: BottomNavigationBarType.fixed,
            items: navbarItem,
            onTap: (value) {
              controller.currentNavIndex.value = value;
            },
          ),
        ),
      ),
    );
  }
}
