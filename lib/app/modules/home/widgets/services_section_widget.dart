import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:code_falcon/app/ui/theme/app_colors.dart';
import 'package:code_falcon/app/ui/theme/app_text_styles.dart';
import '../models/service.dart';
import '../home_controller.dart';

class ServicesSectionWidget extends StatelessWidget {
  const ServicesSectionWidget({super.key});

  static const bool enableAnimations = !kIsWeb;

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) {
        final isLoading = controller.isLoadingServices.value;
        final services = controller.services.isNotEmpty ? controller.services : [
          Service(
            id: '1',
            name: 'Web Development',
            description: 'Building responsive and modern web applications using the latest technologies.',
          ),
          Service(
            id: '2',
            name: 'Mobile Development',
            description: 'Creating cross-platform mobile apps for iOS and Android.',
          ),
          Service(
            id: '3',
            name: 'UI/UX Design',
            description: 'Designing intuitive and beautiful user interfaces and experiences.',
          ),
          Service(
            id: '4',
            name: 'Consulting',
            description: 'Providing expert advice on technology solutions and best practices.',
          ),
          Service(
            id: '5',
            name: 'AI Solutions',
            description: 'Implementing artificial intelligence and machine learning solutions.',
          ),
          Service(
            id: '6',
            name: 'Cloud Services',
            description: 'Deploying and managing applications on cloud platforms.',
          ),
        ];

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

            List<Widget> buildCards() => services
                .map((service) => ServiceCard(
                      name: service.name,
                      description: service.description,
                      iconUrl: service.iconUrl,
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
                  if (isLoading)
                    const Center(child: CircularProgressIndicator())
                  else
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
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () => Get.toNamed('/calculator'),
                      icon: Icon(Icons.calculate),
                      label: Text('use_calculator'.tr),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        backgroundColor: AppColors.accentColor,
                        foregroundColor: AppColors.accentForegroundColor(context),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
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
  final String name;
  final String description;
  final String? iconUrl;

  const ServiceCard({
    super.key,
    required this.name,
    required this.description,
    this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    final defaultIcons = [
      Icons.language,
      Icons.phone_android,
      Icons.design_services,
      Icons.lightbulb,
      Icons.smart_toy,
      Icons.cloud,
    ];
    final icon = iconUrl != null && iconUrl!.isNotEmpty
        ? Icons.web // placeholder, since iconUrl is string, but for now use default
        : defaultIcons[0]; // fallback

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
                          name,
                          style: AppTextStyles.bodyText(context).copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Text(
                          description,
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
                      name,
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
                      description,
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

