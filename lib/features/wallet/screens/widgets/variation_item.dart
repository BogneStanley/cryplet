import 'package:cryplet/core/extentions/number_extension.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_corner/smooth_corner.dart';

class VariationItem extends StatelessWidget {
  const VariationItem({
    super.key,
    this.isUp,
    required this.time,
    required this.price,
  });

  final bool? isUp;
  final String time;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: SmoothCard(
        borderRadius: BorderRadius.circular(15.0),
        color: isUp == null
            ? AppColors.grey.withOpacity(0.3)
            : !isUp!
                ? AppColors.red.withOpacity(0.1)
                : AppColors.green.withOpacity(0.1),
        elevation: 0,
        smoothness: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      color: AppColors.dark,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: '$time:',
                      ),
                      TextSpan(
                        text: ' $price USD',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              10.pw,
              if (isUp == true)
                const Icon(
                  Icons.keyboard_double_arrow_up,
                  color: AppColors.green,
                ),
              if (isUp == false)
                const Icon(
                  Icons.keyboard_double_arrow_down,
                  color: AppColors.red,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
