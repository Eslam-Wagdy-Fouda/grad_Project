import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/view_model/control_view_model.dart';
import 'package:graduation_project/core/view_model/home_view_model.dart';
import 'package:graduation_project/view/CartView.dart';
import 'package:graduation_project/view/ProfileView.dart';
import 'package:graduation_project/constance.dart';
import 'package:graduation_project/view/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final List<String> names = <String>[
    's',
    's',
    's',
    's',
    's',
    's',
    's',
    's',
    's',
    's',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
    builder:(controller) =>  controller.loading.value
        ? const Center(child: CircularProgressIndicator()):Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 70,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              _searchTextFormField(),
              const SizedBox(
                height: 15,
              ),
              const CustomText(
                alignment: Alignment.topLeft,
                text: "Categories",
              ),
              const SizedBox(
                height: 10,
              ),
              _listViewCategories(),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Best Worker",
                    fontSize: 18,
                  ),
                  CustomText(
                    text: "See all",
                    fontSize: 16,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              _listViewWorker(),
            ],
          ),
        ),
      ),
    ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: hintColor,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategories() {
    return GetBuilder<HomeViewModel>(
        builder: (controller) => Container(
      height: 100,
      child: ListView.separated(
        itemCount: controller.categoryModel.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: hintColor,
                ),
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryModel[index].image),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomText(
                alignment: Alignment.center,
                text: controller.categoryModel[index].name,
              ),
            ],
          );
        },
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
      ),
        ),
    );
  }

  Widget _listViewWorker() {
    return GetBuilder<HomeViewModel>(
        builder: (controller) => Container(
      height: 350,
      child: ListView.separated(
        itemCount: controller.productModel.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.42,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: hintColor,
                  ),
                  width: MediaQuery.of(context).size.width * 0.42,
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width * 0.42,
                    child: Image.network(
                     controller.productModel[index].image,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                child :CustomText(
                  text: controller.productModel[index].name,
                  alignment: Alignment.bottomLeft,
                ),
          ),
                const SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: controller.productModel[index].job,
                  color: Color.fromRGBO(8, 72, 161, 0.7294117647058823),
                  alignment: Alignment.bottomLeft,
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomText(
                  text:controller.productModel[index].price.toString() +
                 " \$",
                  color: secondColor,
                  alignment: Alignment.bottomLeft,
                ),
              ],
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
      ),
        ),
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
         if(index==1){
           Get.to(const CartView());
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
