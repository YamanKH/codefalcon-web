import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_falcon/app/ui/theme/app_colors.dart';
import 'package:code_falcon/app/ui/theme/app_text_styles.dart';
import 'package:code_falcon/app/routes/app_pages.dart';

class CalculatorSectionWidget extends StatelessWidget {
  const CalculatorSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return InkWell(
      onTap: () {
        Get.toNamed(Routes.calculator);
      },
      child: Container(
        key: const GlobalObjectKey('calculatorSection'),
        padding: EdgeInsets.all(isSmallScreen ? 20 : 40),
        color: AppColors.primaryBackground(context),
        child: Column(
          children: [
            _buildSectionTitle('calculator_title'.tr, context),
            SizedBox(height: isSmallScreen ? 20 : 30),
            Container(
              constraints: BoxConstraints(
                maxWidth: 1200,
                minHeight: isSmallScreen ? 600 : 800,
              ),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(isSmallScreen ? 16 : 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calculate,
                        size: 64,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(height: 24),
                      Text(
                        'calculator_title'.tr,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'use_calculator'.tr,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32),
                      ElevatedButton.icon(
                        onPressed: () {
                          Get.toNamed(Routes.calculator);
                        },
                        icon: Icon(Icons.arrow_forward),
                        label: Text('calculate_prices'.tr),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          textStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Text(
        title,
        style: AppTextStyles.heading2(context)
            .copyWith(color: AppColors.accentColor),
      ),
    );
  }
}