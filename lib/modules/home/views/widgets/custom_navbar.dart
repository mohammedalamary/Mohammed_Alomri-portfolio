import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_my/modules/home/controllers/home_controller.dart';
import '../../../../core/theme/app_colors.dart';

class CustomNavBar extends GetView<HomeController> {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      backgroundColor: const Color(0xFF050A14).withOpacity(0.85),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width > 800 ? 40 : 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Text(
                'م.ع | Dev',
                style: GoogleFonts.cairo(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -0.5),
              ),
            ),
            if (MediaQuery.of(context).size.width > 800)
              Row(
                children: [
                  _navLink('عن المهندس', controller.heroKey),
                  const SizedBox(width: 32),
                  _navLink('نبذة عني', controller.aboutKey),
                  const SizedBox(width: 32),
                  _navLink('المهارات', controller.skillsKey),
                  const SizedBox(width: 32),
                  _navLink('الخبرة', controller.experienceKey),
                  const SizedBox(width: 32),
                  _navLink('المشاريع', controller.projectsKey),
                  const SizedBox(width: 32),
                  _navLink('التواصل', controller.contactKey),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _navLink(String title, GlobalKey key) {
    return InkWell(
      onTap: () => controller.scrollToSection(key),
      child: Text(
        title,
        style: GoogleFonts.cairo(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
