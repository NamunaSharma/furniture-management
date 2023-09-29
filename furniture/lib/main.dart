import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture/addproduct.dart';
// import 'package:furniture/admindashboard.dart';
import 'package:furniture/adminscreen.dart';
import 'package:furniture/adminselfmade.dart';
import 'package:furniture/category_screen/category_screen.dart';
import 'package:furniture/firebase_options.dart';
import 'package:furniture/home.dart';
import 'package:furniture/login_singnup/adminlogin.dart';
import 'package:furniture/login_singnup/firstscreen.dart';
import 'package:furniture/login_singnup/loginpage.dart';
import 'package:furniture/profile_screen/profilescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme:
              AppBarTheme(iconTheme: IconThemeData(color: Colors.black))),
      // home: AdminDashboard(),
      //home: AdminHomePage()
      // home: LoginPage(),
      // //home: ProfileScreen(),
      // home: Home(),
      // home: AddProduct(),
      //  home: CategoryScreen(),
      // home: AdminLogin(),
      // home: AdminDsh(),
      home: CategoryScreen(),
      // home: Adminn(),
    );
  }
}
