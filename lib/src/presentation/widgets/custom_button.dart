import 'package:app_online_booking/src/core/resources.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.backgroundColor,
      required this.textColor,
      required this.onPressed,
      this.waiting = false});

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final bool waiting;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all<Size>(
            Size(size.width * 0.8, size.height * 0.05)),
        backgroundColor: WidgetStateProperty.all<Color>(waiting
            ? const Color(AppColor.primary).withOpacity(0.2)
            : backgroundColor),
        foregroundColor: WidgetStateProperty.all<Color>(textColor),
      ),
      child: waiting
          ? SizedBox(
              height: size.height * 0.028,
              width: size.height * 0.028,
              child: CircularProgressIndicator(
                color: Colors.black.withOpacity(0.5),
                strokeWidth: 3,
              ),
            )
          : Text(
              text,
              style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              )),
            ),
    );
  }
}
