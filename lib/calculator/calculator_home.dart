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
            body: Obx(() => Stepper(
              currentStep: controller.currentStep.value,
              onStepContinue: () {
                if (controller.currentStep.value == 6) {
                  controller.showQuoteSubmitted();
                } else {
                  controller.nextStep();
                }
              },
              onStepCancel: controller.currentStep.value > 0 ? controller.previousStep : null,
              controlsBuilder: (context, details) => SizedBox.shrink(),
              steps: [
                Step(
                  title: Text(controller.isArabic ? 'اختر المنصة' : 'Choose Platform'),
                  content: _buildStep1Content(controller),
                  isActive: controller.currentStep.value >= 0,
                ),
                Step(
                  title: Text(controller.isArabic ? 'اختر التقنية' : 'Choose Technology'),
                  content: _buildStep2Content(controller),
                  isActive: controller.currentStep.value >= 1,
                ),
                Step(
                  title: Text(controller.isArabic ? 'عدد الشاشات' : 'Number of Screens'),
                  content: _buildStep3Content(controller),
                  isActive: controller.currentStep.value >= 2,
                ),
                Step(
                  title: Text(controller.isArabic ? 'الخادم وقاعدة البيانات' : 'Backend & Database'),
                  content: _buildStep4Content(controller),
                  isActive: controller.currentStep.value >= 3,
                ),
                Step(
                  title: Text(controller.isArabic ? 'اختر الباقة' : 'Choose Package'),
                  content: _buildStep5Content(controller),
                  isActive: controller.currentStep.value >= 4,
                ),
                Step(
                  title: Text(controller.isArabic ? 'الخدمات الإضافية' : 'Additional Services'),
                  content: _buildStep6Content(controller),
                  isActive: controller.currentStep.value >= 5,
                ),
                Step(
                  title: Text(controller.isArabic ? 'ملخص المشروع' : 'Project Summary'),
                  content: _buildStep7Content(controller),
                  isActive: controller.currentStep.value >= 6,
                ),
              ],
            )),
            bottomNavigationBar: Obx(() => Container(
              padding: EdgeInsets.all(16),
              color: AppColors.primaryBackground(Get.context!),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (controller.totalPrice > 0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.isArabic ? 'السعر التقديري:' : 'Estimated Price:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '\$${controller.totalPrice.toStringAsFixed(0)}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.accentColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  if (controller.totalPrice > 0) SizedBox(height: 16),
                  Row(
                    children: [
                      if (controller.currentStep.value > 0)
                        Expanded(
                          child: OutlinedButton(
                            onPressed: controller.previousStep,
                            child: Text('previous'.tr),
                          ),
                        ),
                      if (controller.currentStep.value > 0) SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: controller.currentStep.value == 6
                            ? controller.showQuoteSubmitted
                            : controller.canProceedToNextStep()
                              ? controller.nextStep
                              : null,
                          child: Text(controller.currentStep.value == 6 ? 'finish'.tr : 'next'.tr),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
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
          controller.isArabic ? 'اختر المنصة' : 'Choose Platform',
          style: Theme.of(Get.context!).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        if (isSmallScreen)
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: platforms.length,
            itemBuilder: (context, index) {
              final platform = platforms[index];
              return Obx(() => Container(
                margin: EdgeInsets.only(bottom: 12),
                child: Tooltip(
                  message: controller.isArabic ? platform.descriptionAr : platform.descriptionEn,
                  child: Card(
                    elevation: controller.selectedPlatform.value == platform.id ? 8 : 2,
                    color: controller.selectedPlatform.value == platform.id ? AppColors.accentColor.withValues(alpha: 0.1) : null,
                    child: InkWell(
                      onTap: () {
                        controller.selectPlatform(controller.selectedPlatform.value == platform.id ? null : platform.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Icon(platform.icon, size: 40, color: controller.selectedPlatform.value == platform.id ? AppColors.accentColor : Theme.of(context).primaryColor),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.isArabic ? platform.nameAr : platform.nameEn,
                                    style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    controller.isArabic ? platform.descriptionAr : platform.descriptionEn,
                                    style: Theme.of(context).textTheme.bodySmall,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
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
            itemCount: platforms.length,
            itemBuilder: (context, index) {
              final platform = platforms[index];
              return Obx(() => Tooltip(
                message: controller.isArabic ? platform.descriptionAr : platform.descriptionEn,
                child: Card(
                  elevation: controller.selectedPlatform.value == platform.id ? 8 : 2,
                  color: controller.selectedPlatform.value == platform.id ? AppColors.accentColor.withValues(alpha: 0.1) : null,
                  child: InkWell(
                    onTap: () {
                      controller.selectPlatform(controller.selectedPlatform.value == platform.id ? null : platform.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(platform.icon, size: 40, color: controller.selectedPlatform.value == platform.id ? AppColors.accentColor : Theme.of(context).primaryColor),
                          SizedBox(height: 8),
                          Text(
                            controller.isArabic ? platform.nameAr : platform.nameEn,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Text(
                            controller.isArabic ? platform.descriptionAr : platform.descriptionEn,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
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
          controller.isArabic ? 'اختر التقنية' : 'Choose Technology',
          style: Theme.of(Get.context!).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: technologies.map((tech) {
            return Obx(() => Tooltip(
              message: controller.isArabic ? '${tech.nameAr} - ${tech.basePrice > 0 ? '+${tech.basePrice.toStringAsFixed(0)}\$' : 'مجاني'}' : '${tech.nameEn} - ${tech.basePrice > 0 ? '+${tech.basePrice.toStringAsFixed(0)}\$' : 'Free'}',
              child: ChoiceChip(
                label: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(controller.isArabic ? tech.nameAr : tech.nameEn, style: TextStyle(fontWeight: FontWeight.w500)),
                    if (tech.basePrice > 0)
                      Text('+${tech.basePrice.toStringAsFixed(0)}\$', style: TextStyle(fontSize: 12, color: Colors.green)),
                  ],
                ),
                selected: controller.selectedTechnology.value == tech.id,
                onSelected: (selected) {
                  controller.selectTechnology(selected ? tech.id : null);
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
          controller.isArabic ? 'عدد الشاشات' : 'Number of Screens',
          style: Theme.of(Get.context!).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),

        Text(
          controller.isArabic ? 'حدد عدد الشاشات المطلوبة في التطبيق' : 'Specify the number of screens needed in your application',
          style: Theme.of(Get.context!).textTheme.bodyMedium,
        ),
        SizedBox(height: 24),

        // Number of screens slider
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.secondaryBackground(Get.context!),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.accentColor.withValues(alpha: 0.3)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.isArabic ? 'عدد الشاشات:' : 'Number of Screens:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Obx(() => Text(
                    '${controller.numberOfScreens.value}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.accentColor,
                    ),
                  )),
                ],
              ),
              SizedBox(height: 16),
              Obx(() => Slider(
                value: controller.numberOfScreens.value.toDouble(),
                min: 1,
                max: 50,
                divisions: 49,
                onChanged: (value) {
                  controller.setNumberOfScreens(value.toInt());
                },
                activeColor: AppColors.accentColor,
                inactiveColor: AppColors.accentColor.withValues(alpha: 0.2),
              )),
              SizedBox(height: 8),
              Obx(() => Text(
                controller.numberOfScreens.value <= 2
                  ? (controller.isArabic ? 'الشاشات الأولى مجانية' : 'First 2 screens are free')
                  : controller.isArabic
                    ? 'التكلفة: ${controller.numberOfScreens.value - 2} × 30\$ = ${((controller.numberOfScreens.value - 2) * 30).toStringAsFixed(0)}\$'
                    : 'Cost: ${controller.numberOfScreens.value - 2} × \$30 = \$${((controller.numberOfScreens.value - 2) * 30).toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 14,
                  color: controller.numberOfScreens.value <= 2 ? Colors.blue : Colors.green,
                  fontWeight: FontWeight.w500,
                ),
              )),
            ],
          ),
        ),

        SizedBox(height: 24),

        // Examples
        Text(
          controller.isArabic ? 'أمثلة على الشاشات:' : 'Screen Examples:',
          style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildScreenExample(controller.isArabic ? 'شاشة تسجيل الدخول' : 'Login Screen', Icons.login),
            _buildScreenExample(controller.isArabic ? 'الصفحة الرئيسية' : 'Home/Dashboard', Icons.home),
            _buildScreenExample(controller.isArabic ? 'الملف الشخصي' : 'Profile', Icons.person),
            _buildScreenExample(controller.isArabic ? 'الإعدادات' : 'Settings', Icons.settings),
            _buildScreenExample(controller.isArabic ? 'قائمة المنتجات' : 'Product List', Icons.list),
            _buildScreenExample(controller.isArabic ? 'تفاصيل المنتج' : 'Product Details', Icons.info),
            _buildScreenExample(controller.isArabic ? 'سلة التسوق' : 'Shopping Cart', Icons.shopping_cart),
            _buildScreenExample(controller.isArabic ? 'الدفع' : 'Checkout/Payment', Icons.payment),
          ],
        ),
      ],
    );
  }

  Widget _buildScreenExample(String name, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          SizedBox(width: 6),
          Text(
            name,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildStep4Content(CalculatorController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.isArabic ? 'الخادم وقاعدة البيانات' : 'Backend & Database',
          style: Theme.of(Get.context!).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),

        // Backend
        Text(controller.isArabic ? 'تقنية الخادم' : 'Backend Technology', style: Theme.of(Get.context!).textTheme.titleMedium),
        SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: backendTypes.map((backend) {
            return Obx(() => Tooltip(
              message: backend.name + (backend.id == 'firebase' ? ' (Free)' : ' (+200\$)'),
              child: ChoiceChip(
                label: Text(backend.name, style: TextStyle(fontWeight: FontWeight.w500)),
                selected: controller.selectedBackend.value == backend.id,
                onSelected: (selected) {
                  controller.selectBackend(selected ? backend.id : null);
                },
                selectedColor: AppColors.accentColor.withValues(alpha: 0.2),
              ),
            ));
          }).toList(),
        ),

        SizedBox(height: 24),

        // Database
        Text(controller.isArabic ? 'نظام قاعدة البيانات' : 'Database System', style: Theme.of(Get.context!).textTheme.titleMedium),
        SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: databaseTypes.map((db) {
            return Obx(() => Tooltip(
              message: db.name + (db.id == 'firestore' ? ' (Free)' : ' (+150\$)'),
              child: ChoiceChip(
                label: Text(db.name, style: TextStyle(fontWeight: FontWeight.w500)),
                selected: controller.selectedDatabase.value == db.id,
                onSelected: (selected) {
                  controller.selectDatabase(selected ? db.id : null);
                },
                selectedColor: AppColors.accentColor.withValues(alpha: 0.2),
              ),
            ));
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildStep5Content(CalculatorController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.isArabic ? 'اختر الباقة' : 'Choose Package',
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
            childAspectRatio: 2.2,
          ),
          itemCount: packageTiers.length,
          itemBuilder: (context, index) {
            final tier = packageTiers[index];
            return Obx(() => Tooltip(
              message: controller.isArabic ? tier.descriptionAr : tier.descriptionEn,
              child: Card(
                elevation: controller.selectedPackage.value == tier.id ? 8 : 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                color: controller.selectedPackage.value == tier.id ? tier.color.withValues(alpha: 0.1) : null,
                child: InkWell(
                  onTap: () {
                    controller.selectPackage(controller.selectedPackage.value == tier.id ? null : tier.id);
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
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Radio<String>(
                              value: tier.id,
                              groupValue: controller.selectedPackage.value,
                              onChanged: (String? value) {
                                controller.selectPackage(value);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text(
                          controller.isArabic ? tier.descriptionAr : tier.descriptionEn,
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 16),
                        // Included services
                        if (tier.includesHosting || tier.includesDomain || tier.includesSSL || tier.includesMaintenance)
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: tier.color.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.isArabic ? 'مشمل:' : 'Includes:',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                                Wrap(
                                  spacing: 8,
                                  children: [
                                    if (tier.includesHosting) _buildIncludedChip(controller.isArabic ? 'استضافة' : 'Hosting', tier.color),
                                    if (tier.includesDomain) _buildIncludedChip(controller.isArabic ? 'نطاق' : 'Domain', tier.color),
                                    if (tier.includesSSL) _buildIncludedChip('SSL', tier.color),
                                    if (tier.includesMaintenance) _buildIncludedChip(controller.isArabic ? 'صيانة' : 'Maintenance', tier.color),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        SizedBox(height: 8),
                        Expanded(
                          child: ListView.builder(
                            itemCount: tier.featuresEn.length,
                            itemBuilder: (context, idx) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Row(
                                children: [
                                  Icon(Icons.check_circle, size: 16, color: tier.color),
                                  SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      controller.isArabic ? tier.featuresAr[idx] : tier.featuresEn[idx],
                                      style: Theme.of(context).textTheme.bodySmall,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
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

  Widget _buildIncludedChip(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildStep6Content(CalculatorController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.isArabic ? 'الخدمات الإضافية' : 'Additional Services',
          style: Theme.of(Get.context!).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Text(
          controller.isArabic ? 'اختر الخدمات الإضافية التي تحتاجها:' : 'Select additional services you need:',
          style: Theme.of(Get.context!).textTheme.bodyMedium,
        ),
        SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(Get.context!).size.width > 800 ? 2 : 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 2.5,
          ),
          itemCount: additionalServices.length,
          itemBuilder: (context, index) {
            final service = additionalServices[index];
            return Obx(() => Card(
              elevation: controller.selectedAdditionalServices.contains(service.id) ? 8 : 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: controller.selectedAdditionalServices.contains(service.id) ? service.color.withValues(alpha: 0.1) : null,
              child: InkWell(
                onTap: () {
                  controller.toggleAdditionalService(service.id);
                },
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(service.icon, size: 32, color: service.color),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.isArabic ? service.nameAr : service.nameEn,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            Text(
                              controller.isArabic ? service.descriptionAr : service.descriptionEn,
                              style: Theme.of(context).textTheme.bodySmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '+${service.price.toStringAsFixed(0)}\$',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: service.color,
                            ),
                          ),
                          Checkbox(
                            value: controller.selectedAdditionalServices.contains(service.id),
                            onChanged: (value) {
                              controller.toggleAdditionalService(service.id);
                            },
                            activeColor: service.color,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
          },
        ),
      ],
    );
  }

  Widget _buildStep7Content(CalculatorController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.isArabic ? 'ملخص المشروع' : 'Project Summary',
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
                controller.isArabic ? 'ملخص المشروع' : 'Project Summary',
                style: Theme.of(Get.context!).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              if (controller.selectedPlatformData != null)
                _buildSummaryItem(controller.isArabic ? 'المنصة' : 'Platform', controller.isArabic ? controller.selectedPlatformData!.nameAr : controller.selectedPlatformData!.nameEn),
              if (controller.selectedTechnologyData != null)
                _buildSummaryItem(controller.isArabic ? 'التقنية' : 'Technology', controller.selectedTechnologyData!.nameEn),
              _buildSummaryItem(controller.isArabic ? 'عدد الشاشات' : 'Number of Screens', controller.numberOfScreens.value.toString()),
              if (controller.selectedBackendData != null)
                _buildSummaryItem(controller.isArabic ? 'الخادم' : 'Backend', controller.selectedBackendData!.name),
              if (controller.selectedDatabaseData != null)
                _buildSummaryItem(controller.isArabic ? 'قاعدة البيانات' : 'Database', controller.selectedDatabaseData!.name),
              if (controller.selectedPackageData != null)
                _buildSummaryItem(controller.isArabic ? 'الباقة' : 'Package', controller.isArabic ? controller.selectedPackageData!.nameAr : controller.selectedPackageData!.nameEn),
              if (controller.selectedAdditionalServicesData.isNotEmpty)
                _buildSummaryItem(controller.isArabic ? 'الخدمات الإضافية' : 'Additional Services', controller.selectedAdditionalServicesData.map((s) => controller.isArabic ? s.nameAr : s.nameEn).join(', ')),
              SizedBox(height: 24),
              // Price breakdown
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      controller.isArabic ? 'تفصيل السعر' : 'Price Breakdown',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    _buildPriceItem(controller.isArabic ? 'السعر الأساسي (شامل شاشتين)' : 'Base Price (includes 2 screens)', 200.0),
                    if (controller.selectedTechnologyData != null && controller.selectedTechnologyData!.basePrice > 0)
                      _buildPriceItem(controller.isArabic ? 'تقنية ${controller.selectedTechnologyData!.nameEn}' : '${controller.selectedTechnologyData!.nameEn} Technology', controller.selectedTechnologyData!.basePrice),
                    if (controller.numberOfScreens.value > 2)
                      _buildPriceItem(controller.isArabic ? 'شاشات إضافية (${controller.numberOfScreens.value - 2})' : 'Additional Screens (${controller.numberOfScreens.value - 2})', (controller.numberOfScreens.value - 2) * 30.0),
                    if (controller.selectedBackendData != null)
                      _buildPriceItem(controller.isArabic ? 'خادم ${controller.selectedBackendData!.name}' : '${controller.selectedBackendData!.name} Backend', 200.0),
                    if (controller.selectedDatabaseData != null)
                      _buildPriceItem(controller.isArabic ? 'قاعدة بيانات ${controller.selectedDatabaseData!.name}' : '${controller.selectedDatabaseData!.name} Database', 150.0),
                    if (controller.selectedAdditionalServicesData.isNotEmpty)
                      _buildPriceItem(controller.isArabic ? 'خدمات إضافية' : 'Additional Services', controller.selectedAdditionalServicesData.fold(0.0, (sum, s) => sum + s.price)),
                    Divider(),
                    _buildPriceItem(controller.isArabic ? 'المجموع الفرعي' : 'Subtotal', controller.subtotalPrice, isBold: true),
                    if (controller.selectedPackageData != null)
                      _buildPriceItem(controller.isArabic ? 'مضاعف الباقة (${controller.selectedPackageData!.multiplier}x)' : 'Package Multiplier (${controller.selectedPackageData!.multiplier}x)', controller.subtotalPrice * (controller.selectedPackageData!.multiplier - 1), isBold: true),
                  ],
                ),
              ),
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
                        controller.isArabic ? 'السعر الإجمالي' : 'Total Price',
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
                        overflow: TextOverflow.ellipsis,
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

  Widget _buildPriceItem(String label, double amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            '\$${amount.toStringAsFixed(0)}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
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
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
