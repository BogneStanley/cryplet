import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../../constants/app_colors.dart';

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    super.key,
    this.controller,
    this.validator,
    this.label,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? label;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return SmoothClipRRect(
      borderRadius: BorderRadius.circular(15),
      smoothness: 1,
      side: const BorderSide(color: AppColors.grey, width: 2.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 2),
        child: TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUnfocus,
          obscureText: _obscureText,
          decoration: InputDecoration(
            label: widget.label == null
                ? null
                : Text(widget.label!, style: GoogleFonts.poppins()),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
