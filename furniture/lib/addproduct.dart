// // import 'dart:typed_data';

// // import 'package:flutter/material.dart';
// // import 'package:furniture/add_data.dart';
// // import 'package:furniture/consts/uths.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:velocity_x/velocity_x.dart';

// // class AddProduct extends StatefulWidget {
// //   AddProduct({super.key});

// //   @override
// //   _AddProductState createState() => _AddProductState();
// // }

// // class _AddProductState extends State<AddProduct> {
// //   final TextEditingController nameController = TextEditingController();
// //   final TextEditingController categoryController = TextEditingController();
// //   final TextEditingController subcategoryController = TextEditingController();
// //   final TextEditingController usedperiodController = TextEditingController();
// //   final TextEditingController priceController = TextEditingController();
// //   final TextEditingController locationController = TextEditingController();
// //   final TextEditingController sellernameController = TextEditingController();
// //   final TextEditingController numberController = TextEditingController();
// //   final TextEditingController descController = TextEditingController();
// //   Uint8List? _image;
// //   void post() async {
// //     String name = nameController.text;
// //     String category = categoryController.text;
// //     String subcategory = subcategoryController.text;
// //     String used_period = usedperiodController.text;
// //     String price = priceController.text;
// //     String description = descController.text;
// //     String sellername = sellernameController.text;
// //     String sellerlocation = locationController.text;
// //     String sellernumber = numberController.text;
// //     String resp = await StoreData().post(
// //         name: name,
// //         category: category,
// //         subcategory: subcategory,
// //         used_period: used_period,
// //         price: price,
// //         description: description,
// //         seller_name: sellername,
// //         seller_number: sellernumber,
// //         seller_location: sellerlocation,
// //         file: _image!);
// //   }

// //   void selectImage() async {
// //     Uint8List img = await pickImage(ImageSource.gallery);
// //     setState(() {
// //       _image = img;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.pink,
// //       appBar: AppBar(
// //         leading: IconButton(
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //           icon: Icon(Icons.arrow_back),
// //         ),
// //         title: Text("Add Product"),
// //         actions: [
// //           TextButton(
// //             onPressed: () {
// //               // Handle save button press here
// //               // You can access the form data and the selected image using _image
// //             },
// //             child: Text("Save"),
// //           ),
// //         ],
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Card(
// //             elevation: 5,
// //             shape: RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(15.0),
// //             ),
// //             child: Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: Form(
// //                 // Wrap the Column with a Form widget
// //                 child: Column(
// //                   mainAxisSize: MainAxisSize.min,
// //                   crossAxisAlignment: CrossAxisAlignment.stretch,
// //                   children: [
// //                     Stack(
// //                       children: [
// //                         if (_image != null)
// //                           CircleAvatar(
// //                             radius: 64,
// //                             backgroundImage: MemoryImage(_image!),
// //                           )
// //                         else
// //                           CircleAvatar(
// //                             radius: 100,
// //                             backgroundImage: NetworkImage(
// //                                 'https://t3.ftcdn.net/jpg/04/12/57/22/360_F_412572270_OGw5hFLVwWoBCOdwWjLa1qGHsYU444PI.jpg'),
// //                           ),
// //                         Positioned(
// //                           child: IconButton(
// //                             onPressed: selectImage,
// //                             icon: Icon(Icons.add_a_photo),
// //                           ),
// //                           bottom: -10,
// //                           left: 80,
// //                         )
// //                       ],
// //                     ),
// //                     SizedBox(height: 20),
// //                     Text(
// //                       "Add Product",
// //                       style: TextStyle(
// //                         fontSize: 24,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                       textAlign: TextAlign.center,
// //                     ),
// //                     SizedBox(height: 20),
// //                     TextFormField(
// //                       controller: nameController,
// //                       decoration: InputDecoration(
// //                         hintText: "e.g. Sofa",
// //                         labelText: "Product Name",
// //                       ),
// //                       // Add validation logic here
// //                       validator: (value) {
// //                         if (value == null || value.isEmpty) {
// //                           return "Product name cannot be empty";
// //                         }
// //                         return null;
// //                       },
// //                     ),
// //                     SizedBox(height: 20),
// //                     TextFormField(
// //                       controller: categoryController,
// //                       decoration: InputDecoration(
// //                         hintText: "e.g. Furniture",
// //                         labelText: "Category",
// //                       ),
// //                       // Add validation logic here
// //                       validator: (value) {
// //                         // Add your validation logic here
// //                         return null;
// //                       },
// //                     ),
// //                     SizedBox(height: 20),
// //                     TextFormField(
// //                       controller: subcategoryController,
// //                       decoration: InputDecoration(
// //                         hintText: "Plastic Chair",
// //                         labelText: "Sub Category",
// //                       ),
// //                       // Add validation logic here
// //                       validator: (value) {
// //                         // Add your validation logic here
// //                         return null;
// //                       },
// //                     ),
// //                     SizedBox(height: 20),
// //                     TextFormField(
// //                       controller: usedperiodController,
// //                       decoration: InputDecoration(
// //                         hintText: "e.g. 6 months",
// //                         labelText: "Used Period",
// //                       ),
// //                       // Add validation logic here
// //                       validator: (value) {
// //                         // Add your validation logic here
// //                         return null;
// //                       },
// //                     ),
// //                     SizedBox(height: 20),
// //                     TextFormField(
// //                       controller: descController,
// //                       keyboardType: TextInputType.text,
// //                       decoration: InputDecoration(
// //                         hintText: "e.g.This is my product",
// //                         labelText: "Description",
// //                       ),
// //                       // Add validation logic here
// //                       validator: (value) {
// //                         // Add your validation logic here
// //                         return null;
// //                       },
// //                     ),
// //                     SizedBox(height: 20),
// //                     TextFormField(
// //                       controller: priceController,
// //                       keyboardType: TextInputType.number,
// //                       decoration: InputDecoration(
// //                         hintText: "e.g. \$100",
// //                         labelText: "Price",
// //                       ),
// //                       // Add validation logic here
// //                       validator: (value) {
// //                         // Add your validation logic here
// //                         return null;
// //                       },
// //                     ),
// //                     SizedBox(height: 20),
// //                     TextFormField(
// //                       controller: sellernameController,
// //                       decoration: InputDecoration(
// //                         hintText: "e.g. 123 Main St, City",
// //                         labelText: "Seller Name",
// //                       ),
// //                       // Add validation logic here
// //                       validator: (value) {
// //                         // Add your validation logic here
// //                         return null;
// //                       },
// //                     ),
// //                     SizedBox(height: 20),
// //                     TextFormField(
// //                       controller: numberController,
// //                       keyboardType: TextInputType.phone,
// //                       decoration: InputDecoration(
// //                         hintText: "e.g. 123-456-7890",
// //                         labelText: "Seller Number",
// //                       ),
// //                       // Add validation logic here
// //                       validator: (value) {
// //                         // Add your validation logic here
// //                         return null;
// //                       },
// //                     ),
// //                     SizedBox(height: 20),
// //                     TextFormField(
// //                       controller: locationController,
// //                       decoration: InputDecoration(
// //                         hintText: "e.g. 123 Main St, City",
// //                         labelText: "Seller Location",
// //                       ),
// //                       // Add validation logic here
// //                       validator: (value) {
// //                         // Add your validation logic here
// //                         return null;
// //                       },
// //                     ),
// //                     SizedBox(height: 20),
// //                     ElevatedButton(
// //                       onPressed: post,
// //                       child: Text("Post"),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:furniture/consts/uths.dart';
// import 'package:image_picker/image_picker.dart';

// class AddProduct extends StatefulWidget {
//   AddProduct({super.key});

//   @override
//   _AddProductState createState() => _AddProductState();
// }

// class _AddProductState extends State<AddProduct> {
//   final TextEditingController nameController = TextEditingController();
//   String selectedCategory = 'Table'; // Default category
//   String selectedSubcategory = 'Office Chair'; // Default subcategory
//   final TextEditingController usedperiodController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController locationController = TextEditingController();
//   final TextEditingController sellernameController = TextEditingController();
//   final TextEditingController numberController = TextEditingController();
//   final TextEditingController descController = TextEditingController();
//   Uint8List? _image;

//   List<String> categories = ['Table', 'Chair', 'Sofa', 'Bed'];
//   List<String> subcategories = [
//     'Office Chair',
//     'Plastic Chair',
//     'Dining Table',
//     'Tea Table',
//     'Wooden Bed',
//     'King Size Bed',
//     'Readymade Sofa',
//     'Wooden Sofa'
//   ];

//   void post() async {
//     String name = nameController.text;
//     String used_period = usedperiodController.text;
//     String price = priceController.text;
//     String description = descController.text;
//     String sellername = sellernameController.text;
//     String sellerlocation = locationController.text;
//     String sellernumber = numberController.text;

//     // Use the selectedCategory and selectedSubcategory values here
//     String category = selectedCategory;
//     String subcategory = selectedSubcategory;

//     String resp = await StoreData().post(
//       name: name,
//       category: category,
//       subcategory: subcategory,
//       used_period: used_period,
//       price: price,
//       description: description,
//       seller_name: sellername,
//       seller_number: sellernumber,
//       seller_location: sellerlocation,
//       file: _image!,
//     );
//   }

//   void selectImage() async {
//     Uint8List img = await pickImage(ImageSource.gallery);
//     setState(() {
//       _image = img;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 213, 210, 215),
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: Text(
//           "Add Product",
//           // style: TextStyle(
//           //     backgroundColor: const Color.fromARGB(255, 173, 65, 192)),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               // Handle save button press here
//               // You can access the form data and the selected image using _image
//             },
//             child: Text(
//               "Save",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(0.0),
//           // child: Card(
//           //   color: Color.fromARGB(255, 211, 113, 178),
//           //   elevation: 2,
//           //   shape: RoundedRectangleBorder(
//           //     borderRadius: BorderRadius.circular(15.0),
//           //   ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Form(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       if (_image != null)
//                         CircleAvatar(
//                           radius: 64,
//                           backgroundImage: MemoryImage(_image!),
//                         )
//                       else
//                         CircleAvatar(

//                           radius: 100,
//                           backgroundImage: NetworkImage(
//                               'https://t3.ftcdn.net/jpg/04/12/57/22/360_F_412572270_OGw5hFLVwWoBCOdwWjLa1qGHsYU444PI.jpg'),

//                         ),
//                       Positioned(
//                         child: IconButton(
//                           onPressed: selectImage,
//                           icon: Icon(Icons.add_a_photo),
//                           color: Colors.white,

//                         ),
//                         bottom: -10,
//                         left: 80,
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     "Add Product",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 20),
//                   TextFormField(
//                     controller: nameController,
//                     decoration: InputDecoration(
//                       hintText: "e.g. Sofa",
//                       labelText: "Product Name",
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   DropdownButtonFormField<String>(
//                     value: selectedCategory,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedCategory = value!;
//                       });
//                     },
//                     items: categories.map((category) {
//                       return DropdownMenuItem(
//                         value: category,
//                         child: Text(category),
//                       );
//                     }).toList(),
//                     decoration: InputDecoration(
//                       labelText: "Category",
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   DropdownButtonFormField<String>(
//                     value: selectedSubcategory,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedSubcategory = value!;
//                       });
//                     },
//                     items: subcategories.map((subcategory) {
//                       return DropdownMenuItem(
//                         value: subcategory,
//                         child: Text(subcategory),
//                       );
//                     }).toList(),
//                     decoration: InputDecoration(
//                       labelText: "Sub Category",
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   TextFormField(
//                     controller: usedperiodController,
//                     decoration: InputDecoration(
//                       hintText: "e.g. 6 months",
//                       labelText: "Used Period",
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   TextFormField(
//                     controller: descController,
//                     keyboardType: TextInputType.text,
//                     decoration: InputDecoration(
//                       hintText: "e.g. This is my product",
//                       labelText: "Description",
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   TextFormField(
//                     controller: priceController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       hintText: "e.g. \$100",
//                       labelText: "Price",
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   TextFormField(
//                     controller: sellernameController,
//                     decoration: InputDecoration(
//                       hintText: "e.g. John Doe",
//                       labelText: "Seller Name",
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   TextFormField(
//                     controller: numberController,
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                       hintText: "e.g. 123-456-7890",
//                       labelText: "Seller Number",
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   TextFormField(
//                     controller: locationController,
//                     decoration: InputDecoration(
//                       hintText: "e.g. 123 Main St, City",
//                       labelText: "Seller Location",
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: post,
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.deepPurple),
//                     child: Text("Post"),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       // ),
//     );
//   }
// }

// class StoreData {
//   Future<String> post({
//     required String name,
//     required String category,
//     required String subcategory,
//     required String used_period,
//     required String price,
//     required String description,
//     required String seller_name,
//     required String seller_number,
//     required String seller_location,
//     required Uint8List file,
//   }) async {
//     // Your post logic here
//     await Future.delayed(Duration(seconds: 2)); // Simulating a delay
//     return 'Success';
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: AddProduct(),
//   ));
// }
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
        subcategory: subcategory,
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
      backgroundColor: Colors.pink,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Add Product"),
        actions: [
          TextButton(
            onPressed: () {
              // Handle save button press here
              // You can access the form data and the selected image using _image
            },
            child: Text("Save"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                // Wrap the Column with a Form widget
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
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
                            onPressed: selectImage,
                            icon: Icon(Icons.add_a_photo),
                          ),
                          bottom: -10,
                          left: 80,
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Add Product",
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
                        hintText: "e.g. Sofa",
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
                        hintText: "e.g. Furniture",
                        labelText: "Category",
                      ),
                      // Add validation logic here
                      validator: (value) {
                        // Add your validation logic here
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: subcategoryController,
                      decoration: InputDecoration(
                        hintText: "Plastic Chair",
                        labelText: "Sub Category",
                      ),
                      // Add validation logic here
                      validator: (value) {
                        // Add your validation logic here
                        return null;
                      },
                    ),
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
                        hintText: "e.g. 123 Main St, City",
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
                        hintText: "e.g. 123-456-7890",
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
                        hintText: "e.g. 123 Main St, City",
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
                      child: Text("Post"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
