import 'package:cryplet/core/extentions/number_extension.dart';
import 'package:cryplet/shared/constants/app_colors.dart';
import 'package:cryplet/shared/widgets/app_buttons/app_button.dart';
import 'package:cryplet/shared/widgets/app_text/app_title.dart';
import 'package:cryplet/shared/widgets/text_field/app_text_field.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_corner/smooth_corner.dart';

class AddCurrencyScreen extends StatelessWidget {
  const AddCurrencyScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        'https://picsum.photos/200',
                        width: 60,
                        height: 60,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: const AppTitle(
                        'Bitcoin',
                      ).title1(),
                    ),
                  ],
                ),
                20.ph,
                const AppTitle(
                  'Variation History',
                ).title3(),
                20.ph,
                SizedBox(
                  height: 150,
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(
                        show: false,
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      baselineX: 0,
                      baselineY: 0,
                      minY: 0,
                      lineBarsData: [
                        LineChartBarData(
                          spots: const [
                            FlSpot(0, 1000),
                            FlSpot(1, 900),
                            FlSpot(2, 950),
                            FlSpot(3, 975),
                            FlSpot(4, 850),
                          ],
                          isCurved: true,
                          curveSmoothness: 0.3,
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primary,
                              AppColors.orange,
                            ].map((color) => color.withOpacity(0.5)).toList(),
                          ),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                AppColors.primary.withOpacity(0.5),
                                AppColors.orange.withOpacity(0.4),
                              ],
                            ),
                          ),
                          barWidth: 5,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(
                            show: false,
                          ),
                        ),
                      ],
                      titlesData: const FlTitlesData(
                        show: false,
                      ),
                    ),
                  ),
                ),
                20.ph,
                Row(
                  children: [
                    Expanded(
                      child: const AppTitle(
                        'Last',
                      ).title4(),
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
                        Icons.refresh,
                      ),
                    )
                  ],
                ),
                20.ph,
                ...List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: SmoothCard(
                      borderRadius: BorderRadius.circular(15.0),
                      color: index % 2 == 0
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
                                    const TextSpan(
                                      text: '10-10-2022:',
                                    ),
                                    TextSpan(
                                      text: ' 1 000,00 USD',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            10.pw,
                            const Icon(
                              Icons.keyboard_double_arrow_up,
                              color: AppColors.green,
                            ),
                            const Icon(
                              Icons.keyboard_double_arrow_down,
                              color: AppColors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                250.ph,
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
          width: MediaQuery.of(context).size.width,
          child: Form(
              child: IntrinsicHeight(
            child: Column(
              children: [
                AppTextField(
                  label: 'Amount',
                  controller: TextEditingController(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                20.ph,
                SizedBox(
                  height: 60,
                  child: AppButton(
                    onPressed: () {},
                    label: 'Add',
                  ),
                ),
              ],
            ),
          ))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
