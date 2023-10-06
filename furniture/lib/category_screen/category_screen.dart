// ignore_for_file: unnecessary_string_interpolations, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:furniture/category_screen/category_details.dart';
import 'package:furniture/consts/lists.dart';
import 'package:furniture/controller/productcontroller.dart';
import 'package:furniture/strings.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 35, 47),
        title: categories.text.fontWeight(FontWeight.bold).white.make(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 190),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    categoryImages[index],
                    height: 160,
                    width: 220,
                    fit: BoxFit.contain,
                  ),
                  2.heightBox,
                  "${categoriesList[index]}"
                      .text
                      .color(
                        const Color.fromARGB(255, 8, 35, 47),
                      )
                      .fontWeight(FontWeight.bold)
                      .align(TextAlign.center)
                      .shadow(
                        0.7,
                        0.5,
                        0.1,
                        const Color.fromARGB(255, 8, 35, 47),
                      )
                      .make(),
                ],
              )
                  .box
                  .white
                  .rounded
                  .clip(Clip.antiAlias)
                  .shadowLg
                  .make()
                  .onTap(() {
                controller.getSubCategories(categoriesList[index]);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CategoryDetails(title: categoriesList[index]),
                  ),
                );
              });
            },
          ),
        ),
      ),
      // ],
      // ),
    );
  }
}
