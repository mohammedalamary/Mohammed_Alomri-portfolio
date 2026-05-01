import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 40),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.primary.withOpacity(0.15))),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('صُمِّم بـ 💙 بواسطة ', style: GoogleFonts.cairo(color: AppColors.textSecondary, fontSize: 14)),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(colors: [AppColors.primary, AppColors.secondary]).createShader(bounds),
                child: Text('محمد العمري الجرادي', style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
              ),
              Text(' · مطوّر Flutter محترف', style: GoogleFonts.cairo(color: AppColors.textSecondary, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Flutter Developer · Android · iOS · Desktop · API',
            style: GoogleFonts.cairo(fontSize: 12, color: AppColors.textSecondary),
            textDirection: TextDirection.ltr,
          ),
        ],
      ),
    );
  }
}
