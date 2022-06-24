import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/view_model/auth_view_model.dart';
import 'package:graduation_project/view/auth/LoginScreen.dart';
import 'package:graduation_project/view/auth/SecondScreen.dart';
import 'package:graduation_project/constance.dart';
import 'package:graduation_project/view/widgets/CustomButton.dart';
import 'package:graduation_project/view/widgets/CustomTextFromField.dart';
import 'package:graduation_project/view/widgets/custom_text.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Get.to(LoginScreen());
          },
          child: const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Icon(
              Icons.arrow_back,
              color: primaryColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          children: [
            const CustomText(
              color: primaryColor,
              text: "Sign Up",
              fontSize: 30,
              alignment: Alignment.topLeft,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextFromField(
              onSave: () {},
              validator: () {},
              text: "Name",
              hint: "Enter your name",
            ),
            const SizedBox(
              height: 40,
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
            CustomButton(
              onPressed: () {
                Get.to(SecondScreen());
              },
              text: "Sign Up",
            ),
          ],
        ),
      ),
    );
  }
}
