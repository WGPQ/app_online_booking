import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.backgroundColor,
      required this.textColor,
      required this.onPressed});

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all<Size>(
            Size(size.width * 0.8, size.height * 0.05)),
        backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
        foregroundColor: WidgetStateProperty.all<Color>(textColor),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
