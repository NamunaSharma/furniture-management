// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, avoid_print, prefer_const_constructors, use_build_context_synchronously, sort_child_properties_last, annotate_overrides, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:furniture/consts/uths.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

class UpdateProductPage extends StatefulWidget {
  final String productId;

  UpdateProductPage({required this.productId});

  @override
  _UpdateProductPageState createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController subcategoryController = TextEditingController();
  final TextEditingController usedPeriodController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController sellerNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  late String currentName;
  late String currentCategory;
  // late String currentSubcategory;
  late String currentUsedPeriod;
  late String currentDescription;
  late String currentPrice;
  late String currentSellerName;
  late String currentLocation;
  late String currentNumber;
  // late String currentImageUrl = '';
  late String currentImageUrl; // Store the current image URL

  bool isLoading = false;
  bool isImageChanged = false; // To track if the image is updated
  Uint8List? _image; // To store the newly selected image

  @override
  void initState() {
    super.initState();
    // Load the current product details and image URL
    loadProductDetails();
  }

  Future<void> loadProductDetails() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Fetch the product details from Firestore
      DocumentSnapshot productSnapshot = await FirebaseFirestore.instance
          .collection('products')
          .doc(widget.productId)
          .get();

      Map<String, dynamic>? productData =
          productSnapshot.data() as Map<String, dynamic>?;

      if (productData != null) {
        currentName = productData['p_name'];
        currentCategory = productData['p_category'];
        // currentSubcategory = productData['p_subcategory'];
        currentUsedPeriod = productData['p_used'];
        currentDescription = productData['p_desc'];
        currentPrice = productData['p_price'];
        currentSellerName = productData['p_seller'];
        currentLocation = productData['p_sellerloc'];
        currentNumber = productData['seller number'];
        currentImageUrl = productData['p_imgs']; // Get the current image URL
      }

      // Update the text controllers with the current values
      nameController.text = currentName;
      categoryController.text = currentCategory;
      // subcategoryController.text = currentSubcategory;
      usedPeriodController.text = currentUsedPeriod;
      descriptionController.text = currentDescription;
      priceController.text = currentPrice;
      sellerNameController.text = currentSellerName;
      locationController.text = currentLocation;
      numberController.text = currentNumber;
    } catch (error) {
      print("Error loading product details: $error");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> updateProduct() async {
    try {
      setState(() {
        isLoading = true;
      });

      String imageUrl =
          currentImageUrl; // Initialize with the current image URL

      // Check if a new image is selected
      if (isImageChanged) {
        String imageName = DateTime.now().millisecondsSinceEpoch.toString();
        imageUrl = await uploadImageToStorage('images/$imageName.jpg', _image!);
      }

      // Update the product details in Firestore
      await FirebaseFirestore.instance
          .collection('products')
          .doc(widget.productId)
          .update({
        'p_name': nameController.text,
        'p_category': categoryController.text,
        // 'p_subcategory': subcategoryController.text,
        'p_used': usedPeriodController.text,
        'p_desc': descriptionController.text,
        'p_price': priceController.text,
        'p_seller': sellerNameController.text,
        'p_sellerloc': locationController.text,
        'seller number': numberController.text,
        'p_imgs': imageUrl, // Update the image URL
      });

      // Update the current values with the new values
      currentName = nameController.text;
      currentCategory = categoryController.text;
      // currentSubcategory = subcategoryController.text;
      currentUsedPeriod = usedPeriodController.text;
      currentDescription = descriptionController.text;
      currentPrice = priceController.text;
      currentSellerName = sellerNameController.text;
      currentLocation = locationController.text;
      currentNumber = numberController.text;
      currentImageUrl = imageUrl; // Update the current image URL

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Product updated successfully'),
      ));
    } catch (error) {
      print("Error updating product: $error");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to update product'),
      ));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = FirebaseStorage.instance.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });

    if (img != null) {
      setState(() {
        _image = Uint8List.fromList(img);
        isImageChanged = true;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 35, 47),
        title: Text('Update Product'),
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.save),
            onPressed: updateProduct,
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: ListView(
                children: <Widget>[
                  // Image Picker
                  buildImagePicker(),

                  // Text Form Fields for each product detail
                  buildTextField("Product Name", nameController),
                  buildTextField("Category", categoryController),
                  // buildTextField("Subcategory", subcategoryController),
                  buildTextField("Used Period", usedPeriodController),
                  buildTextField("Description", descriptionController),
                  buildTextField("Price", priceController),
                  buildTextField("Seller Name", sellerNameController),
                  buildTextField("Location", locationController),
                  buildTextField("Seller Number", numberController),
                ],
              ),
            ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(labelText: label),
        controller: controller,
      ),
    );
  }

  Widget buildImagePicker() {
    return Stack(
      children: [
        if (_image != null)
          CircleAvatar(
            radius: 64,
            backgroundImage: MemoryImage(_image!),
          )
        else if (currentImageUrl.isNotEmpty)
          CircleAvatar(
            radius: 64,
            backgroundImage: NetworkImage(currentImageUrl),
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
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UpdateProductPage(productId: 'GkAryZObrtP705TY74qa'),
  ));
}
