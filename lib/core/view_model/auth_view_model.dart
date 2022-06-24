import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project/model/user_model.dart';
import 'package:graduation_project/view/HomeView.dart';
import '../services/firestore_user.dart';

class AuthViewModel extends GetxController
{
      GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
      FirebaseAuth _auth = FirebaseAuth.instance;
      FacebookLogin _facebookLogin = FacebookLogin();

     String? email, password, name;

      @override
      void onInit() {
        // TODO: implement onInit
        super.onInit();
      }

      @override
      void onReady() {
        // TODO: implement onReady
        super.onReady();
      }

      @override
      void onClose() {
        // TODO: implement onClose
        super.onClose();
      }
      void saveUser(UserCredential user) async {
        await FireStoreUser().addUserToFireStore(UserModel(
          userId: user.user?.uid,
          email: user.user?.email,
          name: name == null ? user.user?.displayName : name,
          pic: '',
        ));
      }
      void googleSignInMethod() async {
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        print(googleUser);
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _auth.signInWithCredential(credential).then((user) {
          saveUser(user);
          Get.offAll(HomeView());

        });
      }
      void facebookSignInMethod() async {
        FacebookLoginResult result = await _facebookLogin.logIn();
        final accessToken = result.accessToken?.token;
        if (result.status == FacebookLoginStatus.success) {
          final faceCredential = FacebookAuthProvider.credential(accessToken!);
          await _auth.signInWithCredential(faceCredential).then((user) {
            saveUser(user);
            Get.offAll(HomeView());
          });
        }
      }
}
        // void signInWithEmailAndPassword() async {
        //   try {
        //     await _auth.signInWithEmailAndPassword(email: email,password: password);
        //     Get.offAll(HomeView());
        //   } catch (e) {
        //     print(e.message);
        //     Get.snackbar(
        //       'Error login account',
        //       e.message,
        //       colorText: Colors.black,
        //       snackPosition: SnackPosition.BOTTOM,
        //     );
        //   }
        // }
        //
        // void createAccountWithEmailAndPassword() async {
        //   try {
        //     await _auth
        //         .createUserWithEmailAndPassword(email: email, password: password)
        //         .then((user) async {
        //       saveUser(user);
        //     });
        //
        //     Get.offAll(HomeView());
        //   } catch (e) {
        //     print(e.message);
        //     Get.snackbar(
        //       'Error login account',
        //       e.message,
        //       colorText: Colors.black,
        //       snackPosition: SnackPosition.BOTTOM,
        //     );
        //   }
        // }

