import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:code_falcon/app/routes/app_pages.dart';
import 'package:code_falcon/app/modules/home/theme_controller.dart';
import 'package:code_falcon/app/modules/home/locale_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
  Get.put(ThemeController()); // Initialize theme controller
  Get.put(LocaleController()); // Initialize locale controller
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final localeController = Get.find<LocaleController>();

    return Obx(() {
      return GetMaterialApp(
        title: "Code Falcon",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        theme: ThemeController.lightTheme,
        darkTheme: ThemeController.darkTheme,
        themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        locale: localeController.currentLocale.value,
        translations: AppTranslations(),
        fallbackLocale: const Locale('en', 'US'),
      );
    });
  }
}

