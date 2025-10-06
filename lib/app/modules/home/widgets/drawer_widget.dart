import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_falcon/app/ui/theme/app_colors.dart';
import 'package:code_falcon/app/ui/theme/app_text_styles.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryBackground(context),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.accentColor,
            ),
            child: Text(
              'drawer_menu_title'.tr,
              style: AppTextStyles.heading2(context)
                  .copyWith(color: AppColors.textColor(context)),
            ),
          ),
          const DrawerNavLink(titleKey: 'home', sectionKey: 'homeSection'),
          const DrawerNavLink(titleKey: 'about', sectionKey: 'aboutSection'),
          const DrawerNavLink(titleKey: 'services', sectionKey: 'servicesSection'),
          const CalculatorDrawerNavLink(titleKey: 'calculator'),
          const DrawerNavLink(titleKey: 'projects', sectionKey: 'projectsSection'),
          const DrawerNavLink(titleKey: 'team', sectionKey: 'teamSection'),
          const DrawerNavLink(titleKey: 'contact', sectionKey: 'contactSection'),
        ],
      ),
    );
  }
}

class DrawerNavLink extends StatelessWidget {
  final String titleKey;
  final String sectionKey;

  const DrawerNavLink({super.key, required this.titleKey, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        titleKey.tr,
        style: AppTextStyles.bodyText(context)
            .copyWith(color: AppColors.textColor(context)),
      ),
      onTap: () {
        _scrollToSection(sectionKey);
        Navigator.pop(context); // Close the drawer
      },
    );
  }

  void _scrollToSection(String sectionKey) {
    final globalKey = GlobalObjectKey(sectionKey);
    Scrollable.ensureVisible(
      globalKey.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

class CalculatorDrawerNavLink extends StatelessWidget {
  final String titleKey;

  const CalculatorDrawerNavLink({super.key, required this.titleKey});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        titleKey.tr,
        style: AppTextStyles.bodyText(context)
            .copyWith(color: AppColors.textColor(context)),
      ),
      onTap: () {
        Get.toNamed('/calculator');
        Navigator.pop(context); // Close the drawer
      },
    );
  }
}
