import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../controllers/home_controller.dart';

class HeroSection extends GetView<HomeController> {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: isDesktop ? 120 : 60,
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Status Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF00FF88).withOpacity(0.1),
              border: Border.all(color: const Color(0xFF00FF88).withOpacity(0.2)),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _PulseDot(),
                const SizedBox(width: 8),
                Text(
                  'متاح للعمل حالياً',
                  style: GoogleFonts.cairo(color: const Color(0xFF00FF88), fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          
          // Hero Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              border: Border.all(color: AppColors.primary.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFF54C5F8), Color(0xFF01579B)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Flutter Senior Developer · +5 سنوات خبرة',
                  style: GoogleFonts.cairo(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 13),
                  textDirection: TextDirection.ltr,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          
          // Hero Name
          Text(
            'محمد العمري',
            style: GoogleFonts.tajawal(fontSize: isDesktop ? 96 : 48, fontWeight: FontWeight.w900, color: AppColors.textPrimary, height: 1.05),
            textAlign: TextAlign.center,
          ),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [AppColors.primary, AppColors.secondary, AppColors.accent],
            ).createShader(bounds),
            child: Text(
              'الجرادي',
              style: GoogleFonts.tajawal(fontSize: isDesktop ? 96 : 48, fontWeight: FontWeight.w900, color: Colors.white, height: 1.05),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          
          // Title
          Text(
            'مطوّر تطبيقات Flutter محترف | Android · iOS · Desktop',
            style: GoogleFonts.cairo(fontSize: 20, color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          
          // Description
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: Text(
              'خبير في بناء تطبيقات ذكية عالية الأداء للأجهزة المحمولة وسطح المكتب. متخصص في تصميم وتطوير واجهات احترافية وبنية معمارية محكمة، مع خبرة في تطوير APIs باستخدام ASP.NET Core ودمج أدوات الذكاء الاصطناعي.',
              style: GoogleFonts.cairo(fontSize: 16, color: AppColors.textSecondary, height: 1.8),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 48),
          
          // Stats
          Wrap(
            spacing: isDesktop ? 48 : 28,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildStat('5+', 'سنوات خبرة'),
              _buildStat('10+', 'تطبيق أُنجز'),
              _buildStat('3', 'شركات عمل'),
              _buildStat('3', 'منصات مستهدفة'),
            ],
          ),
          const SizedBox(height: 48),
          
          // Buttons
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () => controller.scrollToSection(controller.contactKey),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 32, offset: const Offset(0, 8))],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.phone, color: Colors.white, size: 20),
                      const SizedBox(width: 8),
                      Text('تواصل معي', style: GoogleFonts.cairo(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => controller.scrollToSection(controller.projectsKey),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: AppColors.primary.withOpacity(0.15)),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.rocket_launch, color: AppColors.primary, size: 20),
                      const SizedBox(width: 8),
                      Text('شاهد المشاريع', style: GoogleFonts.cairo(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 15)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 48),
          
          // Tech Stack
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _buildTechPill('Flutter'),
              _buildTechPill('Dart'),
              _buildTechPill('ASP.NET Core'),
              _buildTechPill('MVVM'),
              _buildTechPill('Clean Architecture'),
              _buildTechPill('Firebase'),
              _buildTechPill('SQL Server'),
              _buildTechPill('REST API'),
              _buildTechPill('AI Tools'),
              _buildTechPill('Git'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String number, String label) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(colors: [AppColors.primary, AppColors.secondary], begin: Alignment.topLeft, end: Alignment.bottomRight).createShader(bounds),
          child: Text(number, style: GoogleFonts.tajawal(fontSize: 42, fontWeight: FontWeight.w900, color: Colors.white, height: 1)),
        ),
        const SizedBox(height: 4),
        Text(label, style: GoogleFonts.cairo(fontSize: 13, color: AppColors.textSecondary)),
      ],
    );
  }

  Widget _buildTechPill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        text,
        style: GoogleFonts.cairo(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}

class _PulseDot extends StatefulWidget {
  @override
  _PulseDotState createState() => _PulseDotState();
}

class _PulseDotState extends State<_PulseDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.5, end: 1.0).animate(_controller),
      child: Container(
        width: 7,
        height: 7,
        decoration: const BoxDecoration(
          color: Color(0xFF00FF88),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
