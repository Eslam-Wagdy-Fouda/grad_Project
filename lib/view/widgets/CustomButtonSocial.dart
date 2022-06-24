import 'package:flutter/material.dart';
import 'package:graduation_project/constance.dart';
import 'package:graduation_project/view/widgets/custom_text.dart';

class CustomButtonSocial extends StatelessWidget {

  final String text;
  final String imageName;
  final Color color;
  final Function onPressed;

  const CustomButtonSocial({Key? key,
    this.text='',
    this.imageName='',
      required this.onPressed,
    this.color=primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(8),
      onPressed: (){onPressed();},
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageName),
          const SizedBox(
            width: 20,
          ),
           CustomText(
            alignment: Alignment.center,
            text: text,
            color: secondColor,
          ),
        ],
      ),
    );
  }
}
