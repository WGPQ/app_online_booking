import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_online_booking/src/core/resources.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.label,
      this.icon,
      this.type = TextInputType.text,
      this.controller});

  final String? label;
  final IconData? icon;
  final TextInputType type;
  final TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool get isPassword => widget.type == TextInputType.visiblePassword;
  bool get isPhone => widget.type == TextInputType.phone;
  bool hidePassword = false;

  void _togglePassword() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.type,
        obscureText: hidePassword,
        inputFormatters: isPhone
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ]
            : null,
        style: GoogleFonts.openSans(
          textStyle: const TextStyle(
              color: Color(AppColor.primary),
              fontSize: 18.0,
              fontWeight: FontWeight.w400),
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          hintText: widget.label,
          hintStyle: GoogleFonts.openSans(
            textStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
                fontWeight: FontWeight.w400),
          ),
          prefixIcon: widget.icon != null
              ? Icon(
                  widget.icon,
                  color: Colors.grey,
                )
              : null,
          suffixIcon: isPassword
              ? IconButton(
                  color: Colors.grey,
                  onPressed: () => {_togglePassword()},
                  icon: hidePassword
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined))
              : null,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(AppColor.primary)),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
