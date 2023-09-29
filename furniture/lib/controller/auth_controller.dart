import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture/consts/firebase_consts.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthController extends GetxController {
  Future<UserCredential?> loginMethod(email, password, context) async {
    UserCredential? userCredential;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

//signup
  Future<UserCredential?> signupMethod(email, password, context) async {
    UserCredential? userCredential;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  storeUserData({name, password, email}) async {
    DocumentReference store =
        firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set(
        {'name': name, 'password': password, 'email': email});
  }

  //signout method:
  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
