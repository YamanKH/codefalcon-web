import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:code_falcon/app/modules/home/locale_controller.dart';

class ProjectCategory {
  final String id;
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final IconData icon;

  ProjectCategory({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.icon,
  });
}

class TechStack {
  final String id;
  final String name;
  final String type; // 'frontend', 'backend', 'database'

  TechStack({
    required this.id,
    required this.name,
    required this.type,
  });
}

class PackageTier {
  final String id;
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final double basePrice;
  final List<String> featuresEn;
  final List<String> featuresAr;
  final Color color;

  PackageTier({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.basePrice,
    required this.featuresEn,
    required this.featuresAr,
    required this.color,
  });
}

final List<ProjectCategory> projectCategories = [
  ProjectCategory(
    id: 'real_estate',
    nameEn: 'Real Estate App',
    nameAr: 'تطبيق العقارات',
    descriptionEn: 'Property listings, search, and management system',
    descriptionAr: 'قوائم العقارات والبحث ونظام الإدارة',
    icon: Icons.home,
  ),
  ProjectCategory(
    id: 'ecommerce',
    nameEn: 'E-commerce App',
    nameAr: 'تطبيق التجارة الإلكترونية',
    descriptionEn: 'Online store with payment integration',
    descriptionAr: 'متجر إلكتروني مع دمج الدفع',
    icon: Icons.shopping_cart,
  ),
  ProjectCategory(
    id: 'restaurant',
    nameEn: 'Restaurant App',
    nameAr: 'تطبيق المطاعم',
    descriptionEn: 'Food ordering and delivery management',
    descriptionAr: 'طلب الطعام وإدارة التوصيل',
    icon: Icons.restaurant,
  ),
  ProjectCategory(
    id: 'healthcare',
    nameEn: 'Healthcare App',
    nameAr: 'تطبيق الرعاية الصحية',
    descriptionEn: 'Medical records and appointment booking',
    descriptionAr: 'السجلات الطبية وحجز المواعيد',
    icon: Icons.local_hospital,
  ),
  ProjectCategory(
    id: 'education',
    nameEn: 'Education Platform',
    nameAr: 'منصة التعليم',
    descriptionEn: 'Learning management and course delivery',
    descriptionAr: 'إدارة التعلم وتوصيل الدورات',
    icon: Icons.school,
  ),
  ProjectCategory(
    id: 'other',
    nameEn: 'Other/Custom App',
    nameAr: 'تطبيق آخر/مخصص',
    descriptionEn: 'Custom application for your specific needs',
    descriptionAr: 'تطبيق مخصص لاحتياجاتك الخاصة',
    icon: Icons.apps,
  ),
];

final List<TechStack> techStacks = [
  // Frontend
  TechStack(id: 'flutter', name: 'Flutter', type: 'frontend'),
  TechStack(id: 'react', name: 'React', type: 'frontend'),
  TechStack(id: 'vue', name: 'Vue.js', type: 'frontend'),
  TechStack(id: 'angular', name: 'Angular', type: 'frontend'),

  // Backend
  TechStack(id: 'nodejs', name: 'Node.js', type: 'backend'),
  TechStack(id: 'firebase', name: 'Firebase', type: 'backend'),
  TechStack(id: 'supabase', name: 'Supabase', type: 'backend'),
  TechStack(id: 'python', name: 'Python', type: 'backend'),
  TechStack(id: 'django', name: 'Django', type: 'backend'),
  TechStack(id: 'php', name: 'PHP', type: 'backend'),
  TechStack(id: 'laravel', name: 'Laravel', type: 'backend'),

  // Database
  TechStack(id: 'firebase_db', name: 'Firebase', type: 'database'),
  TechStack(id: 'supabase_db', name: 'Supabase', type: 'database'),
  TechStack(id: 'mongodb', name: 'MongoDB', type: 'database'),
  TechStack(id: 'mysql', name: 'MySQL', type: 'database'),
  TechStack(id: 'postgresql', name: 'PostgreSQL', type: 'database'),
];

final List<PackageTier> packageTiers = [
  PackageTier(
    id: 'basic',
    nameEn: 'Starter Package',
    nameAr: 'باقة البداية',
    descriptionEn: 'Perfect for small businesses and startups',
    descriptionAr: 'مثالي للشركات الصغيرة والشركات الناشئة',
    basePrice: 800.0,
    featuresEn: [
      'Modern UI/UX Design',
      'User Authentication',
      'Basic Database Setup',
      'Mobile Responsive',
      'Email Notifications',
      'Basic Testing',
      '1 Month Support',
      'Source Code Delivery'
    ],
    featuresAr: [
      'تصميم واجهة حديث',
      'مصادقة المستخدم',
      'إعداد قاعدة بيانات أساسية',
      'متجاوب مع الموبايل',
      'إشعارات البريد الإلكتروني',
      'اختبار أساسي',
      'دعم لمدة شهر',
      'تسليم الكود المصدري'
    ],
    color: Colors.blue,
  ),
  PackageTier(
    id: 'professional',
    nameEn: 'Professional Package',
    nameAr: 'الباقة المهنية',
    descriptionEn: 'Advanced features for growing businesses',
    descriptionAr: 'ميزات متقدمة للشركات المتنامية',
    basePrice: 1500.0,
    featuresEn: [
      'Premium UI/UX Design',
      'Advanced Authentication',
      'Complex Database Design',
      'Push Notifications',
      'SMS Integration',
      'Social Media Login',
      'Payment Gateway',
      'Admin Dashboard',
      'API Development',
      'Performance Optimization',
      '3 Months Support',
      'Deployment Setup'
    ],
    featuresAr: [
      'تصميم واجهة مميز',
      'مصادقة متقدمة',
      'تصميم قاعدة بيانات معقدة',
      'إشعارات الدفع',
      'تكامل الرسائل النصية',
      'تسجيل الدخول عبر وسائل التواصل',
      'بوابة الدفع',
      'لوحة تحكم الإدارة',
      'تطوير واجهات برمجة التطبيقات',
      'تحسين الأداء',
      'دعم لمدة 3 أشهر',
      'إعداد النشر'
    ],
    color: Colors.green,
  ),
  PackageTier(
    id: 'enterprise',
    nameEn: 'Enterprise Package',
    nameAr: 'الباقة المؤسسية',
    descriptionEn: 'Complete solution with advanced integrations',
    descriptionAr: 'حل كامل مع تكاملات متقدمة',
    basePrice: 2500.0,
    featuresEn: [
      'Custom Enterprise Design',
      'Multi-role Authentication',
      'Advanced Database Architecture',
      'Real-time Notifications',
      'SMS & Email Campaigns',
      'Multi-platform Social Login',
      'Advanced Payment Systems',
      'Analytics Dashboard',
      'RESTful APIs & Webhooks',
      'Advanced Security',
      'Cloud Deployment',
      '6 Months Support',
      'Training Sessions',
      'Maintenance Package'
    ],
    featuresAr: [
      'تصميم مؤسسي مخصص',
      'مصادقة متعددة الأدوار',
      'هيكل قاعدة بيانات متقدم',
      'إشعارات في الوقت الفعلي',
      'حملات الرسائل النصية والبريد الإلكتروني',
      'تسجيل دخول متعدد المنصات',
      'أنظمة دفع متقدمة',
      'لوحة تحليلات البيانات',
      'واجهات برمجة التطبيقات وخطافات الويب',
      'أمان متقدم',
      'نشر سحابي',
      'دعم لمدة 6 أشهر',
      'جلسات تدريبية',
      'باقة الصيانة'
    ],
    color: Colors.purple,
  ),
  PackageTier(
    id: 'custom',
    nameEn: 'Custom Solution',
    nameAr: 'حل مخصص',
    descriptionEn: 'Tailored development for unique requirements',
    descriptionAr: 'تطوير مخصص للمتطلبات الفريدة',
    basePrice: 3000.0,
    featuresEn: [
      'Fully Custom Development',
      'Unique UI/UX Design',
      'Custom Architecture',
      'Advanced Integrations',
      'Third-party API Integration',
      'Custom Features Development',
      'Scalability Planning',
      'Security Audit',
      'Performance Monitoring',
      '12 Months Support',
      'On-site Training',
      'Maintenance & Updates'
    ],
    featuresAr: [
      'تطوير مخصص بالكامل',
      'تصميم واجهة فريد',
      'هيكل مخصص',
      'تكاملات متقدمة',
      'تكامل واجهات برمجة التطبيقات الخارجية',
      'تطوير ميزات مخصصة',
      'تخطيط قابلية التوسع',
      'تدقيق الأمان',
      'مراقبة الأداء',
      'دعم لمدة 12 شهر',
      'تدريب في الموقع',
      'الصيانة والتحديثات'
    ],
    color: Colors.orange,
  ),
];

class CalculatorController extends GetxController {
  // Step management
  var currentStep = 0.obs;

  // Selection variables
  var selectedCategory = RxnString();
  var selectedFrontend = RxnString();
  var selectedBackend = RxnString();
  var selectedDatabase = RxnString();
  var selectedTier = RxnString();

  // GetX controllers
  final localeController = Get.find<LocaleController>();

  // Getters
  bool get isArabic => localeController.isArabic;

  double get totalPrice {
    if (selectedTier.value == null) return 0.0;

    final tier = packageTiers.firstWhere((t) => t.id == selectedTier.value);
    double price = tier.basePrice;

    // Add premium for custom tech stack combinations
    if (selectedFrontend.value != null && selectedBackend.value != null && selectedDatabase.value != null) {
      // If user selects different from default combinations, add premium
      if (!(selectedFrontend.value == 'flutter' && (selectedBackend.value == 'firebase' || selectedBackend.value == 'supabase'))) {
        price += 200; // Premium for custom stack
      }
    }

    return price;
  }

  // Helper methods for UI
  ProjectCategory? get selectedCategoryData {
    if (selectedCategory.value == null) return null;
    return projectCategories.firstWhere((c) => c.id == selectedCategory.value);
  }

  TechStack? get selectedFrontendData {
    if (selectedFrontend.value == null) return null;
    return techStacks.firstWhere((t) => t.id == selectedFrontend.value);
  }

  TechStack? get selectedBackendData {
    if (selectedBackend.value == null) return null;
    return techStacks.firstWhere((t) => t.id == selectedBackend.value);
  }

  TechStack? get selectedDatabaseData {
    if (selectedDatabase.value == null) return null;
    return techStacks.firstWhere((t) => t.id == selectedDatabase.value);
  }

  PackageTier? get selectedTierData {
    if (selectedTier.value == null) return null;
    return packageTiers.firstWhere((t) => t.id == selectedTier.value);
  }

  // Methods
  void nextStep() {
    if (currentStep.value < 3) {
      currentStep.value++;
      update();
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
      update();
    }
  }

  void selectCategory(String? categoryId) {
    selectedCategory.value = categoryId;
  }

  void selectFrontend(String? frontendId) {
    selectedFrontend.value = frontendId;
  }

  void selectBackend(String? backendId) {
    selectedBackend.value = backendId;
  }

  void selectDatabase(String? databaseId) {
    selectedDatabase.value = databaseId;
  }

  void selectTier(String? tierId) {
    selectedTier.value = tierId;
  }

  void showQuoteSubmitted() async {
    String message = 'Hello! I would like to request a quote for my project.\n\n';

    if (selectedCategoryData != null) {
      message += 'Project Type: ${selectedCategoryData!.nameEn}\n';
    }
    if (selectedFrontendData != null) {
      message += 'Frontend: ${selectedFrontendData!.name}\n';
    }
    if (selectedBackendData != null) {
      message += 'Backend: ${selectedBackendData!.name}\n';
    }
    if (selectedDatabaseData != null) {
      message += 'Database: ${selectedDatabaseData!.name}\n';
    }
    if (selectedTierData != null) {
      message += 'Package: ${selectedTierData!.nameEn}\n';
    }
    message += 'Total Price: \$${totalPrice.toStringAsFixed(0)}\n\n';
    message += 'Please contact me for more details.';

    String phone = '00963982286463';
    Uri whatsappUrl;

    if (kIsWeb) {
      // For web, use wa.me
      whatsappUrl = Uri.parse('https://wa.me/$phone?text=${Uri.encodeComponent(message)}');
    } else if (Platform.isAndroid || Platform.isIOS) {
      // For mobile, use whatsapp://
      whatsappUrl = Uri.parse('whatsapp://send?phone=$phone&text=${Uri.encodeComponent(message)}');
    } else {
      // Fallback
      whatsappUrl = Uri.parse('https://wa.me/$phone?text=${Uri.encodeComponent(message)}');
    }

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar(
        'error'.tr,
        'unable_to_open_whatsapp'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void showConsultingComingSoon() {
    Get.snackbar(
      'info'.tr,
      'consulting_booking_coming_soon'.tr,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }

  void showWhatsAppContact() async {
    final Uri whatsappUrl = Uri.parse('whatsapp://send?phone=00963982286463');
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl);
    } else {
      Get.snackbar(
        'error'.tr,
        'whatsapp_not_installed'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void showPreMadeProjectsComingSoon() {
    Get.snackbar(
      'info'.tr,
      'premade_projects_coming_soon'.tr,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
    );
  }
}