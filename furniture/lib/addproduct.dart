// ignore_for_file: unused_import, unused_local_variable, prefer_const_constructors_in_immutables, library_private_types_in_public_api, non_constant_identifier_names, prefer_const_constructors, sort_child_properties_last, deprecated_member_use

import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture/add_data.dart';
import 'package:furniture/consts/uths.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class AddProduct extends StatefulWidget {
  AddProduct({super.key});

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController subcategoryController = TextEditingController();
  final TextEditingController usedperiodController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController sellernameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  Uint8List? _image;
  void post() async {
    String name = nameController.text;
    String category = categoryController.text;
    String subcategory = subcategoryController.text;
    String used_period = usedperiodController.text;
    String price = priceController.text;
    String description = descController.text;
    String sellername = sellernameController.text;
    String sellerlocation = locationController.text;
    String sellernumber = numberController.text;
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Handle the case where the user is not authenticated
      return;
    }

    String userId = user.uid;
    String resp = await StoreData().post(
        userId: userId,
        name: name,
        category: category,
        // subcategory: subcategory,
        used_period: used_period,
        price: price,
        description: description,
        seller_name: sellername,
        seller_number: sellernumber,
        seller_location: sellerlocation,
        file: _image!,
        p_approved: false);
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Color.fromARGB(255, 235, 235, 235),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 35, 47),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text("Add Product"),
        // actions: [
        // TextButton(
        //   onPressed: () {
        //     // Handle save button press here
        //     // You can access the form data and the selected image using _image
        //   },
        // child: Text("Save"),
        // ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              // Wrap the Column with a Form widget
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      if (_image != null)
                        CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      else
                        CircleAvatar(
                          radius: 100,
                          backgroundImage: NetworkImage(
                              'https://t3.ftcdn.net/jpg/04/12/57/22/360_F_412572270_OGw5hFLVwWoBCOdwWjLa1qGHsYU444PI.jpg'),
                        ),
                      Positioned(
                        child: IconButton(
                          alignment: Alignment.topCenter,
                          onPressed: selectImage,
                          icon: Icon(Icons.add_a_photo),
                        ),
                        bottom: 0,
                        left: 22,
                        right: 0,

                        // bottom: -10,
                        // left: 80,
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Add Product Image",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "e.g. Sitting Chair",
                      labelText: "Product Name",
                    ),
                    // Add validation logic here
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Product name cannot be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: categoryController,
                    decoration: InputDecoration(
                      hintText: "e.g. Chair,Sofa,Bed,Table",
                      labelText: "Category",
                    ),
                    // Add validation logic here
                    validator: (value) {
                      // Add your validation logic here
                      return null;
                    },
                  ),
                  // SizedBox(height: 20),
                  // TextFormField(
                  //   controller: subcategoryController,
                  //   decoration: InputDecoration(
                  //     hintText: "Plastic Chair",
                  //     labelText: "Sub Category",
                  //   ),
                  //   // Add validation logic here
                  //   validator: (value) {
                  //     // Add your validation logic here
                  //     return null;
                  //   },
                  // ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: usedperiodController,
                    decoration: InputDecoration(
                      hintText: "e.g. 6 months",
                      labelText: "Used Period",
                    ),
                    // Add validation logic here
                    validator: (value) {
                      // Add your validation logic here
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: descController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "e.g.This is my product",
                      labelText: "Description",
                    ),
                    // Add validation logic here
                    validator: (value) {
                      // Add your validation logic here
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "e.g. \$100",
                      labelText: "Price",
                    ),
                    // Add validation logic here
                    validator: (value) {
                      // Add your validation logic here
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: sellernameController,
                    decoration: InputDecoration(
                      hintText: "e.g.Namuna Sharma",
                      labelText: "Seller Name",
                    ),
                    // Add validation logic here
                    validator: (value) {
                      // Add your validation logic here
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: numberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "e.g. 987654321",
                      labelText: "Seller Number",
                    ),
                    // Add validation logic here
                    validator: (value) {
                      // Add your validation logic here
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: locationController,
                    decoration: InputDecoration(
                      hintText: "e.g. Baneshwor",
                      labelText: "Seller Location",
                    ),
                    // Add validation logic here
                    validator: (value) {
                      // Add your validation logic here
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: post,
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 8, 35, 47),
                    ),
                    child: Text("Post"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
