import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTitle {
  const AppTitle(this.data, {this.fontSize, this.color, this.fontWeight});
  final String data;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  Widget title1() {
    return _title(30);
  }

  Widget title2() {
    return _title(24);
  }

  Widget title3() {
    return _title(20);
  }

  Widget title4() {
    return _title(18);
  }

  Widget title5() {
    return _title(16);
  }

  Widget _title(double fontSize) {
    return Text(
      data,
      style: GoogleFonts.poppins(
        fontSize: this.fontSize ?? fontSize,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.dark,
      ),
    );
  }
}
