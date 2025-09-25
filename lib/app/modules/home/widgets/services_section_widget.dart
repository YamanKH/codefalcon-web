import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:code_falcon/app/ui/theme/app_colors.dart';
import 'package:code_falcon/app/ui/theme/app_text_styles.dart';

class ServicesSectionWidget extends StatelessWidget {
  const ServicesSectionWidget({super.key});

  static const bool enableAnimations = !kIsWeb;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 1;
        if (constraints.maxWidth > 1200) {
          crossAxisCount = 4;
        } else if (constraints.maxWidth > 800) {
          crossAxisCount = 3;
        } else if (constraints.maxWidth > 500) {
          crossAxisCount = 2;
        } else {
          crossAxisCount = 1;
        }

        final isSmallScreen = constraints.maxWidth < 600;
        final serviceItems = [
          _ServiceItem(
            titleKey: 'web_dev',
            descriptionKey: 'web_dev_desc',
            icon: Icons.language,
          ),
          _ServiceItem(
            titleKey: 'mobile_dev',
            descriptionKey: 'mobile_dev_desc',
            icon: Icons.phone_android,
          ),
          _ServiceItem(
            titleKey: 'ui_ux',
            descriptionKey: 'ui_ux_desc',
            icon: Icons.design_services,
          ),
          _ServiceItem(
            titleKey: 'consulting',
            descriptionKey: 'consulting_desc',
            icon: Icons.lightbulb,
          ),
          _ServiceItem(
            titleKey: 'ai_solutions',
            descriptionKey: 'ai_solutions_desc',
            icon: Icons.smart_toy,
          ),
          _ServiceItem(
            titleKey: 'cloud_services',
            descriptionKey: 'cloud_services_desc',
            icon: Icons.cloud,
          ),
        ];

        List<Widget> buildCards() => serviceItems
            .map((item) => ServiceCard(
                  titleKey: item.titleKey,
                  descriptionKey: item.descriptionKey,
                  icon: item.icon,
                ))
            .toList();

        return Container(
          key: const GlobalObjectKey('servicesSection'),
          padding: EdgeInsets.all(isSmallScreen ? 20 : 40),
          color: AppColors.primaryBackground(context),
          child: Column(
            children: [
              _buildSectionTitle('services_title'.tr, context),
              const SizedBox(height: 30),
              // Lottie.asset(
              //   'assets/CodingSlide.json',
              //   height: 400,
              //   width: 300,
              // ),
              const SizedBox(height: 30),
              enableAnimations
                  ? AnimationLimiter(
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: isSmallScreen ? 1.2 : 1.0,
                        children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 375),
                          childAnimationBuilder: (widget) => SlideAnimation(
                            horizontalOffset: 50.0,
                            child: FadeInAnimation(child: widget),
                          ),
                          children: buildCards(),
                        ),
                      ),
                    )
                  : GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: isSmallScreen ? 1.8 : 1.4,
                      children: buildCards(),
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

class ServiceCard extends StatelessWidget {
  final String titleKey;
  final IconData icon;
  final String descriptionKey;

  const ServiceCard({
    super.key,
    required this.titleKey,
    required this.icon,
    required this.descriptionKey,
  });

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Card(
      color: AppColors.primaryBackground(context),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 15 : 20),
        child: isSmallScreen
            ? Row(
                children: [
                  Icon(icon, size: 30, color: AppColors.accentColor),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titleKey.tr,
                          style: AppTextStyles.bodyText(context).copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Text(
                          descriptionKey.tr,
                          style: AppTextStyles.bodyText(context).copyWith(fontSize: 12),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 40, color: AppColors.accentColor),
                  const SizedBox(height: 10),
                  Flexible(
                    child: Text(
                      titleKey.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyText(context).copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: Text(
                      descriptionKey.tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyText(context).copyWith(fontSize: 14),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _ServiceItem {
  final String titleKey;
  final String descriptionKey;
  final IconData icon;

  const _ServiceItem({
    required this.titleKey,
    required this.descriptionKey,
    required this.icon,
  });
}
