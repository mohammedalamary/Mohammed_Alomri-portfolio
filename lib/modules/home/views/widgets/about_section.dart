import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
              'نبذة عني',
              style: GoogleFonts.cairo(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.5),
            ),
          ),
          const SizedBox(height: 16),
          
          // Section Title
          Row(
            children: [
              Text('تعرف ', style: GoogleFonts.tajawal(fontSize: isDesktop ? 52 : 32, fontWeight: FontWeight.w900, color: AppColors.textPrimary, height: 1.1)),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(colors: [AppColors.primary, AppColors.secondary]).createShader(bounds),
                child: Text('علي أكثر', style: GoogleFonts.tajawal(fontSize: isDesktop ? 52 : 32, fontWeight: FontWeight.w900, color: Colors.white, height: 1.1)),
              ),
            ],
          ),
          const SizedBox(height: 40),
          
          Text(
            'لدي خبرة غنية في تصميم وبرمجة وإدارة مشاريع التطبيقات حيث عملت في السابق كمسؤول قسم تطبيقات في إحدى شركات التكنولوجيا اليمنية. '
            'خلال تجربتي العملية قمت بتطوير العديد من التطبيقات ذات الأهمية العالية، بما في ذلك تطبيقات بنكية، محافظ إلكترونية، متاجر إلكترونية، وتطبيقات لإدارة الموارد البشرية.',
            style: GoogleFonts.cairo(fontSize: 16, color: AppColors.textSecondary, height: 1.7),
          ),
          const SizedBox(height: 20),
          Text(
            'كما أن لدي خبرة متقدمة في تصميم قواعد البيانات وإدارة دورات حياة تطوير المشاريع (SDLC) بكفاءة عالية. أمتلك القدرة على العمل تحت الضغط والالتزام بالمواعيد النهائية. بالإضافة إلى ذلك، لدي خبرة قوية في بناء تطبيقات سطح المكتب بنفس بيئة العمل فلاتر، واستخدام أدوات الذكاء الاصطناعي لتسريع التطوير وزيادة كفاءة البرمجيات.',
            style: GoogleFonts.cairo(fontSize: 16, color: AppColors.textSecondary, height: 1.7),
          ),
        ],
      ),
    );
  }
}
