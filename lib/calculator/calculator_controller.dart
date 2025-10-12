import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:code_falcon/app/modules/home/locale_controller.dart';

class Platform {
  final String id;
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final IconData icon;

  Platform({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.icon,
  });
}

class Technology {
  final String id;
  final String nameEn;
  final String nameAr;
  final IconData icon;
  final double basePrice;

  Technology({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.icon,
    required this.basePrice,
  });

  String get name => nameEn; // For backward compatibility
}

class Feature {
  final String id;
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final double basePrice;

  Feature({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.basePrice,
  });
}

class BackendType {
  final String id;
  final String name;
  final IconData icon;

  BackendType({
    required this.id,
    required this.name,
    required this.icon,
  });
}

class DatabaseType {
  final String id;
  final String name;
  final IconData icon;

  DatabaseType({
    required this.id,
    required this.name,
    required this.icon,
  });
}

class AdditionalService {
  final String id;
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final double price;
  final IconData icon;
  final Color color;

  AdditionalService({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.price,
    required this.icon,
    required this.color,
  });
}

class PackageTier {
  final String id;
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final double multiplier; // Multiplier for base price
  final List<String> featuresEn;
  final List<String> featuresAr;
  final Color color;
  final bool includesHosting;
  final bool includesDomain;
  final bool includesSSL;
  final bool includesMaintenance;

  PackageTier({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.multiplier,
    required this.featuresEn,
    required this.featuresAr,
    required this.color,
    required this.includesHosting,
    required this.includesDomain,
    required this.includesSSL,
    required this.includesMaintenance,
  });
}

final List<Platform> platforms = [
  Platform(
    id: 'website',
    nameEn: 'Website',
    nameAr: 'موقع إلكتروني',
    descriptionEn: 'Responsive web application',
    descriptionAr: 'تطبيق ويب متجاوب',
    icon: Icons.web,
  ),
  Platform(
    id: 'mobile',
    nameEn: 'Mobile App',
    nameAr: 'تطبيق موبايل',
    descriptionEn: 'Native mobile application',
    descriptionAr: 'تطبيق موبايل أصلي',
    icon: Icons.phone_android,
  ),
  Platform(
    id: 'both',
    nameEn: 'Website + Mobile',
    nameAr: 'موقع + موبايل',
    descriptionEn: 'Web and mobile application',
    descriptionAr: 'تطبيق ويب وموبايل',
    icon: Icons.devices,
  ),
];

final List<Technology> technologies = [
  Technology(
    id: 'flutter',
    nameEn: 'Flutter',
    nameAr: 'فلاتر',
    icon: Icons.flutter_dash,
    basePrice: 0.0, // Base price included
  ),
  Technology(
    id: 'react',
    nameEn: 'React',
    nameAr: 'ريأكت',
    icon: Icons.code,
    basePrice: 200.0, // Premium for React
  ),
];

final List<Feature> features = [
  Feature(
    id: 'login',
    nameEn: 'Login Screen',
    nameAr: 'شاشة تسجيل الدخول',
    descriptionEn: 'User authentication screen',
    descriptionAr: 'شاشة مصادقة المستخدم',
    basePrice: 100,
  ),
  Feature(
    id: 'signup',
    nameEn: 'Sign Up Screen',
    nameAr: 'شاشة التسجيل',
    descriptionEn: 'User registration screen',
    descriptionAr: 'شاشة تسجيل المستخدم',
    basePrice: 100,
  ),
  Feature(
    id: 'profile',
    nameEn: 'User Profile',
    nameAr: 'الملف الشخصي',
    descriptionEn: 'User profile management',
    descriptionAr: 'إدارة الملف الشخصي',
    basePrice: 150,
  ),
  Feature(
    id: 'dashboard',
    nameEn: 'Dashboard',
    nameAr: 'لوحة التحكم',
    descriptionEn: 'Main dashboard screen',
    descriptionAr: 'شاشة لوحة التحكم الرئيسية',
    basePrice: 200,
  ),
  Feature(
    id: 'settings',
    nameEn: 'Settings',
    nameAr: 'الإعدادات',
    descriptionEn: 'App settings screen',
    descriptionAr: 'شاشة إعدادات التطبيق',
    basePrice: 100,
  ),
  Feature(
    id: 'notifications',
    nameEn: 'Notifications',
    nameAr: 'الإشعارات',
    descriptionEn: 'Push notifications system',
    descriptionAr: 'نظام الإشعارات الدفعية',
    basePrice: 200,
  ),
];

final List<BackendType> backendTypes = [
  BackendType(id: 'firebase', name: 'Firebase', icon: Icons.cloud),
  BackendType(id: 'nodejs', name: 'Node.js', icon: Icons.code),
  BackendType(id: 'python', name: 'Python', icon: Icons.code),
];

final List<DatabaseType> databaseTypes = [
  DatabaseType(id: 'firestore', name: 'Firestore', icon: Icons.storage),
  DatabaseType(id: 'mongodb', name: 'MongoDB', icon: Icons.storage),
  DatabaseType(id: 'mysql', name: 'MySQL', icon: Icons.storage),
  DatabaseType(id: 'postgresql', name: 'PostgreSQL', icon: Icons.storage),
];

final List<AdditionalService> additionalServices = [
  AdditionalService(
    id: 'brand_identity',
    nameEn: 'Brand Identity Design',
    nameAr: 'تصميم الهوية البصرية',
    descriptionEn: 'Logo, color scheme, typography, and brand guidelines',
    descriptionAr: 'شعار، نظام ألوان، خطوط، وإرشادات العلامة التجارية',
    price: 150.0,
    icon: Icons.palette,
    color: Colors.purple,
  ),
  AdditionalService(
    id: 'team_structure',
    nameEn: 'Team Structure Planning',
    nameAr: 'تخطيط هيكل الفريق',
    descriptionEn: 'Project management and team organization setup',
    descriptionAr: 'إدارة المشروع وإعداد تنظيم الفريق',
    price: 100.0,
    icon: Icons.group,
    color: Colors.blue,
  ),
  AdditionalService(
    id: 'seo_optimization',
    nameEn: 'SEO Optimization',
    nameAr: 'تحسين محركات البحث',
    descriptionEn: 'Search engine optimization for better visibility',
    descriptionAr: 'تحسين محركات البحث لزيادة الظهور',
    price: 120.0,
    icon: Icons.search,
    color: Colors.green,
  ),
  AdditionalService(
    id: 'analytics_setup',
    nameEn: 'Analytics Setup',
    nameAr: 'إعداد التحليلات',
    descriptionEn: 'Google Analytics and performance monitoring',
    descriptionAr: 'تحليلات جوجل ومراقبة الأداء',
    price: 80.0,
    icon: Icons.analytics,
    color: Colors.orange,
  ),
  AdditionalService(
    id: 'maintenance_plan',
    nameEn: 'Maintenance Plan',
    nameAr: 'خطة الصيانة',
    descriptionEn: '6 months of ongoing maintenance and updates',
    descriptionAr: '6 أشهر من الصيانة المستمرة والتحديثات',
    price: 200.0,
    icon: Icons.build,
    color: Colors.red,
  ),
];

final List<PackageTier> packageTiers = [
  PackageTier(
    id: 'basic',
    nameEn: 'Basic Package',
    nameAr: 'الباقة الأساسية',
    descriptionEn: 'Essential features for simple applications',
    descriptionAr: 'الميزات الأساسية للتطبيقات البسيطة',
    multiplier: 1.0,
    featuresEn: [
      'Basic UI Design',
      'User Authentication',
      'Simple Database',
      'Responsive Design',
      'Basic Testing',
      '1 Month Support',
      'Shared Hosting',
      'Basic SSL Certificate'
    ],
    featuresAr: [
      'تصميم واجهة أساسي',
      'مصادقة المستخدم',
      'قاعدة بيانات بسيطة',
      'تصميم متجاوب',
      'اختبار أساسي',
      'دعم لمدة شهر',
      'استضافة مشتركة',
      'شهادة SSL أساسية'
    ],
    color: Colors.blue,
    includesHosting: true,
    includesDomain: true,
    includesSSL: true,
    includesMaintenance: false,
  ),
  PackageTier(
    id: 'medium',
    nameEn: 'Medium Package',
    nameAr: 'الباقة المتوسطة',
    descriptionEn: 'Advanced features for growing applications',
    descriptionAr: 'ميزات متقدمة للتطبيقات المتنامية',
    multiplier: 1.5,
    featuresEn: [
      'Modern UI/UX Design',
      'Advanced Authentication',
      'Complex Database',
      'Push Notifications',
      'API Integration',
      'Admin Panel',
      'Performance Optimization',
      '3 Months Support',
      'VPS Hosting',
      'Domain Registration',
      'SSL Certificate',
      'Monthly Backups'
    ],
    featuresAr: [
      'تصميم واجهة حديث',
      'مصادقة متقدمة',
      'قاعدة بيانات معقدة',
      'إشعارات الدفع',
      'تكامل واجهات برمجة التطبيقات',
      'لوحة الإدارة',
      'تحسين الأداء',
      'دعم لمدة 3 أشهر',
      'استضافة VPS',
      'تسجيل النطاق',
      'شهادة SSL',
      'نسخ احتياطي شهري'
    ],
    color: Colors.green,
    includesHosting: true,
    includesDomain: true,
    includesSSL: true,
    includesMaintenance: false,
  ),
  PackageTier(
    id: 'advanced',
    nameEn: 'Advanced Package',
    nameAr: 'الباقة المتقدمة',
    descriptionEn: 'Complete solution with premium features',
    descriptionAr: 'حل كامل مع ميزات مميزة',
    multiplier: 2.0,
    featuresEn: [
      'Premium UI/UX Design',
      'Multi-role Authentication',
      'Advanced Database Architecture',
      'Real-time Features',
      'Third-party Integrations',
      'Analytics Dashboard',
      'Security Features',
      'Cloud Deployment',
      '6 Months Support',
      'Training Included',
      'Dedicated Hosting',
      'Domain + SSL',
      'Daily Backups',
      '24/7 Monitoring'
    ],
    featuresAr: [
      'تصميم واجهة مميز',
      'مصادقة متعددة الأدوار',
      'هيكل قاعدة بيانات متقدم',
      'ميزات في الوقت الفعلي',
      'تكاملات خارجية',
      'لوحة التحليلات',
      'ميزات الأمان',
      'نشر سحابي',
      'دعم لمدة 6 أشهر',
      'تدريب شامل',
      'استضافة مخصصة',
      'نطاق + SSL',
      'نسخ احتياطي يومي',
      'مراقبة 24/7'
    ],
    color: Colors.purple,
    includesHosting: true,
    includesDomain: true,
    includesSSL: true,
    includesMaintenance: true,
  ),
];

class CalculatorController extends GetxController {
  // Step management
  var currentStep = 0.obs;

  // Selection variables
  var selectedPlatform = RxnString();
  var selectedTechnology = RxnString();
  var selectedBackend = RxnString();
  var selectedDatabase = RxnString();
  var selectedPackage = RxnString();
  var selectedAdditionalServices = <String>[].obs;
  var numberOfScreens = 1.obs;

  // GetX controllers
  final localeController = Get.find<LocaleController>();

  // Getters
  bool get isArabic => localeController.isArabic;

  double get totalPrice {
    if (selectedPackage.value == null) return 0.0;

    final package = packageTiers.firstWhere((p) => p.id == selectedPackage.value);

    // Base price depends on platform
    double basePrice = 200.0; // Default for website
    if (selectedPlatform.value == 'mobile') basePrice = 300.0;
    else if (selectedPlatform.value == 'both') basePrice = 500.0;

    // Add technology cost
    double techCost = selectedTechnologyData?.basePrice ?? 0.0;

    // Add screens cost (each screen costs $30, first 2 are free)
    double screensCost = numberOfScreens.value > 2 ? (numberOfScreens.value - 2) * 30.0 : 0.0;

    // Add backend cost
    double backendCost = selectedBackendData != null ? 200.0 : 0.0;

    // Add database cost
    double databaseCost = selectedDatabaseData != null ? 150.0 : 0.0;

    // Add additional services cost
    double additionalServicesCost = selectedAdditionalServicesData.fold(0.0, (sum, service) => sum + service.price);

    // Calculate subtotal
    double subtotal = basePrice + techCost + screensCost + backendCost + databaseCost;

    // Apply package multiplier
    double total = subtotal * package.multiplier + additionalServicesCost;

    return total;
  }

  double get subtotalPrice {
    if (selectedPackage.value == null) return 0.0;

    // Base price depends on platform
    double basePrice = 200.0; // Default for website
    if (selectedPlatform.value == 'mobile') basePrice = 300.0;
    else if (selectedPlatform.value == 'both') basePrice = 500.0;

    double techCost = selectedTechnologyData?.basePrice ?? 0.0;
    double screensCost = numberOfScreens.value > 2 ? (numberOfScreens.value - 2) * 30.0 : 0.0;
    double backendCost = selectedBackendData != null ? 200.0 : 0.0;
    double databaseCost = selectedDatabaseData != null ? 150.0 : 0.0;

    return basePrice + techCost + screensCost + backendCost + databaseCost;
  }

  // Helper methods for UI
  Platform? get selectedPlatformData {
    if (selectedPlatform.value == null) return null;
    return platforms.firstWhere((p) => p.id == selectedPlatform.value);
  }

  Technology? get selectedTechnologyData {
    if (selectedTechnology.value == null) return null;
    return technologies.firstWhere((t) => t.id == selectedTechnology.value);
  }

  BackendType? get selectedBackendData {
    if (selectedBackend.value == null) return null;
    return backendTypes.firstWhere((b) => b.id == selectedBackend.value);
  }

  DatabaseType? get selectedDatabaseData {
    if (selectedDatabase.value == null) return null;
    return databaseTypes.firstWhere((d) => d.id == selectedDatabase.value);
  }

  PackageTier? get selectedPackageData {
    if (selectedPackage.value == null) return null;
    return packageTiers.firstWhere((p) => p.id == selectedPackage.value);
  }


  List<AdditionalService> get selectedAdditionalServicesData {
    return additionalServices.where((s) => selectedAdditionalServices.contains(s.id)).toList();
  }

  // Methods
  void nextStep() {
    if (currentStep.value < 6) {
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

  void selectPlatform(String? platformId) {
    selectedPlatform.value = platformId;
  }

  void selectTechnology(String? technologyId) {
    selectedTechnology.value = technologyId;
  }


  void selectBackend(String? backendId) {
    selectedBackend.value = backendId;
  }

  void selectDatabase(String? databaseId) {
    selectedDatabase.value = databaseId;
  }

  void selectPackage(String? packageId) {
    selectedPackage.value = packageId;
  }

  void toggleAdditionalService(String serviceId) {
    if (selectedAdditionalServices.contains(serviceId)) {
      selectedAdditionalServices.remove(serviceId);
    } else {
      selectedAdditionalServices.add(serviceId);
    }
  }

  void setNumberOfScreens(int screens) {
    numberOfScreens.value = screens.clamp(1, 50); // Min 1, max 50
  }

  void showQuoteSubmitted() async {
    String message = 'Hello! I would like to request a quote for my project.\n\n';

    if (selectedPlatformData != null) {
      message += 'Platform: ${selectedPlatformData!.nameEn}\n';
    }
    if (selectedTechnologyData != null) {
      message += 'Technology: ${selectedTechnologyData!.nameEn}\n';
    }
    message += 'Number of Screens: ${numberOfScreens.value}\n';
    if (selectedBackendData != null) {
      message += 'Backend: ${selectedBackendData!.name}\n';
    }
    if (selectedDatabaseData != null) {
      message += 'Database: ${selectedDatabaseData!.name}\n';
    }
    if (selectedPackageData != null) {
      message += 'Package: ${selectedPackageData!.nameEn}\n';
    }
    if (selectedAdditionalServicesData.isNotEmpty) {
      message += 'Additional Services: ${selectedAdditionalServicesData.map((s) => s.nameEn).join(', ')}\n';
    }
    message += 'Subtotal: \$${subtotalPrice.toStringAsFixed(0)}\n';
    message += 'Total Price: \$${totalPrice.toStringAsFixed(0)}\n\n';
    message += 'Please contact me for more details.';

    String phone = '00963982286463';
    Uri whatsappUrl = Uri.parse('https://wa.me/$phone?text=${Uri.encodeComponent(message)}');

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar(
        'Error',
        'Unable to open WhatsApp',
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
    final Uri whatsappUrl = Uri.parse('https://wa.me/00963982286463');
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar(
        'error'.tr,
        'whatsapp_not_available'.tr,
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