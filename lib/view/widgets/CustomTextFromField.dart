import 'package:flutter/material.dart';
import 'package:graduation_project/constance.dart';
import 'package:graduation_project/view/widgets/custom_text.dart';

class CustomTextFromField extends StatelessWidget {
  final String text;
  final String hint;
  final Function onSave;
  final Function validator;

  const CustomTextFromField({
    Key? key,
    this.text = '',
    this.hint = '',
    required this.onSave,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          color: primaryColor,
          text: text,
          fontSize: 14,
          alignment: Alignment.topLeft,
        ),
        TextFormField(
          validator: validator(),
          onSaved: onSave(),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: hintColor,
            ),
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
