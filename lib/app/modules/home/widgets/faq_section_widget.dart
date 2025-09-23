import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_falcon/app/ui/theme/app_colors.dart';
import 'package:code_falcon/app/ui/theme/app_text_styles.dart';

class FAQItem {
  final String questionKey;
  final String answerKey;

  FAQItem({required this.questionKey, required this.answerKey});
}

class FAQSectionWidget extends StatefulWidget {
  const FAQSectionWidget({super.key});

  @override
  State<FAQSectionWidget> createState() => _FAQSectionWidgetState();
}

class _FAQSectionWidgetState extends State<FAQSectionWidget> {
  final List<FAQItem> faqs = [
    FAQItem(questionKey: 'faq_1_q', answerKey: 'faq_1_a'),
    FAQItem(questionKey: 'faq_2_q', answerKey: 'faq_2_a'),
    FAQItem(questionKey: 'faq_3_q', answerKey: 'faq_3_a'),
    FAQItem(questionKey: 'faq_4_q', answerKey: 'faq_4_a'),
    FAQItem(questionKey: 'faq_5_q', answerKey: 'faq_5_a'),
    FAQItem(questionKey: 'faq_6_q', answerKey: 'faq_6_a'),
  ];

  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const GlobalObjectKey('faqSection'),
      padding: const EdgeInsets.all(40),
      color: AppColors.primaryBackground(context),
      child: Column(
        children: [
          _buildSectionTitle('faq_title'.tr, context),
          const SizedBox(height: 30),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: faqs.length,
            itemBuilder: (context, index) {
              return FAQCard(
                faq: faqs[index],
                isExpanded: expandedIndex == index,
                onTap: () {
                  setState(() {
                    expandedIndex = expandedIndex == index ? null : index;
                  });
                },
              );
            },
          ),
        ],
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

class FAQCard extends StatelessWidget {
  final FAQItem faq;
  final bool isExpanded;
  final VoidCallback onTap;

  const FAQCard({
    super.key,
    required this.faq,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.secondaryBackground(context),
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      faq.questionKey.tr,
                      style: AppTextStyles.bodyText(context).copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor(context),
                      ),
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: AppColors.accentColor,
                  ),
                ],
              ),
              if (isExpanded) ...[
                const SizedBox(height: 15),
                Text(
                  faq.answerKey.tr,
                  style: AppTextStyles.bodyText(context).copyWith(
                    color: AppColors.secondaryTextColor(context),
                    height: 1.5,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
