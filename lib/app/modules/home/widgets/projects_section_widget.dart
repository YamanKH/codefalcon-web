import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:code_falcon/app/ui/theme/app_colors.dart';
import 'package:code_falcon/app/ui/theme/app_text_styles.dart';
import '../home_controller.dart';

class ProjectsSectionWidget extends StatelessWidget {
  const ProjectsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>( // Obx-style rebuilds for Rx vars
      builder: (controller) {
        final isLoading = controller.isLoading.value;
        final items = controller.projects;

        return LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount;
            if (constraints.maxWidth > 1200) {
              crossAxisCount = 3;
            } else if (constraints.maxWidth > 800) {
              crossAxisCount = 2;
            } else {
              crossAxisCount = 1;
            }

            final isSmallScreen = constraints.maxWidth < 600;

            return Container(
              key: const GlobalObjectKey('projectsSection'),
              padding: EdgeInsets.all(isSmallScreen ? 20 : 40),
              color: AppColors.primaryBackground(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildSectionTitle('projects_title'.tr, context),
                  const SizedBox(height: 30),

                  if (isLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (items.isEmpty)
                    Center(
                      child: Text(
                        'No projects yet',
                        style: AppTextStyles.bodyText(context),
                      ),
                    )
                  else
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 4 / 3,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, i) {
                        final p = items[i];
                        return ProjectCard(
                          title: p.name,
                          techs: p.techused,
                          imageUrl: p.imageUrl,
                          projectUrl: p.url,
                        );
                      },
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
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final List<String> techs;
  final String? imageUrl;     // from sheet
  final String? projectUrl;   // from sheet

  static const Map<String, IconData> _techIcons = {
    'Flutter': FontAwesomeIcons.mobileScreenButton,
    'Dart': Icons.code,
    'React': FontAwesomeIcons.react,
    'JavaScript': Icons.javascript,
    'Node.js': FontAwesomeIcons.nodeJs,
    'Express': Icons.http,
    'MongoDB': FontAwesomeIcons.database,
    'Firebase': FontAwesomeIcons.fire,
    'Angular': Icons.web_asset,
    'TypeScript': Icons.code,
    'Vue.js': Icons.web,
    'HTML': Icons.html,
    'CSS': Icons.css,
    'Python': FontAwesomeIcons.python,
    'Java': Icons.code,
    'C++': Icons.code,
    'PHP': Icons.code,
    'SQL': Icons.table_chart,
    'Git': Icons.merge_type,
    'Docker': FontAwesomeIcons.docker,
    'AWS': FontAwesomeIcons.aws,
    'Heroku': Icons.cloud,
    'PostgreSQL': Icons.storage,
    'MySQL': Icons.storage,
    'Redis': Icons.memory,
    'GraphQL': Icons.share,
    'REST': Icons.api,
    'WebSocket': Icons.cable,
    'Health Kit': Icons.health_and_safety,
    'Spotify API': Icons.music_note,
  };

  const ProjectCard({
    super.key,
    required this.title,
    required this.techs,
    this.imageUrl,
    this.projectUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (projectUrl != null && projectUrl!.isNotEmpty)
          ? () => _launchUrl(projectUrl!)
          : null,
      child: Card(
        color: AppColors.primaryBackground(context),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image (network with fallback)
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: _buildImage(),
                ),
              ),
              const SizedBox(height: 12),

              // Title
              Text(
                title,
                style: AppTextStyles.bodyText(context).copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.accentColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),

              // Tech icons
              if (techs.isNotEmpty)
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: techs.map((tech) => _buildTechIcon(tech)).toList(),
                )
              else
                Text(
                  'No technologies',
                  style: AppTextStyles.bodyText(context),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    // network image with graceful fallback to asset/icon
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        width: double.infinity,
        errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.image_not_supported)),
        // You can add a simple placeholder with a faded container if you want
        // loadingBuilder: (ctx, child, progress) => progress == null ? child : const Center(child: CircularProgressIndicator()),
      );
    }
    // fallback (your previous asset)
    return Image.asset(
      'assets/TREAT_3.png',
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }

  Widget _buildTechIcon(String tech) {
    final icon = _techIcons[tech] ?? Icons.code;
    return Tooltip(
      message: tech,
      child: FaIcon(icon, size: 20, color: Colors.grey[600]),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }
}
