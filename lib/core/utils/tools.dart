import 'dart:math';

import 'package:flutter/material.dart';

abstract class Tools {
  static Color generatePaleRandomColor() {
    final random = Random();
    final hsl = HSLColor.fromAHSL(
      1.0,
      random.nextDouble() * 360.0,
      0.5,
      0.5,
    );
    final paleColor =
        hsl.withLightness(min(hsl.lightness + 0.3, 1.0)).toColor();
    return paleColor;
  }

  static int getColorCode(Color color) {
    var code = color.toString().split('(')[1];
    code = code.split(')')[0];
    print(code);
    return int.parse(code);
  }
}
