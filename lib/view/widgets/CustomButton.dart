import 'package:flutter/material.dart';
import 'package:graduation_project/constance.dart';
import 'package:graduation_project/view/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomButton({
    Key? key,
     this.text='',
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(18),
      onPressed: (){onPressed();},
      color: primaryColor,
      child: CustomText(
        text: text,
        color: secondColor,
        fontSize: 20,
        alignment: Alignment.center,
      ),
    );
  }
}
