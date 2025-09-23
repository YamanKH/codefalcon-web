import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LocaleController extends GetxController {
  var currentLocale = const Locale('en', 'US').obs;

  void changeLanguage(String languageCode) {
    if (languageCode == 'ar') {
      currentLocale.value = const Locale('ar', 'SA');
    } else {
      currentLocale.value = const Locale('en', 'US');
    }
    Get.updateLocale(currentLocale.value);
  }

  bool get isArabic => currentLocale.value.languageCode == 'ar';
}

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar_SA': {
          // Navigation & Drawer
          'home': 'الرئيسية',
          'about': 'من نحن',
          'services': 'خدماتنا',
          'projects': 'مشاريعنا',
          'team': 'الفريق',
          'contact': 'تواصل معنا',
          'drawer_menu_title': 'القائمة',

          // Hero Section
          'company_name': 'كود فالكون',
          'hero_title_1': 'حلول برمجية مبتكرة',
          'hero_title_2': 'نصمم المستقبل',
          'hero_title_3': 'شريكك التقني الموثوق',

          // About Section
          'about_title': 'من نحن',
          'about_description':
              'نحن شركة متخصصة في تطوير الحلول البرمجية المبتكرة، نقدم خدمات عالية الجودة لعملائنا في جميع أنحاء المنطقة.',

          // Services Section
          'services_title': 'خدماتنا',
          'web_dev': 'تطوير تطبيقات الويب',
          'web_dev_desc':
              'نقدم حلولاً متكاملة لتطوير تطبيقات الويب باستخدام أحدث التقنيات لضمان الأداء العالي وتجربة المستخدم المميزة.',
          'mobile_dev': 'تطوير تطبيقات الموبايل',
          'mobile_dev_desc':
              'نصمم ونطور تطبيقات جوال مبتكرة لأنظمة iOS و Android، مع التركيز على سهولة الاستخدام والأداء السلس.',
          'ui_ux': 'تصميم واجهات وتجربة المستخدم',
          'ui_ux_desc':
              'نبتكر واجهات مستخدم جذابة وتجارب مستخدم سلسة تضمن تفاعلاً فعالاً وممتعاً مع تطبيقاتك.',
          'consulting': 'استشارات برمجية',
          'consulting_desc':
              'نقدم استشارات متخصصة لمساعدتك في اتخاذ القرارات التقنية الصحيحة وتوجيه مشاريعك نحو النجاح.',
          'ai_solutions': 'حلول الذكاء الاصطناعي',
          'ai_solutions_desc':
              'نطور حلولاً ذكية تعتمد على الذكاء الاصطناعي وتعلم الآلة لأتمتة المهام وتحسين الكفاءة.',
          'cloud_services': 'خدمات الحوسبة السحابية',
          'cloud_services_desc':
              'نساعدك في بناء ونشر وإدارة تطبيقاتك على منصات الحوسبة السحابية الرائدة لضمان المرونة والتوسع.',

          // Projects Section
          'projects_title': 'مشاريعنا',
          'restaurant_app': 'تطبيق إدارة المطاعم',
          'restaurant_desc': 'تطبيق قائمة طعام QR',
          'educational_platform': 'منصة تعليمية تفاعلية',
          'educational_desc':
              'منصة ويب وجوال توفر دورات تعليمية تفاعلية، مع تتبع التقدم واختبارات تقييمية.',
          'hospital_system': 'نظام إدارة المستشفيات',
          'hospital_desc':
              'حل برمجي شامل لإدارة بيانات المرضى، المواعيد، السجلات الطبية، والفواتير في المستشفيات والعيادات.',
          'delivery_app': 'تطبيق توصيل طلبات',
          'delivery_desc':
              'تطبيق جوال يربط بين المطاعم والعملاء وشركات التوصيل، مع تتبع مباشر للطلبات وخيارات دفع متعددة.',
          'hr_system': 'نظام إدارة الموارد البشرية',
          'hr_desc':
              'نظام ويب لأتمتة عمليات الموارد البشرية مثل إدارة الرواتب، الإجازات، وتقييم الأداء.',
          'payment_gateway': 'بوابة دفع إلكتروني',
          'payment_desc':
              'بوابة دفع آمنة ومرنة تدعم مختلف طرق الدفع الإلكتروني، مع تقارير مفصلة للمعاملات.',

          // Technologies Section
          'technologies_title': 'التقنيات التي نستخدمها',
          'flutter': 'فلاتر',
          'flutter_desc': 'إطار عمل حديث لبناء تطبيقات الويب والموبايل',
          'react': 'ريأكت',
          'react_desc': 'مكتبة جافاسكربت لبناء واجهات المستخدم التفاعلية',
          'nodejs': 'نود جي إس',
          'nodejs_desc': 'بيئة تشغيل جافاسكربت من جانب الخادم',
          'python': 'بايثون',
          'python_desc': 'لغة برمجة متعددة الاستخدامات للذكاء الاصطناعي والأنظمة',
          'firebase': 'فايربيز',
          'firebase_desc': 'منصة تطوير شاملة من جوجل',
          'mongodb': 'مونغو دي بي',
          'mongodb_desc': 'قاعدة بيانات NoSQL مرنة وعالية الأداء',
          'aws': 'خدمات أمازون السحابية',
          'aws_desc': 'منصة متكاملة للحوسبة السحابية',
          'docker': 'دوكر',
          'docker_desc': 'منصة لحاويات التطبيقات تضمن قابلية النقل والمرونة',

          // Team Section
          'team_title': 'فريقنا',
          'team_member_1_name': 'يمان الخطيب',
          'team_member_1_role': 'مطور واجهات أمامية',
          'team_member_2_name': 'أريج فياض',
          'team_member_2_role': 'مطورة خلفية',
          'team_member_3_name': 'أحمد محمد',
          'team_member_3_role': 'مطور متكامل',

          // Testimonials Section
          'testimonials_title': 'آراء عملائنا',
          'testimonial_1_message':
              'فريق كود فالكون قام بتطوير منصة تجارة إلكترونية متكاملة لنا بأعلى جودة وأداء ممتاز. التعاون معهم كان ممتعاً والنتيجة تجاوزت توقعاتنا.',
          'testimonial_1_name': 'سارة أحمد',
          'testimonial_1_position': 'مديرة التسويق',
          'testimonial_1_company': 'شركة التجارة الإلكترونية',
          'testimonial_2_message':
              'طوروا لنا تطبيق توصيل متطور مع تتبع فوري ودفع آمن. الأداء سلس والمستخدمون راضون جداً عن الخدمة.',
          'testimonial_2_name': 'محمد علي',
          'testimonial_2_position': 'مؤسس',
          'testimonial_2_company': 'تطبيق التوصيل',
          'testimonial_3_message':
              'نظام إدارة المستشفى الذي طوروه ساعدنا في تنظيم العمليات اليومية بشكل كبير. الدعم الفني ممتاز والنظام موثوق.',
          'testimonial_3_name': 'فاطمة حسن',
          'testimonial_3_position': 'مديرة المشاريع',
          'testimonial_3_company': 'مستشفى الرياض',

          // FAQ Section
          'faq_title': 'الأسئلة الشائعة',
          'faq_1_q': 'ما هي الخدمات التي تقدمونها؟',
          'faq_1_a':
              'نقدم مجموعة شاملة من الخدمات تشمل تطوير تطبيقات الويب والموبايل، تصميم واجهات المستخدم، استشارات برمجية، حلول الذكاء الاصطناعي، وخدمات الحوسبة السحابية.',
          'faq_2_q': 'كم يستغرق إنجاز مشروع عادي؟',
          'faq_2_a':
              'يعتمد الوقت على تعقيد المشروع، لكن المشاريع البسيطة تستغرق عادةً 4-6 أسابيع بينما المشاريع المعقدة قد تصل إلى 6 أشهر.',
          'faq_3_q': 'هل تقدمون دعماً فنياً بعد التسليم؟',
          'faq_3_a':
              'نعم، نقدم دعماً فنياً شاملاً لمدة 6 أشهر بعد التسليم مجاناً، مع إمكانية تمديد الدعم بأسعار تنافسية.',
          'faq_4_q': 'ما هي التقنيات التي تستخدمونها؟',
          'faq_4_a':
              'نستخدم أحدث التقنيات مثل Flutter للتطبيقات، React للويب، Node.js للخادم، Python للذكاء الاصطناعي، وخدمات AWS للحوسبة السحابية.',
          'faq_5_q': 'كيف يمكنني طلب عرض سعر؟',
          'faq_5_a':
              'يمكنك التواصل معنا عبر البريد الإلكتروني أو الهاتف أو ملء نموذج الاستفسار على الموقع، وسنرسل لك عرض السعر خلال 24 ساعة.',
          'faq_6_q': 'هل تتعاملون مع مشاريع صغيرة؟',
          'faq_6_a':
              'نعم، نتعامل مع جميع أحجام المشاريع من الحلول البسيطة للشركات الناشئة إلى الأنظمة المتكاملة للشركات الكبرى.',

          // Contact Section
          'contact_title': 'تواصل معنا',
          'contact_description':
              'للاستفسارات أو طلب عرض سعر، يرجى ملء النموذج أدناه:',
          'name': 'الاسم',
          'email': 'البريد الإلكتروني',
          'message': 'الرسالة',
          'send': 'إرسال',
          'social_contact': 'أو تواصل معنا عبر وسائل التواصل الاجتماعي:',
          'contact_success': 'تم إرسال رسالتك بنجاح! سنتواصل معك قريباً.',
          'name_required': 'يرجى إدخال الاسم',
          'email_required': 'يرجى إدخال البريد الإلكتروني',
          'email_invalid': 'يرجى إدخال بريد إلكتروني صحيح',
          'message_required': 'يرجى إدخال الرسالة',

          // Footer / Newsletter
          'newsletter_title': 'اشترك في النشرة الإخبارية',
          'newsletter_subtitle': 'احصل على آخر الأخبار والتحديثات حول مشاريعنا',
          'newsletter_hint': 'أدخل بريدك الإلكتروني',
          'subscribe': 'اشتراك',
          'subscription_success': 'تم الاشتراك بنجاح! شكراً لك.',
          'footer_rights': '© 2025 كود فالكون. جميع الحقوق محفوظة.',
        },
        'en_US': {
          // Navigation & Drawer
          'home': 'Home',
          'about': 'About',
          'services': 'Services',
          'projects': 'Projects',
          'team': 'Team',
          'contact': 'Contact',
          'drawer_menu_title': 'Menu',

          // Hero Section
          'company_name': 'Code Falcon',
          'hero_title_1': 'Innovative Software Solutions',
          'hero_title_2': 'We Design the Future',
          'hero_title_3': 'Your Trusted Tech Partner',

          // About Section
          'about_title': 'About Us',
          'about_description':
              'We are a specialized company in developing innovative software solutions, delivering high-quality services to our clients across the region.',

          // Services Section
          'services_title': 'Our Services',
          'web_dev': 'Web Application Development',
          'web_dev_desc':
              'We build comprehensive web applications using the latest technologies to ensure high performance and excellent user experience.',
          'mobile_dev': 'Mobile Application Development',
          'mobile_dev_desc':
              'We design and develop innovative mobile apps for iOS and Android with a focus on usability and smooth performance.',
          'ui_ux': 'UI/UX Design',
          'ui_ux_desc':
              'We craft engaging user interfaces and seamless experiences that delight your customers.',
          'consulting': 'Software Consulting',
          'consulting_desc':
              'We provide expert guidance to help you make the right technical decisions and keep projects on track.',
          'ai_solutions': 'AI Solutions',
          'ai_solutions_desc':
              'We build intelligent solutions powered by AI and machine learning to automate work and boost efficiency.',
          'cloud_services': 'Cloud Computing Services',
          'cloud_services_desc':
              'We help you build, deploy, and manage applications on leading cloud platforms for scalability and flexibility.',

          // Projects Section
          'projects_title': 'Our Projects',
          'restaurant_app': 'Restaurant Management App',
          'restaurant_desc': 'QR menu experience tailored for restaurants.',
          'educational_platform': 'Interactive Learning Platform',
          'educational_desc':
              'Web and mobile solution that delivers interactive courses with progress tracking and assessments.',
          'hospital_system': 'Hospital Management System',
          'hospital_desc':
              'Comprehensive software to manage patient records, appointments, medical history, and billing.',
          'delivery_app': 'Delivery Application',
          'delivery_desc':
              'A mobile app connecting restaurants, customers, and couriers with live tracking and secure payments.',
          'hr_system': 'Human Resources Management System',
          'hr_desc':
              'A web platform that automates HR processes like payroll, leave, and performance reviews.',
          'payment_gateway': 'Payment Gateway',
          'payment_desc':
              'Secure and flexible payment gateway supporting multiple payment methods with detailed reporting.',

          // Technologies Section
          'technologies_title': 'Technologies We Use',
          'flutter': 'Flutter',
          'flutter_desc': 'Modern framework for building web and mobile apps.',
          'react': 'React',
          'react_desc': 'JavaScript library for rich, interactive UIs.',
          'nodejs': 'Node.js',
          'nodejs_desc': 'JavaScript runtime powering scalable backends.',
          'python': 'Python',
          'python_desc': 'Versatile programming language for AI, data, and automation.',
          'firebase': 'Firebase',
          'firebase_desc': 'Google’s all-in-one backend platform.',
          'mongodb': 'MongoDB',
          'mongodb_desc': 'Flexible NoSQL database built for speed.',
          'aws': 'Amazon Web Services',
          'aws_desc': 'Comprehensive cloud computing platform.',
          'docker': 'Docker',
          'docker_desc': 'Container platform that makes apps portable and reliable.',

          // Team Section
          'team_title': 'Our Team',
          'team_member_1_name': 'Yaman Alkhateb',
          'team_member_1_role': 'Frontend Developer',
          'team_member_2_name': 'Areej Fayadh',
          'team_member_2_role': 'Backend Developer',
          'team_member_3_name': 'Ahmed Mohamed',
          'team_member_3_role': 'Full-Stack Developer',

          // Testimonials Section
          'testimonials_title': 'Client Testimonials',
          'testimonial_1_message':
              'Code Falcon delivered a full e-commerce platform with outstanding quality and performance. Collaboration was smooth and exceeded our expectations.',
          'testimonial_1_name': 'Sarah Ahmed',
          'testimonial_1_position': 'Marketing Manager',
          'testimonial_1_company': 'E-commerce Company',
          'testimonial_2_message':
              'They built a delivery app with real-time tracking and secure payments. Performance is great and users love it.',
          'testimonial_2_name': 'Mohamed Ali',
          'testimonial_2_position': 'Founder',
          'testimonial_2_company': 'Delivery App',
          'testimonial_3_message':
              'The hospital management system transformed our daily operations. Support is excellent and the system is reliable.',
          'testimonial_3_name': 'Fatima Hassan',
          'testimonial_3_position': 'Project Manager',
          'testimonial_3_company': 'Riyadh Hospital',

          // FAQ Section
          'faq_title': 'Frequently Asked Questions',
          'faq_1_q': 'What services do you provide?',
          'faq_1_a':
              'We cover web and mobile development, UI/UX, consulting, AI solutions, and cloud services.',
          'faq_2_q': 'How long does a typical project take?',
          'faq_2_a':
              'Time varies by scope. Simple apps take 4-6 weeks, while complex systems may take up to 6 months.',
          'faq_3_q': 'Do you offer support after delivery?',
          'faq_3_a':
              'Yes, we include six months of complimentary support with options to extend.',
          'faq_4_q': 'What technologies do you use?',
          'faq_4_a':
              'We rely on Flutter, React, Node.js, Python, AWS, and other modern tools.',
          'faq_5_q': 'How can I request a quote?',
          'faq_5_a':
              'Reach out via email, phone, or our inquiry form and we will respond within 24 hours.',
          'faq_6_q': 'Do you work with small projects?',
          'faq_6_a':
              'Absolutely—we support startups, SMEs, and enterprise-scale initiatives.',

          // Contact Section
          'contact_title': 'Contact Us',
          'contact_description':
              'For questions or to request a quote, please fill in the form below:',
          'name': 'Name',
          'email': 'Email',
          'message': 'Message',
          'send': 'Send',
          'social_contact': 'Or reach us on social media:',
          'contact_success': 'Thanks! Your message was sent successfully.',
          'name_required': 'Please enter your name',
          'email_required': 'Please enter your email address',
          'email_invalid': 'Please enter a valid email address',
          'message_required': 'Please enter your message',

          // Footer / Newsletter
          'newsletter_title': 'Subscribe to our newsletter',
          'newsletter_subtitle': 'Get the latest updates on our projects and insights.',
          'newsletter_hint': 'Enter your email address',
          'subscribe': 'Subscribe',
          'subscription_success': 'You are subscribed! Thank you.',
          'footer_rights': '© 2025 Code Falcon. All rights reserved.',
        },
      };
}
