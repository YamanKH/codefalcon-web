import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:code_falcon/app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
  runApp(
    GetMaterialApp(
      title: "Code Falcon",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}