import 'package:flutter/widgets.dart';

extension NumberExtension on num {
  String get to2Decimal => toStringAsFixed(2);
  SizedBox get pw => SizedBox(width: toDouble());
  SizedBox get ph => SizedBox(height: toDouble());
}
