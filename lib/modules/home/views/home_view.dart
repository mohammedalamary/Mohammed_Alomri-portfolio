import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/home_controller.dart';
import 'widgets/custom_navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/about_section.dart';
import 'widgets/skills_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/footer_section.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          _buildBackground(),
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              const CustomNavBar(),
              SliverList(
                delegate: SliverChildListDelegate([
                  HeroSection(key: controller.heroKey),
                  AboutSection(key: controller.aboutKey),
                  SkillsSection(key: controller.skillsKey),
                  ExperienceSection(key: controller.experienceKey),
                  ProjectsSection(key: controller.projectsKey),
                  ContactSection(key: controller.contactKey),
                  const FooterSection(),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(Get.context!).size.height * 0.2,
          left: MediaQuery.of(Get.context!).size.width * 0.2,
          child: _GlowBall(color: AppColors.primary.withOpacity(0.08), size: 600),
        ),
        Positioned(
          bottom: MediaQuery.of(Get.context!).size.height * 0.2,
          right: MediaQuery.of(Get.context!).size.width * 0.2,
          child: _GlowBall(color: AppColors.secondary.withOpacity(0.08), size: 800),
        ),
        Positioned.fill(
          child: CustomPaint(
            painter: GridPainter(),
          ),
        ),
      ],
    );
  }
}

class _GlowBall extends StatelessWidget {
  final Color color;
  final double size;
  const _GlowBall({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(color: color, blurRadius: size / 2, spreadRadius: size / 2),
        ],
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary.withOpacity(0.03)
      ..strokeWidth = 1.0;

    const double step = 60.0;

    for (double i = 0; i < size.width; i += step) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i < size.height; i += step) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
