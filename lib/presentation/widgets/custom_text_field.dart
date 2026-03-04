import 'package:chatbox/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String title;
  TextEditingController controller;
  String? Function(String?)? validator;

  CustomTextField({
    super.key,
    required this.title,
    required this.controller,
    required this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: ColorPalette.primaryColor,
            fontSize: screenHeight / 45,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          cursorColor: ColorPalette.primaryColor,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorPalette.primaryColor,
                width: 1.0,
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
            ),
          ),
        ),
      ],
    );
  }
}
