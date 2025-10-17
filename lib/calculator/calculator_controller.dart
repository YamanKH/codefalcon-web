import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
    if (selectedPlatform.value == 'mobile') {
      basePrice = 300.0;
    } else if (selectedPlatform.value == 'both') {
      basePrice = 500.0;
    }

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
    if (selectedPlatform.value == 'mobile') {
      basePrice = 300.0;
    } else if (selectedPlatform.value == 'both') {
      basePrice = 500.0;
    }

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
  bool canProceedToNextStep() {
    switch (currentStep.value) {
      case 0:
        return selectedPlatform.value != null;
      case 1:
        return selectedTechnology.value != null;
      case 2:
        return true; // Number of screens is always valid (has default value)
      case 3:
        return selectedBackend.value != null && selectedDatabase.value != null;
      case 4:
        return selectedPackage.value != null;
      case 5:
        return true; // Additional services are optional
      case 6:
        return true; // Summary step
      default:
        return false;
    }
  }

  void nextStep() {
    if (currentStep.value < 6 && canProceedToNextStep()) {
      currentStep.value++;
      update();
    } else if (!canProceedToNextStep()) {
      Get.snackbar(
        isArabic ? 'مطلوب' : 'Required',
        isArabic ? 'يرجى إكمال الخطوة الحالية' : 'Please complete the current step',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
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
    String message = isArabic
      ? 'مرحباً! أود طلب عرض سعر لمشروعي.\n\n'
      : 'Hello! I would like to request a quote for my project.\n\n';

    if (selectedPlatformData != null) {
      message += isArabic
        ? 'المنصة: ${selectedPlatformData!.nameAr}\n'
        : 'Platform: ${selectedPlatformData!.nameEn}\n';
    }
    if (selectedTechnologyData != null) {
      message += isArabic
        ? 'التقنية: ${selectedTechnologyData!.nameAr}\n'
        : 'Technology: ${selectedTechnologyData!.nameEn}\n';
    }
    message += isArabic
      ? 'عدد الشاشات: ${numberOfScreens.value}\n'
      : 'Number of Screens: ${numberOfScreens.value}\n';
    if (selectedBackendData != null) {
      message += isArabic
        ? 'الخادم: ${selectedBackendData!.name}\n'
        : 'Backend: ${selectedBackendData!.name}\n';
    }
    if (selectedDatabaseData != null) {
      message += isArabic
        ? 'قاعدة البيانات: ${selectedDatabaseData!.name}\n'
        : 'Database: ${selectedDatabaseData!.name}\n';
    }
    if (selectedPackageData != null) {
      message += isArabic
        ? 'الباقة: ${selectedPackageData!.nameAr}\n'
        : 'Package: ${selectedPackageData!.nameEn}\n';
    }
    if (selectedAdditionalServicesData.isNotEmpty) {
      message += isArabic
        ? 'الخدمات الإضافية: ${selectedAdditionalServicesData.map((s) => s.nameAr).join(', ')}\n'
        : 'Additional Services: ${selectedAdditionalServicesData.map((s) => s.nameEn).join(', ')}\n';
    }
    message += isArabic
      ? 'المجموع الفرعي: ${subtotalPrice.toStringAsFixed(0)}\$\n'
      : 'Subtotal: \$${subtotalPrice.toStringAsFixed(0)}\n';
    message += isArabic
      ? 'السعر الإجمالي: ${totalPrice.toStringAsFixed(0)}\$\n\n'
      : 'Total Price: \$${totalPrice.toStringAsFixed(0)}\n\n';
    message += isArabic
      ? 'يرجى التواصل معي للمزيد من التفاصيل.'
      : 'Please contact me for more details.';

    String phone = '+963982286463';
    Uri whatsappUrl = Uri.parse('https://wa.me/$phone?text=${Uri.encodeComponent(message)}');

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar(
        isArabic ? 'خطأ' : 'Error',
        isArabic ? 'غير قادر على فتح واتساب' : 'Unable to open WhatsApp',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void showConsultingComingSoon() {
    Get.snackbar(
      isArabic ? 'معلومات' : 'Info',
      isArabic ? 'حجز الاستشارات قريباً' : 'Consulting booking coming soon',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }

  void showWhatsAppContact() async {
    final Uri whatsappUrl = Uri.parse('https://wa.me/+963982286463');
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar(
        isArabic ? 'خطأ' : 'Error',
        isArabic ? 'واتساب غير متوفر' : 'WhatsApp not available',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void showPreMadeProjectsComingSoon() {
    Get.snackbar(
      isArabic ? 'معلومات' : 'Info',
      isArabic ? 'المشاريع الجاهزة قريباً' : 'Pre-made projects coming soon',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
    );
  }
}