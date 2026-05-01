import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../controllers/home_controller.dart';
import 'project_card.dart';

class ProjectsSection extends GetView<HomeController> {
  const ProjectsSection({super.key});

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
              'المشاريع',
              style: GoogleFonts.cairo(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.5),
            ),
          ),
          const SizedBox(height: 16),
          
          // Section Title
          Row(
            children: [
              Text('أعمال ', style: GoogleFonts.tajawal(fontSize: isDesktop ? 52 : 32, fontWeight: FontWeight.w900, color: AppColors.textPrimary, height: 1.1)),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(colors: [AppColors.primary, AppColors.secondary]).createShader(bounds),
                child: Text('موثّقة ومنشورة', style: GoogleFonts.tajawal(fontSize: isDesktop ? 52 : 32, fontWeight: FontWeight.w900, color: Colors.white, height: 1.1)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'تطبيقات حقيقية على متاجر App Store وGoogle Play تستخدمها آلاف المستخدمين',
            style: GoogleFonts.cairo(fontSize: 16, color: AppColors.textSecondary, height: 1.7),
          ),
          const SizedBox(height: 60),

          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 900 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 1.1,
                ),
                itemCount: controller.projects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(project: controller.projects[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
