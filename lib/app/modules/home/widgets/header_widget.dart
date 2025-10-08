import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_falcon/app/ui/theme/app_colors.dart';
import 'package:code_falcon/app/ui/theme/app_text_styles.dart';
import '../theme_controller.dart';
import '../locale_controller.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/logo.png', height: 60),
          if (MediaQuery.of(context).size.width > 800)
            Row(
              children: [
                NavLink(title: 'home'.tr, sectionKey: 'homeSection'),
                NavLink(title: 'about'.tr, sectionKey: 'aboutSection'),
                NavLink(title: 'services'.tr, sectionKey: 'servicesSection'),
                NavLink(title: 'calculator'.tr, sectionKey: 'calculatorSection'),
                NavLink(title: 'projects'.tr, sectionKey: 'projectsSection'),
                NavLink(title: 'team'.tr, sectionKey: 'teamSection'),
                NavLink(title: 'contact'.tr, sectionKey: 'contactSection'),
                const SizedBox(width: 20),
                Obx(() {
                  final themeController = Get.find<ThemeController>();
                  return IconButton(
                    onPressed: () {
                      themeController.toggleTheme();
                    },
                    icon: Icon(
                      themeController.isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
                      color: AppColors.accentColor,
                    ),
                  );
                }),
                Obx(() {
                  final localeController = Get.find<LocaleController>();
                  return TextButton(
                    onPressed: () {
                      localeController.changeLanguage(localeController.isArabic ? 'en' : 'ar');
                    },
                    child: Text(
                      localeController.isArabic ? 'EN' : 'AR',
                      style: AppTextStyles.bodyText(context)
                          .copyWith(color: AppColors.accentColor),
                    ),
                  );
                }),
              ],
            )
          else
            Row(
              children: [
                Obx(() {
                  final themeController = Get.find<ThemeController>();
                  return IconButton(
                    onPressed: () {
                      themeController.toggleTheme();
                    },
                    icon: Icon(
                      themeController.isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
                      color: AppColors.accentColor,
                      size: 20,
                    ),
                  );
                }),
                Obx(() {
                  final localeController = Get.find<LocaleController>();
                  return TextButton(
                    onPressed: () {
                      localeController.changeLanguage(localeController.isArabic ? 'en' : 'ar');
                    },
                    child: Text(
                      localeController.isArabic ? 'EN' : 'AR',
                      style: AppTextStyles.bodyText(context)
                          .copyWith(color: AppColors.accentColor),
                    ),
                  );
                }),
                IconButton(
                  icon: Icon(Icons.menu, color: Theme.of(context).textTheme.bodyLarge?.color),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class NavLink extends StatelessWidget {
  final String title;
  final String sectionKey;

  const NavLink({super.key, required this.title, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _scrollToSection(sectionKey),
      child: Text(
        title,
        style: AppTextStyles.bodyText(context)
            .copyWith(color: Theme.of(context).textTheme.bodyLarge?.color),
      ),
    );
  }

  void _scrollToSection(String sectionKey) {
    final globalKey = GlobalObjectKey(sectionKey);
    final context = globalKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}

