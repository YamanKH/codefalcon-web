import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:code_falcon/app/ui/theme/app_colors.dart';
import 'package:code_falcon/app/ui/theme/app_text_styles.dart';
import '../models/team_member.dart';

class TeamSectionWidget extends StatelessWidget {
  const TeamSectionWidget({super.key});

  static const bool enableAnimations = !kIsWeb;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    final List<TeamMember> teamMembers = [
      TeamMember(
        nameKey: 'team_member_1_name',
        titleKey: 'team_member_1_role',
        imageUrl: 'https://api.dicebear.com/8.x/pixel-art/png?seed=YamanAlkhateb',
        socialLinks: {
          'linkedin': 'https://www.linkedin.com/in/yaman-alkhateb/',
          'github': 'https://github.com/YamanKH',
        },
      ),
      TeamMember(
        nameKey: 'team_member_2_name',
        titleKey: 'team_member_2_role',
        imageUrl: 'https://api.dicebear.com/8.x/pixel-art/png?seed=AreejFayadh',
        socialLinks: {
          'linkedin': 'https://linkedin.com/in/areejfayadh',
          'github': 'https://github.com/areejfayadh',
        },
      ),
      TeamMember(
        nameKey: 'team_member_3_name',
        titleKey: 'team_member_3_role',
        imageUrl: 'https://api.dicebear.com/8.x/pixel-art/png?seed=AhmedMohamed',
        socialLinks: {
          'linkedin': 'https://linkedin.com/in/ahmedmohamed',
          'github': 'https://github.com/ahmedmohamed',
        },
      ),
    ];

    return Container(
      key: const GlobalObjectKey('teamSection'),
      padding: EdgeInsets.all(isSmallScreen ? 20 : 40),
      color: AppColors.primaryBackground(context),
      child: Column(
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 375),
          childAnimationBuilder: (widget) => SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(child: widget),
          ),
          children: [
            _buildSectionTitle('team_title'.tr, context),
            const SizedBox(height: 30),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 800 ? 2 : 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: isSmallScreen ? 2.5 : 1.7,
            ),
            itemCount: teamMembers.length,
            itemBuilder: (context, index) {
              final member = teamMembers[index];
              return enableAnimations
                  ? AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      columnCount: MediaQuery.of(context).size.width > 800 ? 2 : 1,
                      child: ScaleAnimation(
                        child: FadeInAnimation(child: TeamMemberCard(member: member)),
                      ),
                    )
                  : TeamMemberCard(member: member);
            },
          ),
          ],
        ),
      ),
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

class TeamMemberCard extends StatelessWidget {
  final TeamMember member;

  const TeamMemberCard({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Card(
      color: AppColors.secondaryBackground(context),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 10 : 20),
        child: isSmallScreen
            ? Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/logo.png'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          member.nameKey.tr,
                          style: AppTextStyles.bodyText(context).copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor(context),
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          member.titleKey.tr,
                          style: AppTextStyles.bodyText(context).copyWith(
                            fontSize: 12,
                            color: AppColors.secondaryTextColor(context),
                          ),
                        ),
                        SizedBox(height: 10),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: member.socialLinks.entries.map((entry) {
                            IconData iconData;
                            switch (entry.key) {
                              case 'linkedin':
                                iconData = FontAwesomeIcons.linkedin;
                                break;
                              case 'twitter':
                                iconData = FontAwesomeIcons.twitter;
                                break;
                              case 'github':
                                iconData = FontAwesomeIcons.github;
                                break;
                              default:
                                iconData = Icons.link;
                            }
                            return IconButton(
                              icon: FaIcon(
                                iconData,
                                color: AppColors.accentColor,
                                size: 20,
                              ),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () async {
                                if (await canLaunchUrl(Uri.parse(entry.value))) {
                                  await launchUrl(Uri.parse(entry.value));
                                } else {
                                  debugPrint('Could not launch ${entry.value}');
                                }
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/logo.png'),
                  ),
                  SizedBox(height: 15),
                  Flexible(
                    child: Text(
                      member.nameKey.tr,
                      style: AppTextStyles.bodyText(context).copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor(context),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 5),
                  Flexible(
                    child: Text(
                      member.titleKey.tr,
                      style: AppTextStyles.bodyText(context).copyWith(
                        fontSize: 14,
                        color: AppColors.secondaryTextColor(context),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 15),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    runSpacing: 8,
                    children: member.socialLinks.entries.map((entry) {
                      IconData iconData;
                      switch (entry.key) {
                        case 'linkedin':
                          iconData = FontAwesomeIcons.linkedin;
                          break;
                        case 'twitter':
                          iconData = FontAwesomeIcons.twitter;
                          break;
                        case 'github':
                          iconData = FontAwesomeIcons.github;
                          break;
                        default:
                          iconData = Icons.link;
                      }
                      return IconButton(
                        icon: FaIcon(
                          iconData,
                          color: AppColors.accentColor,
                          size: 20,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () async {
                          if (await canLaunchUrl(Uri.parse(entry.value))) {
                            await launchUrl(Uri.parse(entry.value));
                          } else {
                            debugPrint('Could not launch ${entry.value}');
                          }
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
      ),
    );
  }
}
