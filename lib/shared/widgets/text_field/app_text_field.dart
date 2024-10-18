import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../../constants/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.validator,
    this.label,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return SmoothClipRRect(
      borderRadius: BorderRadius.circular(15),
      smoothness: 1,
      side: const BorderSide(color: AppColors.grey, width: 2.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
        child: TextFormField(
          controller: controller,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUnfocus,
          decoration: InputDecoration(
            label: label == null
                ? null
                : Text(label!, style: GoogleFonts.poppins()),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
