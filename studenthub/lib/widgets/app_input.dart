import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studenthub/core/constants/colors.dart';

class AppInput extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const AppInput({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon:
            prefixIcon != null
                ? Icon(prefixIcon, color: AppColors.primary)
                : null,
        suffixIcon:
            suffixIcon != null
                ? Icon(suffixIcon, color: AppColors.iconColor)
                : null,
        hintText: hintText,
        filled: true,
        fillColor: Colors.transparent,
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.inputBorder, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.inputBorder, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.secondary, width: 1.5),
        ),
      ),
      style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
    );
  }
}
