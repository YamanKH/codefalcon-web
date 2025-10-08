import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:code_falcon/app/ui/theme/app_colors.dart';
import 'locale_controller.dart';
import 'home_controller.dart';
import 'widgets/header_widget.dart';
import 'widgets/hero_section_widget.dart';
import 'widgets/about_section_widget.dart';
import 'widgets/services_section_widget.dart';
import 'widgets/calculator_section_widget.dart';
import 'widgets/projects_section_widget.dart';
import 'widgets/technologies_section_widget.dart';
import 'widgets/team_section_widget.dart';
import 'widgets/testimonials_section_widget.dart';
import 'widgets/faq_section_widget.dart';
import 'widgets/contact_section_widget.dart';
import 'widgets/footer_widget.dart';
import 'widgets/drawer_widget.dart';
import 'package:code_falcon/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  static const bool enableAnimations = !kIsWeb;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    // Ensure scroll starts at top
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(0.0);
      }
    });

    final localeController = Get.find<LocaleController>();

    final widget = Obx(() {
      final textDirection =
          localeController.isArabic ? TextDirection.rtl : TextDirection.ltr;

      return Directionality(
        textDirection: textDirection,
        child: Scaffold(
          body: SingleChildScrollView(
            controller: scrollController,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 320),
              child: Column(
                children: enableAnimations
                    ? AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 375),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(child: widget),
                      ),
                      children: const [
                        HeaderWidget(),
                        HeroSectionWidget(),
                        AboutSectionWidget(),
                        ServicesSectionWidget(),
                        ProjectsSectionWidget(),
                        TechnologiesSectionWidget(),
                        TeamSectionWidget(),
                        TestimonialsSectionWidget(),
                        FAQSectionWidget(),
                        ContactSectionWidget(),
                        FooterWidget(),
                      ],
                    )
                  : const [
                      HeaderWidget(),
                      HeroSectionWidget(),
                      AboutSectionWidget(),
                      ServicesSectionWidget(),
                      ProjectsSectionWidget(),
                      TechnologiesSectionWidget(),
                      TeamSectionWidget(),
                      TestimonialsSectionWidget(),
                      FAQSectionWidget(),
                      ContactSectionWidget(),
                      FooterWidget(),
                    ],
              ),
            ),
          ),
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'calculator',
                onPressed: () {
                  Get.toNamed(Routes.calculator);
                },
                backgroundColor: AppColors.accentColor,
                child: Icon(
                  Icons.calculate,
                  color: AppColors.accentForegroundColor(context),
                ),
                tooltip: 'calculator_title'.tr,
              ),
              const SizedBox(height: 16),
              FloatingActionButton(
                heroTag: 'scrollTop',
                onPressed: () {
                  scrollController.animateTo(
                    0.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                backgroundColor: AppColors.accentColor,
                child: Icon(
                  Icons.arrow_upward,
                  color: AppColors.accentForegroundColor(context),
                ),
                tooltip: 'Scroll to top',
              ),
            ],
          ),
          drawer: const DrawerWidget(),
        ),
      );
    });
    return widget;
  }
}
