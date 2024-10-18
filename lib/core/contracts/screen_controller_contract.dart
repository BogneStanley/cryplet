import 'package:flutter/widgets.dart';

abstract class ScreenControllerContract {
  final BuildContext context;
  final void Function(VoidCallback)? setState;

  ScreenControllerContract({required this.context, this.setState});

  updateUi() {
    setState?.call(() {});
  }
}
