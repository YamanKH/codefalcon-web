import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:code_falcon/app/ui/theme/app_colors.dart';
import 'package:code_falcon/app/ui/theme/app_text_styles.dart';

class AboutSectionWidget extends StatelessWidget {
  const AboutSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          key: const GlobalObjectKey('aboutSection'),
          padding: const EdgeInsets.all(40),
          color: AppColors.primaryBackground(context),
          child: Column(
            children: [
              _buildSectionTitle('about_title'.tr, context),
              const SizedBox(height: 20),
              constraints.maxWidth > 800
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Lottie.asset(
                            'assets/Codingboy.json',
                            height: 600,
                            width: 300,
                          ),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          child: Text(
                            'about_description'.tr,
                            textAlign: TextAlign.justify,
                            style: AppTextStyles.bodyText(context),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Lottie.asset(
                          'assets/Codingboy.json',
                          height: 400,
                          width: 300,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'about_description'.tr,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodyText(context),
                        ),
                      ],
                    ),
            ],
          ),
        );
      },
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
