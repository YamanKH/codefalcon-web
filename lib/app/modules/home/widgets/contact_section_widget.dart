import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:code_falcon/app/ui/theme/app_colors.dart';
import 'package:code_falcon/app/ui/theme/app_text_styles.dart';

class ContactSectionWidget extends StatefulWidget {
  const ContactSectionWidget({super.key});

  @override
  State<ContactSectionWidget> createState() => _ContactSectionWidgetState();
}

class _ContactSectionWidgetState extends State<ContactSectionWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> socialLinks = [
      {
        "url": "https://www.youtube.com/@CodingWithYaMaNn",
        "platform": "youtube",
      },
      {"url": "https://x.com/MaNoOox", "platform": "twitter"},
      {"url": "https://www.instagram.com/manoooz7/", "platform": "instagram"},
      {"url": "https://www.tiktok.com/@manoooz7", "platform": "tiktok"},
      {
        "url": "https://www.snapchat.com/add/manoooz7?share_id=VOMvd2JQY40&locale=en-SA",
        "platform": "snapchat",
      },
      {"url": "https://wa.me/963954783983", "platform": "whatsapp"},
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;
        return Container(
          key: const GlobalObjectKey('contactSection'),
          padding: EdgeInsets.all(isSmallScreen ? 20 : 40),
          color: AppColors.primaryBackground(context),
          child: Column(
            children: [
          _buildSectionTitle('contact_title'.tr, context),
              const SizedBox(height: 30),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isSmallScreen ? constraints.maxWidth * 0.9 : 600,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'name'.tr,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'name_required'.tr;
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        autofocus: true,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'email'.tr,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'email_required'.tr;
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'email_invalid'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _messageController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: 'message'.tr,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'message_required'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        ),
                        child: Text('send'.tr),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                'social_contact'.tr,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyText(context),
              ),
              const SizedBox(height: 30),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: socialLinks.map((link) {
                  return SocialIcon(
                    platform: link['platform']!,
                    url: link['url']!,
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Here you can handle form submission, e.g., send to backend or email
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'contact_success'.tr,
            style: AppTextStyles.bodyText(context)
                .copyWith(color: AppColors.accentForegroundColor(context)),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      // Clear form
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
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

class SocialIcon extends StatelessWidget {
  final String platform;
  final String url;

  const SocialIcon({super.key, required this.platform, required this.url});

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    switch (platform) {
      case 'youtube':
        iconData = FontAwesomeIcons.youtube;
        break;
      case 'twitter':
        iconData = FontAwesomeIcons.twitter;
        break;
      case 'instagram':
        iconData = FontAwesomeIcons.instagram;
        break;
      case 'tiktok':
        iconData = FontAwesomeIcons.tiktok;
        break;
      case 'snapchat':
        iconData = FontAwesomeIcons.snapchat;
        break;
      case 'whatsapp':
        iconData = FontAwesomeIcons.whatsapp;
        break;
      default:
        iconData = Icons.link;
    }

    return IconButton(
      icon: FaIcon(iconData, color: AppColors.textColor(context), size: 30),
      onPressed: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        } else {
          debugPrint('Could not launch $url');
        }
      },
    );
  }
}
