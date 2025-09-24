import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_falcon/app/ui/theme/app_colors.dart';
import 'package:code_falcon/app/ui/theme/app_text_styles.dart';

class HeroSectionWidget extends StatelessWidget {
  const HeroSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          key: const GlobalObjectKey('homeSection'),
          height: MediaQuery.of(context).size.height * 0.8,
          width: double.infinity,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Stack(
            children: [
              // Positioned.fill(
              //   child: Lottie.asset(
              //     'assets/CodingSlide.json',
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Positioned.fill(
                child: Container(
                  // color: Colors.black.withValues(alpha: 0.9),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'company_name'.tr,
                      style: AppTextStyles.heading1(context).copyWith(
                        color: AppColors.accentColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: constraints.maxWidth > 800 ? 600 : 300,
                      child: Text(
                        'hero_title_1'.tr,
                        style: AppTextStyles.heading2(context).copyWith(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
