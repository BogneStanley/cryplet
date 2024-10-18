import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../../constants/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
    required this.label,
    this.labelColor,
    this.bgColor,
  });

  final String label;
  final Color? labelColor;
  final Color? bgColor;
  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
          const Size(double.infinity, 55),
        ),
        backgroundColor: WidgetStateProperty.all(bgColor ?? AppColors.primary),
        shape: WidgetStateProperty.all(
          SmoothRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            smoothness: 1.0,
          ),
        ),
      ),
      child: !isLoading
          ? Text(
              label,
              style: GoogleFonts.poppins(color: labelColor ?? Colors.white),
            )
          : SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: labelColor ?? Colors.white,
                strokeWidth: 4.0,
              ),
            ),
    );
  }
}
