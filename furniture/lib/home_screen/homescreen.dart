// import 'package:flutter/material.dart';
// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace, deprecated_member_use, duplicate_ignore, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:furniture/home_screen/Darksofa.dart';
import 'package:velocity_x/velocity_x.dart';

// Define the GridItem class
class GridItem {
  final String imagePath;
  final String text;

  GridItem(this.imagePath, this.text);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0; // Initially select the first category

  List<String> categories = ["Sofa", "Table", "Bed"];

  final List<String> sliderImages = [
    "images/monsoon-sale-2.jpg",
    "images/monsoon-sale-4.jpg",
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  // Define the list of GridItem objects
  final List<GridItem> gridItems = [
    GridItem("images/darkgrey.jpg", "Dark Grey Sofa"),
    GridItem("images/1_0_2.jpg", "Light Grey Sofa"),
    // GridItem("images/sofa image 4.jpg", "Sofa"),
    // GridItem("images/chair image 2.jpg", "Chair"),
    // GridItem("images/sofa image 3.jpg", "Sofa"),
    // GridItem("images/bed image 5.jpg", "Bed"),
    // Add more items as needed
  ];

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < sliderImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Color.fromARGB(255, 62, 79, 79),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            // color: Color.fromARGB(255, 202, 201, 201),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Best Furniture",
                  style: TextStyle(
                      color: Color.fromARGB(255, 8, 35, 47),
                      fontSize: 26,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  "For Your House",
                  style: TextStyle(
                      color: Color.fromARGB(255, 8, 35, 47),
                      fontSize: 26,
                      fontWeight: FontWeight.w900),
                ),

                // Image.asset(
                //   "images/preview.png",
                //   height: 70,
                //   width: 370,
                // ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  color: const Color.fromARGB(255, 244, 242, 242),
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.search),
                      filled: true,
                      suffixIconColor: const Color.fromARGB(255, 8, 35, 47),
                      // iconColor: Color.fromARGB(255, 8, 35, 47),
                      // fillColor: Colors.white,
                      hintText: "Search Products....",
                      hintStyle: const TextStyle(
                          backgroundColor: Color.fromARGB(255, 230, 228, 228)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide.none), // Adjust the radius as needed
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  width: double.maxFinite,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: sliderImages.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          sliderImages[index],
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Top Categories",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 8, 35, 47),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int index = 0; index < categories.length; index++) ...[
                      if (index != 0)
                        const SizedBox(width: 13), // Add space between buttons
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: selectedIndex == index
                              ? Colors.white
                              // ignore: deprecated_member_use
                              : Colors.black,
                          primary: selectedIndex == index
                              ? const Color.fromARGB(255, 8, 35, 47)
                              : Colors.white, // Text color
                          minimumSize:
                              const Size(100, 50), // Adjust button size
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust border radius
                          ),
                        ),
                        child: Text(
                          categories[index],
                          style: const TextStyle(fontSize: 18), // Text size
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      gridItems.length, // Use the length of the gridItems list
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 240,
                  ),
                  itemBuilder: (context, index) {
                    final item = gridItems[index]; // Get the GridItem object
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 2), // Shadow position
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              item.imagePath, // Use the image path from the GridItem
                              width: 160,
                              height: 160,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Spacer(),
                          Center(
                            child:
                                item.text.text // Use the text from the GridItem
                                    .fontWeight(FontWeight.bold)
                                    .color(
                                      const Color.fromARGB(255, 8, 35, 47),
                                    ) // Pure black text color
                                    .make(),
                          ),
                          5.heightBox,
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Row(
                              children: [
                                "NRs. 1800"
                                    .text
                                    .color(
                                      const Color.fromARGB(255, 8, 35, 47),
                                    )
                                    .size(16)
                                    .fontWeight(FontWeight.bold)
                                    .make(),
                                Center(
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Sofa()));
                                      },
                                      icon: Icon(Icons.arrow_forward_sharp)),
                                ),
                              ],
                            ),
                          ),
                          10.heightBox,
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),

                const Text(
                  "Popular items",
                  style: TextStyle(
                      color: Color.fromARGB(255, 8, 35, 47),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),

                Container(
                  height: 80, // Reduced height
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(13.0), // Adjust border radius
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: gridItems.length,
                      itemBuilder: (context, index) {
                        final item =
                            gridItems[index]; // Get the GridItem object
                        return Row(
                          children: [
                            Expanded(
                              child: Image.asset(
                                item.imagePath,
                                height: 70,
                                width:
                                    50, // Use the image path from the GridItem
                                // fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              color: Colors.grey, // Background color
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Center align text
                                children: [
                                  Text(
                                    item.text,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    textAlign:
                                        TextAlign.center, // Center align text
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    "NRs. 1800",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                    textAlign:
                                        TextAlign.center, // Center align text
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
