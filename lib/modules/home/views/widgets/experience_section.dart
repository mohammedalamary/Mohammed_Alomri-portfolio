import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:portfolio_my/modules/home/controllers/home_controller.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../data/models/project_model.dart';

class ExperienceSection extends GetView<HomeController> {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Tag
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              border: Border.all(color: AppColors.primary.withOpacity(0.15)),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              'مسيرة مهنية',
              style: GoogleFonts.cairo(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.5),
            ),
          ),
          const SizedBox(height: 16),
          
          // Section Title
          Row(
            children: [
              Text('خبرات ', style: GoogleFonts.tajawal(fontSize: isDesktop ? 52 : 32, fontWeight: FontWeight.w900, color: AppColors.textPrimary, height: 1.1)),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(colors: [AppColors.primary, AppColors.secondary]).createShader(bounds),
                child: Text('عملية متميزة', style: GoogleFonts.tajawal(fontSize: isDesktop ? 52 : 32, fontWeight: FontWeight.w900, color: Colors.white, height: 1.1)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'مسيرة احترافية في شركات رائدة بالسعودية واليمن',
            style: GoogleFonts.cairo(fontSize: 16, color: AppColors.textSecondary, height: 1.7),
          ),
          const SizedBox(height: 60),

          // Timeline
          Stack(
            children: [
              // Vertical Line
              Positioned(
                right: 19,
                top: 0,
                bottom: 0,
                width: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primary, AppColors.secondary, Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              
              Column(
                children: controller.experiences.map((exp) => _ExperienceItem(exp)).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ExperienceItem extends StatefulWidget {
  final ExperienceModel exp;
  const _ExperienceItem(this.exp);

  @override
  State<_ExperienceItem> createState() => _ExperienceItemState();
}

class _ExperienceItemState extends State<_ExperienceItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48, right: 56),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Dot
          Positioned(
            right: -46,
            top: 6,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(colors: [AppColors.primary, AppColors.secondary], begin: Alignment.topLeft, end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(color: AppColors.primary.withOpacity(0.15), spreadRadius: 4),
                ],
              ),
            ),
          ),
          
          // Content
          MouseRegion(
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: AppColors.cardBg,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: isHovered ? AppColors.primary.withOpacity(0.3) : AppColors.primary.withOpacity(0.15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.exp.date,
                    style: GoogleFonts.cairo(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.exp.role,
                    style: GoogleFonts.tajawal(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.exp.company,
                    style: GoogleFonts.cairo(fontSize: 14, color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 16),
                  ...widget.exp.points.map((point) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 6, left: 10),
                          child: Icon(Icons.play_arrow, size: 10, color: AppColors.primary),
                        ),
                        Expanded(
                          child: Text(
                            point,
                            style: GoogleFonts.cairo(fontSize: 14, color: AppColors.textSecondary, height: 1.5),
                          ),
                        ),
                      ],
                    ),
                  )).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
