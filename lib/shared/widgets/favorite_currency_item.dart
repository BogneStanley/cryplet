import 'package:cryplet/core/extentions/number_extension.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:cryplet/shared/widgets/app_text/app_title.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class FavoriteCurrencyItem extends StatelessWidget {
  const FavoriteCurrencyItem({
    super.key,
    required this.color,
    required this.cryproName,
    required this.cryproSymbol,
    required this.cryproIcon,
    required this.amountIHave,
    required this.cryproChangeRate,
    this.hideAmount = false,
    this.onPressed,
  });

  final Color color;
  final String cryproName;
  final String cryproSymbol;
  final String cryproIcon;
  final double amountIHave;
  final double cryproChangeRate;
  final bool hideAmount;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: color.withOpacity(0.3),
        elevation: 0,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          smoothness: 1,
        ),
        child: Container(
          padding:
              const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: color.withOpacity(.5),
                    radius: 30,
                    child: Image.network(
                      cryproIcon,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  10.pw,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTitle(cryproName).title3(),
                      AppTitle(
                        cryproSymbol,
                        color: AppColors.grey,
                      ).title5(),
                    ],
                  ),
                ],
              ),
              15.ph,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTitle(
                    hideAmount ? '***' : (amountIHave).toStringAsFixed(2),
                  ).title2(),
                  AppTitle(
                    hideAmount
                        ? '*** USD'
                        : '${(amountIHave * cryproChangeRate).to2Decimal} USD',
                  ).title5(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
