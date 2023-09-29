import 'package:flutter/material.dart';
import 'package:furniture/category_screen/payment.dart';
import 'package:furniture/consts/lists.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetails({Key? key, required this.title, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 235, 235),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 8, 35, 47),
          title: title!.text.white.fontWeight(FontWeight.bold).make(),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                )),
          ]),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    VxSwiper.builder(
                      autoPlay: true,
                      height: 250.0,
                      itemCount: data['p_imgs'].length,
                      aspectRatio: 16 / 9,
                      // viewportFraction: 1,
                      itemBuilder: (context, index) {
                        return Image.network(
                          "${data['p_imgs']}",
                          // data['p_imgs'],
                          width: 160,
                          height: 110,
                          fit: BoxFit.fill,
                        );

                        // Image.network(
                        //   data["p_imgs"][index],
                        //   width: double.infinity,
                        //   fit: BoxFit.fill,
                        // );
                      },
                    ),
                    10.heightBox,
                    //title and details
                    title!.text.bold
                        .size(20)
                        .color(
                          Color.fromARGB(255, 8, 35, 47),
                        )
                        .fontWeight(FontWeight.bold)
                        .make(),
                    10.heightBox,
                    "${data['p_price']}"
                        .text
                        .color(
                          Color.fromARGB(255, 8, 35, 47),
                        )
                        .fontWeight(FontWeight.bold)
                        .size(18)
                        .make(),
                    10.heightBox,
                    10.heightBox,
                    "Description"
                        .text
                        .bold
                        .size(15)
                        .color(Color.fromARGB(255, 8, 1, 0))
                        .fontWeight(FontWeight.bold)
                        .make(),
                    10.heightBox,
                    "${data['p_desc']}"
                        .text
                        .color(const Color.fromARGB(255, 0, 0, 0))
                        .make(),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Seller Details:",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 8, 35, 47),
                              ),
                            ),
                            "Seller"
                                .text
                                .white
                                .fontWeight(FontWeight.bold)
                                .color(
                                  Color.fromARGB(255, 8, 35, 47),
                                )
                                .make(),
                            5.heightBox,
                            "${data['p_seller']}"
                                .text
                                .fontWeight(FontWeight.bold)
                                .color(
                                  Color.fromARGB(255, 8, 35, 47),
                                )
                                .size(13)
                                .make(),
                            3.heightBox,
                            Row(
                              children: [
                                "Used for:"
                                    .text
                                    .fontWeight(FontWeight.bold)
                                    .color(
                                      Color.fromARGB(255, 8, 35, 47),
                                    )
                                    .make(),
                                "${data['p_used']}"
                                    .text
                                    .fontWeight(FontWeight.bold)
                                    .color(Colors.black)
                                    .size(13)
                                    .make(),
                              ],
                            ),
                            3.heightBox,
                            Row(
                              children: [
                                "Address =:"
                                    .text
                                    .fontWeight(FontWeight.bold)
                                    .color(
                                      Color.fromARGB(255, 8, 35, 47),
                                    )
                                    .make(),
                                "${data['p_sellerloc']}"
                                    .text
                                    .fontWeight(FontWeight.bold)
                                    .color(Colors.black)
                                    .size(13)
                                    .make(),
                              ],
                            ),
                          ],
                        )),
                      ],
                    )
                        .box
                        .height(100.0)
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .color(Color.fromARGB(255, 202, 200, 200))
                        .make(),

                    //description
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 60.0,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 94, 93, 95),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Payment()));
                // Handle button press here
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(12.0),
                backgroundColor: Color.fromARGB(255, 8, 35, 47),
              ),
              child: Text(
                "Buy ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
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
