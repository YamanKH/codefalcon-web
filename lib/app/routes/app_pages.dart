import 'package:get/get.dart';

import 'package:code_falcon/app/modules/home/home_binding.dart';
import 'package:code_falcon/app/modules/home/home_view.dart';
import 'package:code_falcon/calculator/calculator_binding.dart';
import 'package:code_falcon/calculator/calculator_home.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;
  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.calculator,
      page: () => const CalculatorHomePage(),
      binding: CalculatorBinding(),
    ),
  ];
}