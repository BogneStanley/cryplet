import 'package:cryplet/core/extentions/number_extension.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../app_text/app_title.dart';

class AppMessageDialog extends StatelessWidget {
  final String message;
  final String title;
  final Color color;
  final String btnText;
  final IconData? icon;

  const AppMessageDialog({
    super.key,
    required this.message,
    this.title = '',
    this.color = AppColors.red,
    this.btnText = 'Close',
    this.icon,
  });

  static Future<void> showError(
      {required BuildContext context, required String message}) async {
    await showDialog(
      context: context,
      builder: (_) => AppMessageDialog(
        message: message,
        icon: Icons.close,
      ),
    );
  }

  static Future<void> showSuccess(
      {required BuildContext context, required String message}) async {
    await showDialog(
      context: context,
      builder: (_) => AppMessageDialog(
        message: message,
        color: AppColors.green,
        icon: Icons.check,
      ),
    );
  }

  static showInfo({required BuildContext context, required String message}) {
    showDialog(
      context: context,
      builder: (_) => AppMessageDialog(
        message: message,
        color: AppColors.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: SmoothRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        smoothness: 1.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: title.isNotEmpty,
              child: AppTitle(title, color: color).title2(),
            ),
            if (icon != null)
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 3),
                ),
                child: Icon(icon, size: 25, color: color),
              ),
            20.ph,
            Text(
              message,
              style: GoogleFonts.poppins(),
            ),
            20.ph,
            FilledButton(
              onPressed: () => Navigator.pop(context),
              style: FilledButton.styleFrom(backgroundColor: color),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
