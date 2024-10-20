import 'package:cryplet/core/extentions/number_extension.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserAppBar extends StatelessWidget {
  const UserAppBar({
    super.key,
    required this.userName,
    this.userAvatar,
  });

  final String userName;
  final String? userAvatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  userAvatar ?? '',
                  width: 50,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.circle,
                    size: 50,
                    color: AppColors.primary,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              10.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    userName,
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
