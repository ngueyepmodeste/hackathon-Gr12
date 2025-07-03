import 'package:flutter/material.dart';
import 'package:studenthub/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const AppButton({super.key, required this.text, required this.onPressed, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: isLoading ? SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
      ) : Text(text, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),),
      style: TextButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPressed,
    );
  }
}