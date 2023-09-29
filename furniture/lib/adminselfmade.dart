import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furniture/adminscreen.dart';
import 'package:furniture/userdetails.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:core';

class AdminDsh extends StatefulWidget {
  const AdminDsh({super.key});

  @override
  State<AdminDsh> createState() => _AdminDshState();
}

class _AdminDshState extends State<AdminDsh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 109, 150, 167),
      appBar: AppBar(
        title: Text("Admin Dashboard"),
        backgroundColor: const Color.fromARGB(255, 26, 38, 47),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Admin Dashboard",
              style: TextStyle(fontSize: 40),
            ),
          ),
          // Container(
          //   height: 300,
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(15),
          //     image: DecorationImage(image: AssetImage('images/2.jpg')),
          //   ),
          // ).box.alignTopCenter.make(),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => AdminDsh())));
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(
                      255, 38, 53, 65), // Set the background color here
                ),
                child: Text(
                  "Products",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ProductDetailsPage(
                                userId: 'widget.userId',
                              ))));
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(
                      255, 38, 53, 65), // Set the background color here
                ),
                child: Text(
                  "Users",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('products').snapshots(),
              builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 120,
                      mainAxisSpacing: 15, // Number of columns in the grid
                      childAspectRatio:
                          0.7, // Adjust this ratio to control the aspect ratio of each grid item
                    ),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 203, 207, 215),
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              snapshot.data!.docs[index]['p_imgs'],
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill, // Adjust to your needs
                            ),
                            SizedBox(height: 10),
                            Column(
                              children: [
                                Text(
                                    "Name: ${snapshot.data!.docs[index]['p_name']}"),
                                Text(
                                    "Category: ${snapshot.data!.docs[index]['p_category']}"),
                                Text(
                                    "Used Period: ${snapshot.data!.docs[index]['p_used']}"),
                                Text(
                                    "Price: ${snapshot.data!.docs[index]['p_price']}"),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Adminn(
                                                productId: snapshot
                                                    .data!.docs[index].id,
                                                productData: snapshot
                                                        .data!.docs[index]
                                                        .data()
                                                    as Map<String, dynamic>,
                                              )),
                                    );
                                  },
                                  child: Text("Details"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
