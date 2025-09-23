import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:code_falcon/app/ui/theme/app_colors.dart';
import 'package:code_falcon/app/ui/theme/app_text_styles.dart';

class TechnologiesSectionWidget extends StatelessWidget {
  const TechnologiesSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_TechnologyItem> technologies = [
      _TechnologyItem(
        nameKey: 'flutter',
        descriptionKey: 'flutter_desc',
        icon: FontAwesomeIcons.mobileScreenButton,
        color: Colors.blue,
      ),
      _TechnologyItem(
        nameKey: 'react',
        descriptionKey: 'react_desc',
        icon: FontAwesomeIcons.react,
        color: Colors.cyan,
      ),
      _TechnologyItem(
        nameKey: 'nodejs',
        descriptionKey: 'nodejs_desc',
        icon: FontAwesomeIcons.nodeJs,
        color: Colors.green,
      ),
      _TechnologyItem(
        nameKey: 'python',
        descriptionKey: 'python_desc',
        icon: FontAwesomeIcons.python,
        color: Colors.yellow.shade700,
      ),
      _TechnologyItem(
        nameKey: 'firebase',
        descriptionKey: 'firebase_desc',
        icon: FontAwesomeIcons.fire,
        color: Colors.orange,
      ),
      _TechnologyItem(
        nameKey: 'mongodb',
        descriptionKey: 'mongodb_desc',
        icon: FontAwesomeIcons.database,
        color: Colors.green.shade700,
      ),
      _TechnologyItem(
        nameKey: 'aws',
        descriptionKey: 'aws_desc',
        icon: FontAwesomeIcons.aws,
        color: Colors.orange.shade700,
      ),
      _TechnologyItem(
        nameKey: 'docker',
        descriptionKey: 'docker_desc',
        icon: FontAwesomeIcons.docker,
        color: Colors.blue.shade700,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 2;
        if (constraints.maxWidth > 1200) {
          crossAxisCount = 4;
        } else if (constraints.maxWidth > 800) {
          crossAxisCount = 3;
        } else if (constraints.maxWidth > 500) {
          crossAxisCount = 2;
        }

        return Container(
          key: const GlobalObjectKey('technologiesSection'),
          padding: const EdgeInsets.all(40),
          color: AppColors.primaryBackground(context),
          child: Column(
            children: [
              _buildSectionTitle('technologies_title'.tr, context),
              const SizedBox(height: 30),
              AnimationLimiter(
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 375),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(child: widget),
                    ),
                    children: technologies
                        .map((tech) => TechnologyCard(
                              nameKey: tech.nameKey,
                              descriptionKey: tech.descriptionKey,
                              icon: tech.icon,
                              color: tech.color,
                            ))
                        .toList(),
                  ),
                ),
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

class TechnologyCard extends StatelessWidget {
  final String nameKey;
  final String descriptionKey;
  final IconData icon;
  final Color color;

  const TechnologyCard({
    super.key,
    required this.nameKey,
    required this.descriptionKey,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.secondaryBackground(context),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              nameKey.tr,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyText(context).copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textColor(context),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              descriptionKey.tr,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyText(context)
                  .copyWith(color: AppColors.secondaryTextColor(context), fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class _TechnologyItem {
  final String nameKey;
  final String descriptionKey;
  final IconData icon;
  final Color color;

  const _TechnologyItem({
    required this.nameKey,
    required this.descriptionKey,
    required this.icon,
    required this.color,
  });
}
