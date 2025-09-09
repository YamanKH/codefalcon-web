import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:code_falcon/app/ui/theme/app_colors.dart';
import 'package:code_falcon/app/ui/theme/app_text_styles.dart';
import 'home_controller.dart';

// Team Member Model
class TeamMember {
  final String name;
  final String title;
  final String imageUrl;
  final Map<String, String> socialLinks;

  TeamMember({
    required this.name,
    required this.title,
    required this.imageUrl,
    required this.socialLinks,
  });
}

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  final _homeKey = const GlobalObjectKey('homeSection');
  final _aboutKey = const GlobalObjectKey('aboutSection');
  final _servicesKey = const GlobalObjectKey('servicesSection');
  final _projectsKey = const GlobalObjectKey('projectsSection');
  final _contactKey = const GlobalObjectKey('contactSection');

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return Directionality(
      textDirection: TextDirection.rtl,
      // Set text direction to right-to-left for Arabic
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(child: widget),
              ),
              children: [
                // Header/Navigation Bar
                _buildHeader(context),

                // Hero Section
                _buildHeroSection(context, _homeKey),

                // About Section
                _buildAboutSection(context, _aboutKey),

                // Services/Skills Section
                _buildServicesSection(context, _servicesKey),

                // Portfolio/Projects Section
                _buildProjectsSection(context, _projectsKey),

                // Team Section
                _buildTeamSection(context),

                // Clients Section
                _buildClientsSection(context),

                // Contact Section
                _buildContactSection(context, _contactKey),

                // Footer
                _buildFooter(context),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _scrollController.animateTo(
              0.0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          backgroundColor: AppColors.accentColor,
          child: const Icon(
            Icons.arrow_upward,
            color: AppColors.primaryBackground,
          ),
        ),
        drawer: Drawer(
          backgroundColor: AppColors.primaryBackground,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.accentColor,
                ),
                child: Text(
                  'القائمة',
                  style: AppTextStyles.heading2.copyWith(color: AppColors.textColor),
                ),
              ),
              _buildDrawerNavLink('الرئيسية', _homeKey, context),
              _buildDrawerNavLink('من نحن', _aboutKey, context),
              _buildDrawerNavLink('خدماتنا', _servicesKey, context),
              _buildDrawerNavLink('مشاريعنا', _projectsKey, context),
              _buildDrawerNavLink('تواصل معنا', _contactKey, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: AppColors.primaryBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/logo.png', height: 60),
          if (MediaQuery.of(context).size.width >
              800) // Show navigation links on larger screens
            Row(
              children: [
                _buildNavLink('الرئيسية', _homeKey),
                _buildNavLink('من نحن', _aboutKey),
                _buildNavLink('خدماتنا', _servicesKey),
                _buildNavLink('مشاريعنا', _projectsKey),
                _buildNavLink('تواصل معنا', _contactKey),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu, color: AppColors.textColor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
        ],
      ),
    );
  }

  Widget _buildNavLink(String title, GlobalKey key) {
    return TextButton(
      onPressed: () => _scrollToSection(key),
      child: Text(
        title,
        style: AppTextStyles.bodyText.copyWith(color: AppColors.textColor),
      ),
    );
  }

  

  Widget _buildHeroSection(BuildContext context, GlobalKey key) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          key: key,
          height: MediaQuery.of(context).size.height * 0.8,
          // 80% of screen height
          width: double.infinity,
          color: AppColors.primaryBackground,
          child: Stack(
            children: [
              Positioned.fill(
                child: Lottie.asset(
                  'assets/CodingSlide.json',
                  // Using coding.json for hero section
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(
                    0.9,
                  ), // Semi-transparent black overlay
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'كود فالكون',
                      style: AppTextStyles.heading1.copyWith(
                        color: AppColors.accentColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: constraints.maxWidth > 800 ? 600 : 300,
                      // Responsive width
                      child: DefaultTextStyle(
                        style: AppTextStyles.heading2.copyWith(
                          color: AppColors.textColor,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText('حلول برمجية مبتكرة'),
                            TyperAnimatedText('نصمم المستقبل'),
                            TyperAnimatedText('شريكك التقني الموثوق'),
                          ],
                          onTap: () {
                            print("Tap Event");
                          },
                          repeatForever: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAboutSection(BuildContext context, GlobalKey key) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          key: key,
          padding: const EdgeInsets.all(40),
          color: AppColors.primaryBackground,
          child: Column(
            children: [
              _buildSectionTitle('من نحن', context),
              const SizedBox(height: 20),
              constraints.maxWidth > 800
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Lottie.asset(
                            'assets/Codingboy.json',
                            // Using Codingboy.json for About section
                            height: 600,
                            width: 300,
                          ),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          child: Text(
                            'نحن في كود فالكون نقدم حلولاً برمجية متكاملة ومبتكرة لعملائنا، نهدف إلى تحويل أفكارهم إلى واقع رقمي ملموس. فريقنا من المهندسين والمصممين ذوي الخبرة ملتزمون بتقديم أعلى مستويات الجودة والاحترافية في كل مشروع. نؤمن بأن التكنولوجيا هي مفتاح المستقبل، ونسعى جاهدين لتمكين عملائنا من تحقيق أهدافهم من خلال حلول برمجية قوية وموثوقة. نحن نركز على تقديم تجربة مستخدم استثنائية وتصميمات جذابة، مع الالتزام بأحدث التقنيات والمعايير العالمية لضمان جودة وكفاءة الحلول التي نقدمها.',
                            textAlign: TextAlign.justify,
                            style: AppTextStyles.bodyText,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Lottie.asset(
                          'assets/Codingboy.json',
                          // Using Codingboy.json for About section
                          height: 400,
                          width: 300,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'نحن في كود فالكون نقدم حلولاً برمجية متكاملة ومبتكرة لعملائنا، نهدف إلى تحويل أفكارهم إلى واقع رقمي ملموس. فريقنا من المهندسين والمصممين ذوي الخبرة ملتزمون بتقديم أعلى مستويات الجودة والاحترافية في كل مشروع. نؤمن بأن التكنولوجيا هي مفتاح المستقبل، ونسعى جاهدين لتمكين عملائنا من تحقيق أهدافهم من خلال حلول برمجية قوية وموثوقة. نحن نركز على تقديم تجربة مستخدم استثنائية وتصميمات جذابة، مع الالتزام بأحدث التقنيات والمعايير العالمية لضمان جودة وكفاءة الحلول التي نقدمها.',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodyText,
                        ),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildServicesSection(BuildContext context, GlobalKey key) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 1;
        if (constraints.maxWidth > 1200) {
          crossAxisCount = 4;
        } else if (constraints.maxWidth > 800) {
          crossAxisCount = 3;
        } else if (constraints.maxWidth > 500) {
          crossAxisCount = 2;
        } else {
          crossAxisCount = 1;
        }

        return Container(
          key: key,
          padding: const EdgeInsets.all(40),
          color: AppColors.primaryBackground,
          child: Column(
            children: [
              _buildSectionTitle('خدماتنا', context),
              const SizedBox(height: 30),
              Lottie.asset(
                'assets/CodingSlide.json',
                // Using CodingSlide.json for Services section
                height: 400,
                width: 300,
              ),
              const SizedBox(height: 30),
              AnimationLimiter(
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // Disable GridView's own scrolling
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 375),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(child: widget),
                    ),
                    children: [
                      _buildServiceCard(
                        'تطوير تطبيقات الويب',
                        FontAwesomeIcons.globe,
                        'نقدم حلولاً متكاملة لتطوير تطبيقات الويب باستخدام أحدث التقنيات لضمان الأداء العالي وتجربة المستخدم المميزة.',
                      ),
                      _buildServiceCard(
                        'تطوير تطبيقات الموبايل',
                        FontAwesomeIcons.mobileAlt,
                        'نصمم ونطور تطبيقات جوال مبتكرة لأنظمة iOS و Android، مع التركيز على سهولة الاستخدام والأداء السلس.',
                      ),
                      _buildServiceCard(
                        'تصميم واجهات المستخدم وتجربة المستخدم',
                        FontAwesomeIcons.paintBrush,
                        'نبتكر واجهات مستخدم جذابة وتجارب مستخدم سلسة تضمن تفاعلاً فعالاً وممتعاً مع تطبيقاتك.',
                      ),
                      _buildServiceCard(
                        'استشارات برمجية',
                        FontAwesomeIcons.lightbulb,
                        'نقدم استشارات متخصصة لمساعدتك في اتخاذ القرارات التقنية الصحيحة وتوجيه مشاريعك نحو النجاح.',
                      ),
                      _buildServiceCard(
                        'حلول الذكاء الاصطناعي',
                        FontAwesomeIcons.robot,
                        'نطور حلولاً ذكية تعتمد على الذكاء الاصطناعي وتعلم الآلة لأتمتة المهام وتحسين الكفاءة.',
                      ),
                      _buildServiceCard(
                        'خدمات الحوسبة السحابية',
                        FontAwesomeIcons.cloud,
                        'نساعدك في بناء ونشر وإدارة تطبيقاتك على منصات الحوسبة السحابية الرائدة لضمان المرونة والتوسع.',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildServiceCard(String title, IconData icon, String description) {
    return Card(
      color: AppColors.primaryBackground, // Dark background for card
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, size: 50, color: AppColors.accentColor),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyText.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyText.copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectsSection(BuildContext context, GlobalKey key) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 1;
        if (constraints.maxWidth > 1200) {
          crossAxisCount = 3;
        } else if (constraints.maxWidth > 800) {
          crossAxisCount = 2;
        } else {
          crossAxisCount = 1;
        }

        return Container(
          key: key,
          padding: const EdgeInsets.all(40),
          color: AppColors.primaryBackground,
          child: Column(
            children: [
              _buildSectionTitle('مشاريعنا', context),
              const SizedBox(height: 30),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildProjectCard(
                    'تطبيق إدارة المطاعم',
                    'تطبيق قائمة طعام QR', // New description
                    'assets/TREAT_3.png', // Placeholder image
                    projectUrl: 'https://scandine.me', // New URL
                  ),
                  _buildProjectCard(
                    'منصة تعليمية تفاعلية',
                    'منصة ويب وجوال توفر دورات تعليمية تفاعلية، مع تتبع التقدم واختبارات تقييمية.',
                    'assets/TREAT_3.png', // Placeholder image
                  ),
                  _buildProjectCard(
                    'نظام إدارة المستشفيات',
                    'حل برمجي شامل لإدارة بيانات المرضى، المواعيد، السجلات الطبية، والفواتير في المستشفيات والعيادات.',
                    'assets/TREAT_3.png', // Placeholder image
                  ),
                  _buildProjectCard(
                    'تطبيق توصيل طلبات',
                    'تطبيق جوال يربط بين المطاعم والعملاء وشركات التوصيل، مع تتبع مباشر للطلبات وخيارات دفع متعددة.',
                    'assets/TREAT_3.png', // Placeholder image
                  ),
                  _buildProjectCard(
                    'نظام إدارة الموارد البشرية (HRM)',
                    'نظام ويب لأتمتة عمليات الموارد البشرية مثل إدارة الرواتب، الإجازات، وتقييم الأداء.',
                    'assets/TREAT_3.png', // Placeholder image
                  ),
                  _buildProjectCard(
                    'بوابة دفع إلكتروني',
                    'بوابة دفع آمنة ومرنة تدعم مختلف طرق الدفع الإلكتروني، مع تقارير مفصلة للمعاملات.',
                    'assets/TREAT_3.png', // Placeholder image
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProjectCard(
    String title,
    String description,
    String imagePath, {
    String? projectUrl,
  }) {
    return InkWell(
      onTap: projectUrl != null
          ? () async {
              if (await canLaunchUrl(Uri.parse(projectUrl))) {
                await launchUrl(Uri.parse(projectUrl));
              } else {
                print('Could not launch $projectUrl');
              }
            }
          : null,
      child: Card(
        color: AppColors.primaryBackground, // Dark background for card
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.bodyText.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.accentColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: AppTextStyles.bodyText,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactSection(BuildContext context, GlobalKey key) {
    final List<Map<String, String>> socialLinks = [
      {
        "url": "https://www.youtube.com/@CodingWithYaMaNn",
        "platform": "youtube",
      },
      {"url": "https://x.com/MaNoOox", "platform": "twitter"},
      {"url": "https://www.instagram.com/manoooz7/", "platform": "instagram"},
      {"url": "https://www.tiktok.com/@manoooz7", "platform": "tiktok"},
      {
        "url":
            "https://www.snapchat.com/add/manoooz?share_id=VOMvd2JQY40&locale=en-SA",
        "platform": "snapchat",
      },
      {"url": "https://wa.me/963954783983", "platform": "whatsapp"},
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          key: key,
          padding: const EdgeInsets.all(40),
          color: AppColors.primaryBackground,
          child: Column(
            children: [
              _buildSectionTitle('تواصل معنا', context),
              const SizedBox(height: 30),
              Text(
                'للاستفسارات أو طلب عرض سعر، يرجى التواصل معنا عبر:',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyText,
              ),
              const SizedBox(height: 20),
              Text(
                'codefalcon.me',
                style: AppTextStyles.bodyText.copyWith(
                  color: AppColors.accentColor,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '+963 954 783 983',
                style: AppTextStyles.bodyText.copyWith(
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: socialLinks.map((link) {
                  return _buildSocialIcon(
                    link['platform']!,
                    link['url']!,
                  ); // Pass platform and URL
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSocialIcon(String platform, String url) {
    IconData iconData;
    switch (platform) {
      case 'youtube':
        iconData = FontAwesomeIcons.youtube;
        break;
      case 'twitter':
        iconData = FontAwesomeIcons.twitter;
        break;
      case 'instagram':
        iconData = FontAwesomeIcons.instagram;
        break;
      case 'tiktok':
        iconData = FontAwesomeIcons.tiktok;
        break;
      case 'snapchat':
        iconData = FontAwesomeIcons.snapchatGhost;
        break;
      case 'whatsapp':
        iconData = FontAwesomeIcons.whatsapp;
        break;
      default:
        iconData = Icons.link; // Default icon for unknown platforms
    }

    return IconButton(
      icon: FaIcon(iconData, color: AppColors.textColor, size: 30),
      onPressed: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        } else {
          // Handle error: could not launch URL
          print('Could not launch $url');
        }
      },
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColors.primaryBackground,
      width: double.infinity,
      child: Text(
        '© 2025 كود فالكون. جميع الحقوق محفوظة.',
        textAlign: TextAlign.center,
        style: AppTextStyles.bodyText.copyWith(
          color: AppColors.secondaryTextColor,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Text(
        title,
        style: AppTextStyles.heading2.copyWith(color: AppColors.accentColor),
      ),
    );
  }

  Widget _buildTeamSection(BuildContext context) {
    final List<TeamMember> teamMembers = [
      TeamMember(
        name: 'يمان الخطيب',
        title: 'مؤسس مشارك',
        imageUrl:
            'https://api.dicebear.com/8.x/pixel-art/svg?seed=YamanAlkhateb',
        // DiceBear Pixel Art
        socialLinks: {
          'linkedin': 'https://linkedin.com/in/yamanalkhateb',
          'twitter': 'https://twitter.com/yamanalkhateb',
        },
      ),
      TeamMember(
        name: 'أريج فياض',
        title: 'مؤسس مشارك',
        imageUrl: 'https://api.dicebear.com/8.x/pixel-art/svg?seed=AreejFayadh',
        // DiceBear Pixel Art
        socialLinks: {
          'linkedin': 'https://linkedin.com/in/areejfayadh',
          'twitter': 'https://twitter.com/areejfayadh',
        },
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(40),
      color: AppColors.primaryBackground,
      child: Column(
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 375),
          childAnimationBuilder: (widget) => SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(child: widget),
          ),
          children: [
            _buildSectionTitle('فريقنا', context),
            const SizedBox(height: 30),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 800 ? 2 : 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.5, // Adjust as needed
              ),
              itemCount: teamMembers.length,
              itemBuilder: (context, index) {
                final member = teamMembers[index];
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  columnCount: MediaQuery.of(context).size.width > 800 ? 2 : 1,
                  child: ScaleAnimation(
                    child: FadeInAnimation(child: _buildTeamMemberCard(member)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMemberCard(TeamMember member) {
    return Card(
      color: AppColors.secondaryBackground,
      // Use a slightly different background for cards
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/logo.png'),
            ),
            const SizedBox(height: 15),
            ...AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(child: widget),
              ),
              children: [
                Text(
                  member.name,
                  style: AppTextStyles.bodyText.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                Text(
                  member.title,
                  style: AppTextStyles.bodyText.copyWith(
                    fontSize: 14,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: member.socialLinks.entries.map((entry) {
                IconData iconData;
                switch (entry.key) {
                  case 'linkedin':
                    iconData = FontAwesomeIcons.linkedin;
                    break;
                  case 'twitter':
                    iconData = FontAwesomeIcons.twitter;
                    break;
                  case 'github':
                    iconData = FontAwesomeIcons.github;
                    break;
                  default:
                    iconData = Icons.link;
                }
                return IconButton(
                  icon: FaIcon(
                    iconData,
                    color: AppColors.accentColor,
                    size: 24,
                  ),
                  onPressed: () async {
                    if (await canLaunchUrl(Uri.parse(entry.value))) {
                      await launchUrl(Uri.parse(entry.value));
                    } else {
                      print('Could not launch ${entry.value}');
                    }
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClientsSection(BuildContext context) {
    final List<String> clientLogos = [
      'https://api.dicebear.com/8.x/pixel-art/svg?seed=ClientA',
      'https://api.dicebear.com/8.x/pixel-art/svg?seed=ClientB',
      'https://api.dicebear.com/8.x/pixel-art/svg?seed=ClientC',
      'https://api.dicebear.com/8.x/pixel-art/svg?seed=ClientD',
      'https://api.dicebear.com/8.x/pixel-art/svg?seed=ClientE',
      'https://api.dicebear.com/8.x/pixel-art/svg?seed=ClientF',
    ];

    return Container(
      padding: const EdgeInsets.all(40),
      color: AppColors.primaryBackground,
      child: Column(
        children: [
          _buildSectionTitle('عملاؤنا', context),
          const SizedBox(height: 30),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 800 ? 4 : 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.0, // Square aspect ratio for logos
            ),
            itemCount: clientLogos.length,
            itemBuilder: (context, index) {
              final logoUrl = clientLogos[index];
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 375),
                columnCount: MediaQuery.of(context).size.width > 800 ? 4 : 2,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: Card(
                      color: AppColors.secondaryBackground,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: CachedNetworkImage(
                          imageUrl: logoUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerNavLink(String title, GlobalKey key, BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles.bodyText.copyWith(color: AppColors.textColor),
      ),
      onTap: () {
        _scrollToSection(key);
        Navigator.pop(context); // Close the drawer
      },
    );
  }
}
