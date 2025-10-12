import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'calculator_controller.dart';
import 'package:code_falcon/app/ui/theme/app_colors.dart';

class CalculatorHomePage extends StatelessWidget {
  const CalculatorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalculatorController>(
      init: CalculatorController(),
      builder: (controller) {
        return Directionality(
          textDirection: controller.isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            appBar: AppBar(
              title: Text('calculator_title'.tr),
              actions: [
                IconButton(
                  icon: Icon(Icons.language),
                  onPressed: () {
                    controller.localeController.changeLanguage(controller.isArabic ? 'en' : 'ar');
                  },
                ),
              ],
            ),
            body: Stepper(
              currentStep: controller.currentStep.value,
              onStepContinue: () {
                if (controller.currentStep.value == 3) {
                  controller.showQuoteSubmitted();
                } else {
                  controller.nextStep();
                }
              },
              onStepCancel: controller.currentStep.value > 0 ? controller.previousStep : null,
              controlsBuilder: (context, details) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    children: [
                      if (controller.currentStep.value > 0)
                        Expanded(
                          child: OutlinedButton(
                            onPressed: details.onStepCancel,
                            child: Text('previous'.tr),
                          ),
                        ),
                      if (controller.currentStep.value > 0) SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: details.onStepContinue,
                          child: Text(controller.currentStep.value == 3 ? 'finish'.tr : 'next'.tr),
                        ),
                      ),
                    ],
                  ),
                );
              },
              steps: [
                Step(
                  title: Text('choose_project_type'.tr),
                  content: _buildStep1Content(controller),
                  isActive: controller.currentStep.value >= 0,
                ),
                Step(
                  title: Text('select_technologies'.tr),
                  content: _buildStep2Content(controller),
                  isActive: controller.currentStep.value >= 1,
                ),
                Step(
                  title: Text('choose_package'.tr),
                  content: _buildStep3Content(controller),
                  isActive: controller.currentStep.value >= 2,
                ),
                Step(
                  title: Text('project_summary_title'.tr),
                  content: _buildStep4Content(controller),
                  isActive: controller.currentStep.value >= 3,
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              heroTag: 'whatsapp',
              onPressed: controller.showWhatsAppContact,
              backgroundColor: Colors.green,
              child: Icon(Icons.message),
              tooltip: 'contact_whatsapp'.tr,
            ),
          ),
        );
      },
    );
  }

  Widget _buildStep1Content(CalculatorController controller) {
    final screenWidth = MediaQuery.of(Get.context!).size.width;
    final isSmallScreen = screenWidth < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'choose_project_type'.tr,
          style: Theme.of(Get.context!).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        if (isSmallScreen)
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: projectCategories.length,
            itemBuilder: (context, index) {
              final category = projectCategories[index];
              return Obx(() => Container(
                margin: EdgeInsets.only(bottom: 12),
                child: Tooltip(
                  message: controller.isArabic ? category.descriptionAr : category.descriptionEn,
                  child: Card(
                    elevation: controller.selectedCategory.value == category.id ? 8 : 2,
                    color: controller.selectedCategory.value == category.id ? AppColors.accentColor.withValues(alpha: 0.1) : null,
                    child: InkWell(
                      onTap: () {
                        controller.selectCategory(controller.selectedCategory.value == category.id ? null : category.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Icon(category.icon, size: 40, color: controller.selectedCategory.value == category.id ? AppColors.accentColor : Theme.of(context).primaryColor),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.isArabic ? category.nameAr : category.nameEn,
                                    style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    controller.isArabic ? category.descriptionAr : category.descriptionEn,
                                    style: Theme.of(context).textTheme.bodySmall,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
            },
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: screenWidth > 800 ? 3 : 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
            ),
            itemCount: projectCategories.length,
            itemBuilder: (context, index) {
              final category = projectCategories[index];
              return Obx(() => Tooltip(
                message: controller.isArabic ? category.descriptionAr : category.descriptionEn,
                child: Card(
                  elevation: controller.selectedCategory.value == category.id ? 8 : 2,
                  color: controller.selectedCategory.value == category.id ? AppColors.accentColor.withValues(alpha: 0.1) : null,
                  child: InkWell(
                    onTap: () {
                      controller.selectCategory(controller.selectedCategory.value == category.id ? null : category.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(category.icon, size: 40, color: controller.selectedCategory.value == category.id ? AppColors.accentColor : Theme.of(context).primaryColor),
                          SizedBox(height: 8),
                          Text(
                            controller.isArabic ? category.nameAr : category.nameEn,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            controller.isArabic ? category.descriptionAr : category.descriptionEn,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
            },
          ),
      ],
    );
  }

  Widget _buildStep2Content(CalculatorController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'select_technologies'.tr,
          style: Theme.of(Get.context!).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),

        // Frontend
        Text('frontend_framework'.tr, style: Theme.of(Get.context!).textTheme.titleMedium),
        SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: techStacks.where((tech) => tech.type == 'frontend').map((tech) {
            return Obx(() => Tooltip(
              message: tech.name,
              child: ChoiceChip(
                label: Text(tech.name, style: TextStyle(fontWeight: FontWeight.w500)),
                selected: controller.selectedFrontend.value == tech.id,
                onSelected: (selected) {
                  controller.selectFrontend(selected ? tech.id : null);
                },
                selectedColor: AppColors.accentColor.withValues(alpha: 0.2),
              ),
            ));
          }).toList(),
        ),

        SizedBox(height: 24),

        // Backend
        Text('backend_technology'.tr, style: Theme.of(Get.context!).textTheme.titleMedium),
        SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: techStacks.where((tech) => tech.type == 'backend').map((tech) {
            return Obx(() => Tooltip(
              message: tech.name,
              child: ChoiceChip(
                label: Text(tech.name, style: TextStyle(fontWeight: FontWeight.w500)),
                selected: controller.selectedBackend.value == tech.id,
                onSelected: (selected) {
                  controller.selectBackend(selected ? tech.id : null);
                },
                selectedColor: AppColors.accentColor.withValues(alpha: 0.2),
              ),
            ));
          }).toList(),
        ),

        SizedBox(height: 24),

        // Database
        Text('database_system'.tr, style: Theme.of(Get.context!).textTheme.titleMedium),
        SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: techStacks.where((tech) => tech.type == 'database').map((tech) {
            return Obx(() => Tooltip(
              message: tech.name,
              child: ChoiceChip(
                label: Text(tech.name, style: TextStyle(fontWeight: FontWeight.w500)),
                selected: controller.selectedDatabase.value == tech.id,
                onSelected: (selected) {
                  controller.selectDatabase(selected ? tech.id : null);
                },
                selectedColor: AppColors.accentColor.withValues(alpha: 0.2),
              ),
            ));
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildStep3Content(CalculatorController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'choose_package'.tr,
          style: Theme.of(Get.context!).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(Get.context!).size.width > 800 ? 2 : 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.8,
          ),
          itemCount: packageTiers.length,
          itemBuilder: (context, index) {
            final tier = packageTiers[index];
            return Obx(() => Tooltip(
              message: controller.isArabic ? tier.descriptionAr : tier.descriptionEn,
              child: Card(
                elevation: controller.selectedTier.value == tier.id ? 8 : 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                color: controller.selectedTier.value == tier.id ? tier.color.withValues(alpha: 0.1) : null,
                child: InkWell(
                  onTap: () {
                    controller.selectTier(controller.selectedTier.value == tier.id ? null : tier.id);
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: tier.color,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                controller.isArabic ? tier.nameAr : tier.nameEn,
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Radio<String>(
                              value: tier.id,
                              groupValue: controller.selectedTier.value,
                              onChanged: (String? value) {
                                if (value != null) {
                                  controller.selectTier(value);
                                }
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text(
                          controller.isArabic ? tier.descriptionAr : tier.descriptionEn,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(height: 16),
                        Expanded(
                          child: ListView.builder(
                            itemCount: tier.featuresEn.length,
                            itemBuilder: (context, idx) => Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Row(
                                children: [
                                  Icon(Icons.check_circle, size: 18, color: tier.color),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      controller.isArabic ? tier.featuresAr[idx] : tier.featuresEn[idx],
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: tier.color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '\$${tier.basePrice.toStringAsFixed(0)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
          },
        ),
      ],
    );
  }

  Widget _buildStep4Content(CalculatorController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'project_summary_title'.tr,
          style: Theme.of(Get.context!).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 24),
        Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(Get.context!).primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(Get.context!).primaryColor),
          ),
          child: Column(
            children: [
              Icon(Icons.receipt_long, size: 48, color: Theme.of(Get.context!).primaryColor),
              SizedBox(height: 16),
              Text(
                'project_summary_title'.tr,
                style: Theme.of(Get.context!).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              if (controller.selectedCategoryData != null)
                _buildSummaryItem('project_type'.tr, controller.selectedCategoryData!.nameEn),
              if (controller.selectedFrontendData != null)
                _buildSummaryItem('frontend_framework'.tr.replaceAll(':', ''), controller.selectedFrontendData!.name),
              if (controller.selectedBackendData != null)
                _buildSummaryItem('backend_technology'.tr.replaceAll(':', ''), controller.selectedBackendData!.name),
              if (controller.selectedDatabaseData != null)
                _buildSummaryItem('database_system'.tr.replaceAll(':', ''), controller.selectedDatabaseData!.name),
              if (controller.selectedTierData != null)
                _buildSummaryItem('package'.tr, controller.selectedTierData!.nameEn),
              SizedBox(height: 24),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: AppColors.accentColor,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'total_price_label'.tr,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '\$${controller.totalPrice.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: Theme.of(Get.context!).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
