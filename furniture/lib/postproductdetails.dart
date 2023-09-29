import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetails extends StatelessWidget {
  final String? title;
  const ProductDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 225, 225),
      appBar: AppBar(
          backgroundColor: Colors.grey,
          title:
              title!.text.color(Colors.grey).fontWeight(FontWeight.bold).make(),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_outline),
                color: const Color.fromARGB(255, 237, 235, 235))
          ]),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      itemCount: 3,
                      aspectRatio: 16 / 9,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          "images/chair image 2.jpg",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    10.heightBox,
                    //title and details
                    title!.text
                        .size(16)
                        .color(Colors.blueGrey)
                        .fontWeight(FontWeight.bold)
                        .make(),
                    10.heightBox,
                    "\Nrs. 1200"
                        .text
                        .color(Colors.red)
                        .fontWeight(FontWeight.bold)
                        .size(18)
                        .make(),
                    10.heightBox,
                    //description
                    "Description"
                        .text
                        .color(Colors.red)
                        .fontWeight(FontWeight.bold)
                        .make(),
                    10.heightBox,
                    "This is a product description .it is a chair and the owner is mehhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
                        .text
                        .color(Colors.deepOrangeAccent)
                        .make(),
                    // ListView(
                    //   shrinkWrap: true,
                    //   children: List.generate(
                    //       itemDetailButtonList.length,
                    //       (index) => ListTile(
                    //             title: "${itemDetailButtonList[index]}"
                    //                 .text
                    //                 .fontWeight(FontWeight.bold)
                    //                 .color(Colors.deepPurple)
                    //                 .make(),
                    //             trailing: Icon(Icons
                    //                 .arrow_forward), // Wrap the icon in an Icon widget
                    //           )),
                    // )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ElevatedButton(
              onPressed: () {
                // Handle button press here
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: Text(
                "Post ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
