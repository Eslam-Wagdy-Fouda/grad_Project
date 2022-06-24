import 'package:flutter/material.dart';
import 'package:graduation_project/constance.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;

  const CustomText({
    Key? key,
    this.text = '',
    this.fontSize = 16,
    this.color = primaryColor,
    this.alignment=Alignment.topLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
