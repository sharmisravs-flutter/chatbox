// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  String text;
  EdgeInsets padding;
  double borderRadius;
  Color textColor;
  Color fillColor;
  double textSize;

  CustomButton({
    Key? key,
    required this.text,
    required this.padding,
    required this.textColor,
    required this.fillColor,
    required this.borderRadius,
    required this.textSize,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.fillColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: widget.textSize,
          color: widget.textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
