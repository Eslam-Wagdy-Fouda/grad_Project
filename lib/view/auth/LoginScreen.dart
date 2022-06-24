import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:graduation_project/core/view_model/auth_view_model.dart';
import 'package:graduation_project/view/auth/Register_view.dart';
import 'package:graduation_project/view/auth/SecondScreen.dart';
import 'package:graduation_project/constance.dart';
import 'package:graduation_project/view/widgets/CustomButton.dart';
import 'package:graduation_project/view/widgets/CustomButtonSocial.dart';
import 'package:graduation_project/view/widgets/CustomTextFromField.dart';
import 'package:graduation_project/view/widgets/custom_text.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import '../../constance.dart';
import '../HomeView.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const CustomText(
                  color: primaryColor,
                  text: "Welcome",
                  fontSize: 30,
                  alignment: Alignment.topLeft,
                ),
               GestureDetector(
                  onTap: (){
                    Get.to(const RegisterView());
                  },
                  child: const CustomText(
                    color: secondColor,
                    text: "Sign Up",
                    fontSize: 18,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const CustomText(
              color: secondColor,
              text: "Sign in to continue",
              fontSize: 14,
              alignment: Alignment.topLeft,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextFromField(
              onSave: () {},
              validator: () {},
              text: "Phone",
              hint: "Enter your phone number",
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextFromField(
              onSave: () {},
              validator: () {},
              text: "Password",
              hint: "Enter your password",
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              color: secondColor,
              text: "Forget password ?",
              fontSize: 14,
              alignment: Alignment.topRight,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onPressed: () {
                Get.to(HomeView());
              },
              text: "Sign In",
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              alignment: Alignment.center,
              text: "OR",
              fontSize: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonSocial(
              text: "Sign In with Google",
              imageName: 'assets/Images/google.png',
              onPressed: () {
                controller.googleSignInMethod();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonSocial(
              text: "Sign In with Facebook",
              imageName: 'assets/Images/facebook.png',
              onPressed: () {
                controller.facebookSignInMethod();
              },
            ),
          ],
        ),
      ),
    );
  }
}
