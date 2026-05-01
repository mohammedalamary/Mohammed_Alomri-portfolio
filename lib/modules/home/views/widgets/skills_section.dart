import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:portfolio_my/modules/home/controllers/home_controller.dart';
import '../../../../core/theme/app_colors.dart';

class SkillsSection extends GetView<HomeController> {
  const SkillsSection({super.key});

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
              'المهارات التقنية',
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
                child: Text('تقنية متكاملة', style: GoogleFonts.tajawal(fontSize: isDesktop ? 52 : 32, fontWeight: FontWeight.w900, color: Colors.white, height: 1.1)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'إتقان شامل لأدوات وتقنيات تطوير التطبيقات الحديثة عبر جميع المنصات',
            style: GoogleFonts.cairo(fontSize: 16, color: AppColors.textSecondary, height: 1.7),
          ),
          const SizedBox(height: 60),

          // Skills Grid
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 900 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.3,
                children: [
                  _SkillCard(
                    emoji: '🐦',
                    iconBg: const Color(0xFF54C5F8).withOpacity(0.15),
                    name: 'Flutter & Dart',
                    desc: 'تطوير تطبيقات متعددة المنصات بأداء عالٍ وواجهات جذابة',
                    percent: 95,
                  ),
                  _SkillCard(
                    emoji: '⚙️',
                    iconBg: const Color(0xFF7B2FFF).withOpacity(0.15),
                    name: 'ASP.NET Core API',
                    desc: 'تصميم وتطوير APIs قوية وآمنة لدعم التطبيقات',
                    percent: 78,
                  ),
                  _SkillCard(
                    emoji: '🏗️',
                    iconBg: const Color(0xFFFF6B35).withOpacity(0.15),
                    name: 'Architecture (MVVM/Clean)',
                    desc: 'تطبيق أفضل معماريات الكود لضمان قابلية الصيانة والتوسع',
                    percent: 90,
                  ),
                  _SkillCard(
                    emoji: '📱',
                    iconBg: const Color(0xFF00C864).withOpacity(0.15),
                    name: 'iOS & Android & Desktop',
                    desc: 'نشر التطبيقات على App Store وGoogle Play والتطبيقات المكتبية',
                    percent: 92,
                  ),
                  _SkillCard(
                    emoji: '🤖',
                    iconBg: const Color(0xFFFFC800).withOpacity(0.12),
                    name: 'AI Tools Integration',
                    desc: 'استخدام أدوات الذكاء الاصطناعي لتسريع التطوير وتحسين الكود',
                    percent: 88,
                  ),
                  _SkillCard(
                    emoji: '🗄️',
                    iconBg: const Color(0xFF00D4FF).withOpacity(0.12),
                    name: 'Database & SQL',
                    desc: 'تصميم قواعد بيانات وإدارة دورات حياة البيانات بكفاءة',
                    percent: 82,
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

class _SkillCard extends StatefulWidget {
  final String emoji;
  final Color iconBg;
  final String name;
  final String desc;
  final int percent;

  const _SkillCard({
    required this.emoji,
    required this.iconBg,
    required this.name,
    required this.desc,
    required this.percent,
  });

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(0, isHovered ? -4 : 0, 0),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isHovered ? AppColors.primary.withOpacity(0.3) : AppColors.primary.withOpacity(0.15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: widget.iconBg,
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: Text(widget.emoji, style: const TextStyle(fontSize: 26)),
            ),
            const SizedBox(height: 16),
            Text(widget.name, style: GoogleFonts.tajawal(fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
            const SizedBox(height: 8),
            Expanded(
              child: Text(widget.desc, style: GoogleFonts.cairo(fontSize: 13, color: AppColors.textSecondary, height: 1.6)),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('إتقان', style: GoogleFonts.cairo(fontSize: 12, color: AppColors.textSecondary)),
                Text('${widget.percent}%', style: GoogleFonts.cairo(fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
            const SizedBox(height: 6),
            Container(
              height: 4,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.06),
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.centerRight,
              child: FractionallySizedBox(
                widthFactor: widget.percent / 100,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [AppColors.primary, AppColors.secondary]),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
