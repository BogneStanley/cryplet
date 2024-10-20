import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
    required this.label,
    required this.icon,
    this.labelColor,
    this.bgColor,
  });

  final String label;
  final Widget icon;
  final Color? labelColor;
  final Color? bgColor;
  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      label: Text(
        label,
        style: GoogleFonts.poppins(
          color: AppColors.dark,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          bgColor?.withOpacity(0.2) ?? AppColors.primary.withOpacity(0.2),
        ),
      ),
      icon: !isLoading
          ? icon
          : SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: labelColor ?? AppColors.dark,
                strokeWidth: 4.0,
              ),
            ),
    );
  }
}
