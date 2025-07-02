import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:studenthub/core/constants/app_texts.dart';
import 'package:studenthub/core/constants/colors.dart';

class SearchInputMenu extends StatelessWidget {
  const SearchInputMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(10),
          child: const Icon(
            LucideIcons.search,
            color: AppColors.iconColor,
            size: 18,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextField(
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              cursorColor: AppColors.primary,
              decoration: InputDecoration(
                hintStyle: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                hintText: AppTexts.search,
                filled: true,
                fillColor: const Color(0xffF5F5F5),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.menu, color: AppColors.iconColor, size: 18),
      ],
    );
  }
}