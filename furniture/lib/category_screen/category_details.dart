// ignore_for_file: prefer_const_constructors, unused_local_variable, unused_import, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furniture/category_screen/item_details.dart';
import 'package:furniture/controller/productcontroller.dart';
import 'package:furniture/deleteproductpage.dart';
import 'package:furniture/services/firestoreservices.dart';
import 'package:furniture/updateproductpage.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:furniture/add_data.dart';

class GridItem {
  final String imagePath;
  final String text;

  GridItem(this.imagePath, this.text);
}

class CategoryDetails extends StatelessWidget {
  final String? title;
  CategoryDetails({Key? key, required this.title}) : super(key: key);

  final List<GridItem> gridItems = [
    GridItem("images/chair image 3.jpg", "Chair"),
    GridItem("images/bed image 3.jpg", "Bed"),
    GridItem("images/sofa image 4.jpg", "Sofa"),
    GridItem("images/chair image 2.jpg", "Chair"),
    GridItem("images/sofa image 3.jpg", "Sofa"),
    GridItem("images/bed image 5.jpg", "Bed"),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 8, 35, 47),
          // backgroundColor: Color.fromARGB(255, 125, 87, 63),
          iconTheme: IconThemeData(color: Colors.white), // Corrected iconTheme
          title: Text(
            title!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white, // Set the title text color
            ),
          ),
        ),

        // appBar: AppBar(

        //   backgroundColor: Color.fromARGB(255, 8, 35, 47),
        //   // backgroundColor: Color.fromARGB(255, 125, 87, 63),
        //   iconTheme: color(Colors.white),
        //   title: title!.text.fontWeight(FontWeight.bold).white.make(),
        // ),
        body: StreamBuilder(
            // stream: FirestoreServices.getProduct(title),
            stream: FirestoreServices.getProduct(title),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child:
                      "No products found!".text.color(Colors.blueGrey).make(),
                );
              } else {
                var data = snapshot.data!.docs;

                return Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   physics: BouncingScrollPhysics(),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       ...List.generate(
                      //         controller.subcat.length,
                      //         (index) => "${controller.subcat[index]}"
                      //             .text
                      //             .size(3)
                      //             .fontWeight(FontWeight.bold)
                      //             .color(Color.fromARGB(255, 169, 2, 2))
                      //             .makeCentered()
                      //             .box
                      //             .white
                      //             .rounded
                      //             .size(130, 60)
                      //             .margin(EdgeInsets.symmetric(horizontal: 4))
                      //             .make(),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Expanded(
                        child: Container(
                          // color: Colors.grey,
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: data.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 270.0,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8),
                            itemBuilder: (context, index) {
                              final productData = data[index];
                              var item = gridItems[index];
                              // bool p_approved =
                              //     productData['p_approved'] == true;

                              // if (!p_approved) {
                              //   // Don't display the product if it's not approved
                              //   return Container(); // Empty container to hide the item
                              // } // Get the GridItem at the specified index
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    "${data[index]['p_imgs']}",
                                    // data[index]['p_imgs'],
                                    width: 200,
                                    height: 160,
                                    fit: BoxFit.fill,
                                  ),
                                  Spacer(),
                                  "${data[index]['p_name']}"
                                      .text
                                      .color(
                                        Color.fromARGB(255, 8, 35, 47),
                                      )
                                      .size(16)
                                      .fontWeight(FontWeight.bold)
                                      .make(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      "${data[index]['p_price']}"
                                          .text
                                          .color(
                                            Color.fromARGB(255, 8, 35, 47),
                                          )
                                          .size(16)
                                          .fontWeight(FontWeight.bold)
                                          .make(),
                                      Column(
                                        children: [
                                          // IconButton(
                                          //     onPressed: () {
                                          //       String productId =
                                          //           data[index].id;
                                          //       Navigator.of(context).push(
                                          //           MaterialPageRoute(
                                          //               builder: (_) {
                                          //         return UpdateProductPage(
                                          //             productId: productId);
                                          //       }));
                                          //     },
                                          //     icon: Icon(Icons.edit)),
                                          ElevatedButton(
                                            onPressed: () {
                                              String productId = data[index].id;
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          DeleteProductPage(
                                                            productId:
                                                                productId,
                                                            currentImageUrl: '',
                                                          ))));
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white),
                                            ),
                                            child: Icon(
                                              Icons.delete,
                                              size: 15,
                                              color: Color.fromARGB(
                                                  199, 220, 34, 34),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  5.heightBox,
                                  10.heightBox,
                                ],
                              )
                                  .box
                                  .white
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 4))
                                  .shadowLg
                                  // .outerShadowSm
                                  .padding(const EdgeInsets.all(12.0))
                                  .make()
                                  .onTap(
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ItemDetails(
                                        title: "${data[index]['p_name']}",
                                        data: data[index],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }));
  }
}
