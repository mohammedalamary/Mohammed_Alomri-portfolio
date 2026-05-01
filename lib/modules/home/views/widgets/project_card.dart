import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../../data/models/project_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../controllers/home_controller.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;
  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  Color _getEmojiBgColor(String title) {
    if (title.contains('بنك')) return const Color(0xFF54C5F8).withOpacity(0.15);
    if (title.contains('المريسي')) return const Color(0xFF7B2FFF).withOpacity(0.15);
    if (title.contains('Smart')) return const Color(0xFF00C864).withOpacity(0.15);
    if (title.contains('ONEX')) return const Color(0xFFFF6B35).withOpacity(0.15);
    if (title.contains('Aman')) return const Color(0xFFFFC800).withOpacity(0.12);
    return const Color(0xFF00D4FF).withOpacity(0.12);
  }

  Color _getTagBgColor(String colorClass) {
    if (colorClass == 'purple') return const Color(0xFF7B2FFF).withOpacity(0.08);
    if (colorClass == 'orange') return const Color(0xFFFF6B35).withOpacity(0.08);
    return const Color(0xFF00D4FF).withOpacity(0.08); // primary
  }

  Color _getTagBorderColor(String colorClass) {
    if (colorClass == 'purple') return const Color(0xFF7B2FFF).withOpacity(0.2);
    if (colorClass == 'orange') return const Color(0xFFFF6B35).withOpacity(0.2);
    return const Color(0xFF00D4FF).withOpacity(0.15); // primary
  }

  Color _getTagTextColor(String colorClass) {
    if (colorClass == 'purple') return const Color(0xFFA57BFF);
    if (colorClass == 'orange') return const Color(0xFFFF8A5B);
    return AppColors.primary; // primary
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(0, isHovered ? -6 : 0, 0),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isHovered ? AppColors.primary.withOpacity(0.3) : AppColors.primary.withOpacity(0.15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 28, 28, 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: _getEmojiBgColor(widget.project.title),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Text(widget.project.emoji, style: const TextStyle(fontSize: 28)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.project.title, style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
                        const SizedBox(height: 4),
                        Text(widget.project.company, style: GoogleFonts.cairo(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primary)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            
            // Tags
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 28, 16),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.project.tags.map((tag) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getTagBgColor(tag.colorClass),
                    border: Border.all(color: _getTagBorderColor(tag.colorClass)),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(tag.title, style: GoogleFonts.cairo(fontSize: 11, fontWeight: FontWeight.w700, color: _getTagTextColor(tag.colorClass)), textDirection: TextDirection.ltr),
                )).toList(),
              ),
            ),
            
            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 28, 20),
                child: Text(
                  widget.project.description,
                  style: GoogleFonts.cairo(fontSize: 14, color: AppColors.textSecondary, height: 1.7),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            
            // Link
            if (widget.project.link.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 0, 28, 24),
                child: InkWell(
                  onTap: () => Get.find<HomeController>().launchURL(widget.project.link),
                  child: Row(
                    children: [
                      Text('عرض على Google Play', style: GoogleFonts.cairo(color: AppColors.primary, fontSize: 13, fontWeight: FontWeight.w700)),
                      const SizedBox(width: 6),
                      const Icon(Icons.arrow_back, color: AppColors.primary, size: 14), // arrow left because RTL
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
