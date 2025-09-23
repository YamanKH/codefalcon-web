import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:code_falcon/app/ui/theme/app_colors.dart';
import 'package:code_falcon/app/ui/theme/app_text_styles.dart';

class ProjectsSectionWidget extends StatelessWidget {
  const ProjectsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 1;
        if (constraints.maxWidth > 1200) {
          crossAxisCount = 3;
        } else if (constraints.maxWidth > 800) {
          crossAxisCount = 2;
        } else {
          crossAxisCount = 1;
        }

        final isSmallScreen = constraints.maxWidth < 600;
        final projectItems = [
          const _ProjectItem(
            titleKey: 'restaurant_app',
            descriptionKey: 'restaurant_desc',
            imagePath: 'assets/TREAT_3.png',
            projectUrl: 'https://scandine.me',
          ),
          const _ProjectItem(
            titleKey: 'educational_platform',
            descriptionKey: 'educational_desc',
            imagePath: 'assets/TREAT_3.png',
          ),
          const _ProjectItem(
            titleKey: 'hospital_system',
            descriptionKey: 'hospital_desc',
            imagePath: 'assets/TREAT_3.png',
          ),
          const _ProjectItem(
            titleKey: 'delivery_app',
            descriptionKey: 'delivery_desc',
            imagePath: 'assets/TREAT_3.png',
          ),
          const _ProjectItem(
            titleKey: 'hr_system',
            descriptionKey: 'hr_desc',
            imagePath: 'assets/TREAT_3.png',
          ),
          const _ProjectItem(
            titleKey: 'payment_gateway',
            descriptionKey: 'payment_desc',
            imagePath: 'assets/TREAT_3.png',
          ),
        ];

        List<Widget> buildProjectCards() => projectItems
            .map((item) => ProjectCard(
                  titleKey: item.titleKey,
                  descriptionKey: item.descriptionKey,
                  imagePath: item.imagePath,
                  projectUrl: item.projectUrl,
                ))
            .toList();

        return Container(
          key: const GlobalObjectKey('projectsSection'),
          padding: EdgeInsets.all(isSmallScreen ? 20 : 40),
          color: AppColors.primaryBackground(context),
          child: Column(
            children: [
              _buildSectionTitle('projects_title'.tr, context),
              const SizedBox(height: 30),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: buildProjectCards(),
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

class ProjectCard extends StatelessWidget {
  final String titleKey;
  final String descriptionKey;
  final String imagePath;
  final String? projectUrl;

  const ProjectCard({
    super.key,
    required this.titleKey,
    required this.descriptionKey,
    required this.imagePath,
    this.projectUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: projectUrl != null ? () => _launchUrl(projectUrl!) : null,
      child: Card(
        color: AppColors.primaryBackground(context),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleKey.tr,
                      style: AppTextStyles.bodyText(context).copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.accentColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      descriptionKey.tr,
                      style: AppTextStyles.bodyText(context),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
}

  void _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      debugPrint('Could not launch $url');
    }
  }

}

class _ProjectItem {
  final String titleKey;
  final String descriptionKey;
  final String imagePath;
  final String? projectUrl;

  const _ProjectItem({
    required this.titleKey,
    required this.descriptionKey,
    required this.imagePath,
    this.projectUrl,
  });
}
