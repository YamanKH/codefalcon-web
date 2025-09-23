import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            icon: FontAwesomeIcons.globe,
          ),
          _ServiceItem(
            titleKey: 'mobile_dev',
            descriptionKey: 'mobile_dev_desc',
            icon: FontAwesomeIcons.mobileScreenButton,
          ),
          _ServiceItem(
            titleKey: 'ui_ux',
            descriptionKey: 'ui_ux_desc',
            icon: FontAwesomeIcons.paintbrush,
          ),
          _ServiceItem(
            titleKey: 'consulting',
            descriptionKey: 'consulting_desc',
            icon: FontAwesomeIcons.lightbulb,
          ),
          _ServiceItem(
            titleKey: 'ai_solutions',
            descriptionKey: 'ai_solutions_desc',
            icon: FontAwesomeIcons.robot,
          ),
          _ServiceItem(
            titleKey: 'cloud_services',
            descriptionKey: 'cloud_services_desc',
            icon: FontAwesomeIcons.cloud,
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
                        childAspectRatio: isSmallScreen ? 1.8 : 1.4,
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
    return Card(
      color: AppColors.primaryBackground(context),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(icon, size: 50, color: AppColors.accentColor),
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
