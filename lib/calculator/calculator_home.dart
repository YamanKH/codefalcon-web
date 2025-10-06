import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  int _currentStep = 0;
  String? _selectedCategory;
  String? _selectedFrontend;
  String? _selectedBackend;
  String? _selectedDatabase;
  String? _selectedTier;

  double get _totalPrice {
    if (_selectedTier == null) return 0.0;

    final tier = packageTiers.firstWhere((t) => t.id == _selectedTier);
    double price = tier.basePrice;

    // Add premium for custom tech stack combinations
    if (_selectedFrontend != null && _selectedBackend != null && _selectedDatabase != null) {
      // If user selects different from default combinations, add premium
      if (!(_selectedFrontend == 'flutter' && (_selectedBackend == 'firebase' || _selectedBackend == 'supabase'))) {
        price += 200; // Premium for custom stack
      }
    }

    return price;
  }

  void _nextStep() {
    if (_currentStep < 3) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  Widget _buildStep1Content() {
    final localeController = Get.find<LocaleController>();
    final isArabic = localeController.isArabic;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'choose_project_type'.tr,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemCount: projectCategories.length,
          itemBuilder: (context, index) {
            final category = projectCategories[index];
            return Card(
              elevation: _selectedCategory == category.id ? 8 : 2,
              color: _selectedCategory == category.id ? Theme.of(context).primaryColor.withValues(alpha: 0.1) : null,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedCategory = category.id;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(category.icon, size: 40, color: Theme.of(context).primaryColor),
                      SizedBox(height: 8),
                      Text(
                        isArabic ? category.nameAr : category.nameEn,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        isArabic ? category.descriptionAr : category.descriptionEn,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildStep2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'select_technologies'.tr,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),

        // Frontend
        Text('frontend_framework'.tr, style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: techStacks.where((tech) => tech.type == 'frontend').map((tech) {
            return ChoiceChip(
              label: Text(tech.name, style: TextStyle(fontWeight: FontWeight.w500)),
              selected: _selectedFrontend == tech.id,
              onSelected: (selected) {
                setState(() {
                  _selectedFrontend = selected ? tech.id : null;
                });
              },
              selectedColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
            );
          }).toList(),
        ),

        SizedBox(height: 24),

        // Backend
        Text('backend_technology'.tr, style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: techStacks.where((tech) => tech.type == 'backend').map((tech) {
            return ChoiceChip(
              label: Text(tech.name, style: TextStyle(fontWeight: FontWeight.w500)),
              selected: _selectedBackend == tech.id,
              onSelected: (selected) {
                setState(() {
                  _selectedBackend = selected ? tech.id : null;
                });
              },
              selectedColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
            );
          }).toList(),
        ),

        SizedBox(height: 24),

        // Database
        Text('database_system'.tr, style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: techStacks.where((tech) => tech.type == 'database').map((tech) {
            return ChoiceChip(
              label: Text(tech.name, style: TextStyle(fontWeight: FontWeight.w500)),
              selected: _selectedDatabase == tech.id,
              onSelected: (selected) {
                setState(() {
                  _selectedDatabase = selected ? tech.id : null;
                });
              },
              selectedColor: Theme.of(context).primaryColor.withOpacity(0.2),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildStep3Content() {
    final localeController = Get.find<LocaleController>();
    final isArabic = localeController.isArabic;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'choose_package'.tr,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 800 ? 2 : 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.8,
          ),
          itemCount: packageTiers.length,
          itemBuilder: (context, index) {
            final tier = packageTiers[index];
            return Card(
              elevation: _selectedTier == tier.id ? 8 : 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: _selectedTier == tier.id ? tier.color.withValues(alpha: 0.1) : null,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedTier = tier.id;
                  });
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
                              isArabic ? tier.nameAr : tier.nameEn,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Radio<String>(
                            value: tier.id,
                            groupValue: _selectedTier,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedTier = value;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        isArabic ? tier.descriptionAr : tier.descriptionEn,
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
                                    isArabic ? tier.featuresAr[idx] : tier.featuresEn[idx],
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
            );
          },
        ),
      ],
    );
  }

  Widget _buildStep4Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'project_summary_title'.tr,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 24),
        Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
          child: Column(
            children: [
              Icon(Icons.receipt_long, size: 48, color: Theme.of(context).primaryColor),
              SizedBox(height: 16),
              Text(
                'project_summary_title'.tr,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              if (_selectedCategory != null)
                _buildSummaryItem('project_type'.tr, projectCategories.firstWhere((c) => c.id == _selectedCategory).nameEn),
              if (_selectedFrontend != null)
                _buildSummaryItem('frontend_framework'.tr.replaceAll(':', ''), techStacks.firstWhere((t) => t.id == _selectedFrontend).name),
              if (_selectedBackend != null)
                _buildSummaryItem('backend_technology'.tr.replaceAll(':', ''), techStacks.firstWhere((t) => t.id == _selectedBackend).name),
              if (_selectedDatabase != null)
                _buildSummaryItem('database_system'.tr.replaceAll(':', ''), techStacks.firstWhere((t) => t.id == _selectedDatabase).name),
              if (_selectedTier != null)
                _buildSummaryItem('package'.tr, packageTiers.firstWhere((t) => t.id == _selectedTier).nameEn),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50.withValues(alpha: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'total_price_label'.tr,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      '\$${_totalPrice.toStringAsFixed(0)}',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ],
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
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localeController = Get.find<LocaleController>();
    final isArabic = localeController.isArabic;

    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text('calculator_title'.tr),
          actions: [
            IconButton(
              icon: Icon(Icons.language),
              onPressed: () {
                localeController.changeLanguage(isArabic ? 'en' : 'ar');
              },
            ),
          ],
        ),
        body: Stepper(
        currentStep: _currentStep,
        onStepContinue: _nextStep,
        onStepCancel: _previousStep,
        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                if (_currentStep > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: details.onStepCancel,
                      child: Text('previous'.tr),
                    ),
                  ),
                if (_currentStep > 0) SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _currentStep == 3 ? () {
                      // Handle finish - could show dialog or navigate
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Quote request submitted! We will contact you soon.')),
                      );
                    } : details.onStepContinue,
                    child: Text(_currentStep == 3 ? 'finish'.tr : 'next'.tr),
                  ),
                ),
              ],
            ),
          );
        },
        steps: [
          Step(
            title: Text('choose_project_type'.tr),
            content: _buildStep1Content(),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: Text('select_technologies'.tr),
            content: _buildStep2Content(),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: Text('choose_package'.tr),
            content: _buildStep3Content(),
            isActive: _currentStep >= 2,
          ),
          Step(
            title: Text('project_summary_title'.tr),
            content: _buildStep4Content(),
            isActive: _currentStep >= 3,
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'consulting',
            onPressed: () {
              // Handle consulting booking
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Consulting booking feature coming soon!')),
              );
            },
            child: Icon(Icons.calendar_today),
            tooltip: 'book_consulting'.tr,
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'whatsapp',
            onPressed: () {
              // Handle WhatsApp contact
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Opening WhatsApp...')),
              );
            },
            backgroundColor: Colors.green,
            child: Icon(Icons.message),
            tooltip: 'contact_whatsapp'.tr,
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'premade',
            onPressed: () {
              // Navigate to pre-made projects
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Pre-made projects page coming soon!')),
              );
            },
            backgroundColor: Colors.orange,
            child: Icon(Icons.inventory),
            tooltip: 'premade_projects'.tr,
          ),
        ],
      ),
      ),
    );
  }
}
