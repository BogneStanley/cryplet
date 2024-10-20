import 'package:cryplet/core/extentions/number_extension.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:cryplet/shared/widgets/app_text/app_title.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_corner/smooth_corner.dart';

class UserBallanceCard extends StatelessWidget {
  const UserBallanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothCard(
      elevation: 0,
      borderRadius: BorderRadius.circular(15.0),
      color: AppColors.primary.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: const AppTitle(
                    'Current Balance',
                    color: AppColors.dark,
                  ).title2(),
                ),
                IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      AppColors.primary.withOpacity(0.2),
                    ),
                    shape: WidgetStateProperty.all(
                      const CircleBorder(),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility_off,
                  ),
                ),
              ],
            ),
            10.ph,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.money,
                  color: AppColors.green,
                  size: 40,
                ),
                10.pw,
                Expanded(
                  child: Text(
                    '1 000,00 USD',
                    style: GoogleFonts.poppins(
                      fontSize: 38,
                      fontWeight: FontWeight.w900,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
