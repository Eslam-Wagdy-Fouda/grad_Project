import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/view_model/control_view_model.dart';
import 'package:graduation_project/view/HomeView.dart';
import 'package:graduation_project/view/ProfileView.dart';
import 'package:graduation_project/constance.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottomNavigationBar(),


    );

  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text("Explore"),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image.asset(
                'assets/Images/explore.png',
                fit: BoxFit.contain,
                width: 25,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text("Cart"),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image.asset(
                'assets/Images/cart.png',
                fit: BoxFit.contain,
                width: 25,
              ),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(
                top: 15,
              ),
              child: Text("Account"),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image.asset(
                'assets/Images/person.png',
                fit: BoxFit.contain,
                width: 25,
              ),
            ),
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
          if(index==0){
            Get.to(HomeView());
          }
          if(index==2){
            Get.to(const ProfileView());
          }
        },
        backgroundColor: hintColor,
        elevation: 0,
        selectedItemColor: secondColor,
      ),
    );
  }
}
