import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../controllers/home_controller.dart';

class ContactSection extends GetView<HomeController> {
  const ContactSection({super.key});

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
              'التواصل',
              style: GoogleFonts.cairo(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.5),
            ),
          ),
          const SizedBox(height: 16),
          
          // Section Title
          Row(
            children: [
              Text('دعنا ', style: GoogleFonts.tajawal(fontSize: isDesktop ? 52 : 32, fontWeight: FontWeight.w900, color: AppColors.textPrimary, height: 1.1)),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(colors: [AppColors.primary, AppColors.secondary]).createShader(bounds),
                child: Text('نبني معاً', style: GoogleFonts.tajawal(fontSize: isDesktop ? 52 : 32, fontWeight: FontWeight.w900, color: Colors.white, height: 1.1)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'متاح للفرص المهنية والمشاريع الجديدة في المملكة العربية السعودية وعن بُعد',
            style: GoogleFonts.cairo(fontSize: 16, color: AppColors.textSecondary, height: 1.7),
          ),
          const SizedBox(height: 60),

          // Contact Grid
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 768 ? 2 : 1;
              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: constraints.maxWidth > 768 ? 3.5 : 3.0,
                children: [
                  _ContactCard(
                    emoji: '📱',
                    iconBg: const Color(0xFF00D4FF).withOpacity(0.12),
                    label: 'الجوال / واتساب',
                    value: '0578028527',
                    onTap: () => controller.launchURL('tel:0578028527'),
                    isLtr: true,
                  ),
                  _ContactCard(
                    emoji: '✉️',
                    iconBg: const Color(0xFFFF6B35).withOpacity(0.12),
                    label: 'البريد الإلكتروني',
                    value: 'mohammed.qaidsaeed@gmail.com',
                    onTap: () => controller.launchURL('mailto:mohammed.qaidsaeed@gmail.com'),
                    isLtr: true,
                  ),
                  _ContactCard(
                    emoji: '📍',
                    iconBg: const Color(0xFF00C864).withOpacity(0.12),
                    label: 'الموقع',
                    value: 'المرسلات، الرياض، السعودية',
                  ),
                  _ContactCard(
                    emoji: '🎓',
                    iconBg: const Color(0xFF7B2FFF).withOpacity(0.12),
                    label: 'التعليم',
                    value: 'بكالوريوس تقنية معلومات',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final String emoji;
  final Color iconBg;
  final String label;
  final String value;
  final VoidCallback? onTap;
  final bool isLtr;

  const _ContactCard({
    required this.emoji,
    required this.iconBg,
    required this.label,
    required this.value,
    this.onTap,
    this.isLtr = false,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.translationValues(0, isHovered ? -3 : 0, 0),
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: isHovered ? const Color(0xFF00D4FF).withOpacity(0.05) : AppColors.cardBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: isHovered ? const Color(0xFF00D4FF).withOpacity(0.4) : AppColors.primary.withOpacity(0.15)),
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: widget.iconBg,
                  borderRadius: BorderRadius.circular(14),
                ),
                alignment: Alignment.center,
                child: Text(widget.emoji, style: const TextStyle(fontSize: 24)),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.label, style: GoogleFonts.cairo(fontSize: 12, color: AppColors.textSecondary)),
                    const SizedBox(height: 4),
                    Text(
                      widget.value,
                      style: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                      textDirection: widget.isLtr ? TextDirection.ltr : TextDirection.rtl,
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
}
