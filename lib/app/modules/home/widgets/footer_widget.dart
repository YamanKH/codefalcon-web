import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_falcon/app/ui/theme/app_colors.dart';
import 'package:code_falcon/app/ui/theme/app_text_styles.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColors.primaryBackground(context),
      width: double.infinity,
      child: Column(
        children: [
          // Newsletter Signup
          Text(
            'newsletter_title'.tr,
            style: AppTextStyles.heading3(context).copyWith(
              color: AppColors.accentColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'newsletter_subtitle'.tr,
            style: AppTextStyles.bodyText(context).copyWith(
              color: AppColors.secondaryTextColor(context),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'newsletter_hint'.tr,
                        hintStyle: AppTextStyles.bodyText(context).copyWith(
                          color: AppColors.secondaryTextColor(context),
                        ),
                        filled: true,
                        fillColor: AppColors.secondaryBackground(context),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
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
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _subscribe,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentColor,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'subscribe'.tr,
                      style: AppTextStyles.bodyText(context).copyWith(
                        color: AppColors.accentForegroundColor(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          // Copyright
          Text(
            'footer_rights'.tr,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyText(context).copyWith(
              color: AppColors.secondaryTextColor(context),
            ),
          ),
        ],
      ),
    );
  }

  void _subscribe() {
    if (_formKey.currentState!.validate()) {
      // Here you can integrate with email service
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'subscription_success'.tr,
            style: AppTextStyles.bodyText(context)
                .copyWith(color: AppColors.accentForegroundColor(context)),
          ),
          backgroundColor: AppColors.accentColor,
        ),
      );
      _emailController.clear();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
