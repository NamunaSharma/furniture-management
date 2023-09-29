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
      backgroundColor: Color.fromARGB(255, 155, 153, 153),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 35, 47),
        title: categories.text.fontWeight(FontWeight.bold).white.make(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 150),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    categoryImages[index],
                    height: 120,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                  2.heightBox,
                  "${categoriesList[index]}"
                      .text
                      .color(
                        Color.fromARGB(255, 8, 35, 47),
                      )
                      .fontWeight(FontWeight.bold)
                      .align(TextAlign.center)
                      .shadow(
                        0.7,
                        0.5,
                        0.1,
                        Color.fromARGB(255, 8, 35, 47),
                      )
                      .make(),
                ],
              )
                  .box
                  .white
                  .rounded
                  .clip(Clip.antiAlias)
                  .outerShadowSm
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
