import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:code_falcon/app/ui/theme/app_colors.dart';
import 'package:code_falcon/app/ui/theme/app_text_styles.dart';
import '../models/testimonial.dart';
import '../home_controller.dart';


class TestimonialsSectionWidget extends StatelessWidget {
  const TestimonialsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) {
        final isLoading = controller.isLoadingTestimonials.value;
        final testimonials = controller.testimonials.isNotEmpty ? controller.testimonials : [
          Testimonial(
            id: '1',
            name: 'Sarah Ahmed',
            position: 'CEO',
            company: 'TechCorp',
            message: 'Excellent service and support!',
            imageUrl: 'https://api.dicebear.com/8.x/avataaars/png?seed=SarahAhmed',
            rating: 5,
          ),
          Testimonial(
            id: '2',
            name: 'Mohamed Ali',
            position: 'Developer',
            company: 'StartupXYZ',
            message: 'Highly recommend their work.',
            imageUrl: 'https://api.dicebear.com/8.x/avataaars/png?seed=MohamedAli',
            rating: 5,
          ),
          Testimonial(
            id: '3',
            name: 'Fatma Hassan',
            position: 'Manager',
            company: 'InnovateLtd',
            message: 'Professional and timely delivery.',
            imageUrl: 'https://api.dicebear.com/8.x/avataaars/png?seed=FatmaHassan',
            rating: 5,
          ),
        ];

        final isSmallScreen = MediaQuery.of(context).size.width < 600;

        return Container(
          padding: EdgeInsets.all(isSmallScreen ? 20 : 40),
          color: AppColors.secondaryBackground(context),
          child: Column(
            children: [
              _buildSectionTitle('testimonials_title'.tr, context),
              SizedBox(height: isSmallScreen ? 20 : 30),
              if (isLoading)
                const Center(child: CircularProgressIndicator())
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: testimonials.length,
                  itemBuilder: (context, index) {
                    final testimonial = testimonials[index];
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      columnCount: MediaQuery.of(context).size.width > 800 ? 3 : 1,
                      child: ScaleAnimation(
                        child: FadeInAnimation(child: TestimonialCard(testimonial: testimonial)),
                      ),
                    );
                  },
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

class TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;

  const TestimonialCard({super.key, required this.testimonial});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Card(
      color: AppColors.primaryBackground(context),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 15 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: List.generate(
                testimonial.rating,
                (index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 16,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Text(
                '"${testimonial.message}"',
                style: AppTextStyles.bodyText(context).copyWith(
                  fontStyle: FontStyle.italic,
                  color: AppColors.textColor(context),
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: testimonial.imageUrl != null && testimonial.imageUrl!.isNotEmpty
                      ? NetworkImage(testimonial.imageUrl!)
                      : AssetImage('assets/logo.png'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        testimonial.name,
                        style: AppTextStyles.bodyText(context).copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.accentColor,
                        ),
                      ),
                      Text(
                        '${testimonial.position} - ${testimonial.company}',
                        style: AppTextStyles.bodyText(context).copyWith(
                          fontSize: 12,
                          color: AppColors.secondaryTextColor(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
