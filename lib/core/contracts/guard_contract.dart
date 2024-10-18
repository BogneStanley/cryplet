import 'package:flutter/material.dart';

abstract class GuardContract {
  final Widget redirectScreen;
  const GuardContract(this.redirectScreen);
  bool isActive([BuildContext? context]);
}
