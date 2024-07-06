import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_online_booking/src/core/resources.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker(
      {super.key, this.label, this.icon, required this.type, this.controller});
  final String? label;
  final IconData? icon;
  final TextInputType type;
  final TextEditingController? controller;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(
              primary: const Color(AppColor.primary),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        if (widget.controller != null) {
          widget.controller?.text =
              pickedDate.toLocal().toString().split(' ')[0];
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: true,
      onTap: () => _selectDate(context),
      style: GoogleFonts.openSans(
        textStyle: const TextStyle(
            color: Color(AppColor.primary),
            fontSize: 18.0,
            fontWeight: FontWeight.w400),
      ),
      decoration: InputDecoration(
        hintText: widget.label,
        hintStyle: GoogleFonts.openSans(
          textStyle: const TextStyle(
              color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.w400),
        ),
        prefixIcon: Icon(
          widget.icon,
          color: Colors.grey,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(AppColor.primary)),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
