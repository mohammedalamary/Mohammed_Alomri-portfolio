import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../data/models/project_model.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();
  
  final heroKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      Get.snackbar('خطأ', 'لا يمكن فتح الرابط $urlString');
    }
  }

  final List<ExperienceModel> experiences = [
    ExperienceModel(
      date: '2025 – الحاضر',
      role: 'مطور تطبيقات موبايل',
      company: '🏢 Aman Soft Modern – المملكة العربية السعودية',
      points: [
        'تطوير تطبيق المطاعم Aman Soft للأندرويد والـ iOS',
        'بناء تطبيقات نقاط البيع (POS) المتكاملة',
        'العمل على APIs باستخدام .NET Core',
        'تطوير إصدارات سطح المكتب بـ Flutter',
      ],
    ),
    ExperienceModel(
      date: '2024 – 2025',
      role: 'مطور تطبيقات Flutter',
      company: '🏢 Daratech Company – جدة، السعودية',
      points: [
        'تطوير تطبيق ONEX POS لنقاط البيع',
        'تطوير تطبيق Erad POS',
        'بناء نظام إدارة الموظفين والعملاء لـ Smart Pro',
        'تحسين الأداء والاستقرار للتطبيقات القائمة',
      ],
    ),
    ExperienceModel(
      date: '2023 – 2024',
      role: 'مطور تطبيقات موبايل',
      company: '🏢 Smart Pro Company – الرياض، السعودية',
      points: [
        'تطوير تطبيقات إدارة الموارد البشرية',
        'بناء حلول نقاط البيع للشركات',
        'تصميم واجهات مستخدم احترافية',
      ],
    ),
    ExperienceModel(
      date: 'قبل 2023',
      role: 'مسؤول قسم تطبيقات',
      company: '🏢 شركة تقنية – اليمن',
      points: [
        'قيادة فريق تطوير التطبيقات',
        'تطوير تطبيق بنك عدن والمحفظة الإلكترونية',
        'تطوير تطبيق محفظة المريسي للصرافة',
        'نظام إدارة الموارد البشرية لبنك عدن',
      ],
    ),
  ];

  final List<ProjectModel> projects = [
    ProjectModel(
      title: 'بنك عدن',
      company: 'Aden Bank Application',
      emoji: '🏦',
      description: 'تطبيق بنكي متكامل يتيح إدارة الحسابات والتحويلات المالية وعرض كشوف الحساب بواجهة عصرية وآمنة.',
      link: 'https://play.google.com/store/apps/details?id=com.AamalTech.Aden_Bank',
      tags: [ProjectTag('Flutter', 'primary'), ProjectTag('Banking', 'purple'), ProjectTag('Android', 'orange')],
    ),
    ProjectModel(
      title: 'محفظة المريسي',
      company: 'Al-Muraisi Exchange Wallet',
      emoji: '💳',
      description: 'تطبيق محفظة إلكترونية لشركة المريسي للصرافة، يدعم التحويلات المالية الدولية وإدارة الأرصدة.',
      link: 'https://play.google.com/store/apps/details?id=com.murisi.murisimobile',
      tags: [ProjectTag('Flutter', 'primary'), ProjectTag('FinTech', 'purple'), ProjectTag('Wallet', 'orange')],
    ),
    ProjectModel(
      title: 'Smart Pro Employee App',
      company: 'نظام إدارة الموظفين والعملاء',
      emoji: '👥',
      description: 'نظام متكامل لإدارة الموظفين والعملاء لشركات Smart Pro، يشمل الحضور والرواتب وتتبع الأداء.',
      link: 'https://play.google.com/store/apps/details?id=com.ModernSystems_smartpro.employee_app',
      tags: [ProjectTag('Flutter', 'primary'), ProjectTag('HR System', 'purple'), ProjectTag('Android', 'orange')],
    ),
    ProjectModel(
      title: 'ONEX POS',
      company: 'نقطة البيع – Daratech',
      emoji: '🧾',
      description: 'تطبيق نقطة بيع متكامل لشركة Daratech، يدعم الأندرويد والـ iOS وسطح المكتب بواجهة موحدة.',
      link: 'https://play.google.com/store/apps/details?id=com.DareTch.auditor_mobile_app',
      tags: [ProjectTag('Flutter', 'primary'), ProjectTag('POS', 'purple'), ProjectTag('Multi-Platform', 'orange')],
    ),
    ProjectModel(
      title: 'Aman Soft Restaurants',
      company: 'تطبيق إدارة المطاعم',
      emoji: '🍽️',
      description: 'حل متكامل لإدارة المطاعم يشمل نقاط البيع وإدارة الطلبات والمخزون والفواتير عبر جميع المنصات.',
      tags: [ProjectTag('Flutter', 'primary'), ProjectTag('Restaurant', 'purple'), ProjectTag('Desktop + Mobile', 'orange')],
    ),
    ProjectModel(
      title: 'Aden Cash Wallet',
      company: 'محفظة عدن كاش',
      emoji: '💱',
      description: 'تطبيق محفظة إلكترونية مرتبط ببنك عدن، يتيح دفع الفواتير والتحويل الفوري وإدارة المدفوعات.',
      tags: [ProjectTag('Flutter', 'primary'), ProjectTag('FinTech', 'purple'), ProjectTag('Wallet', 'orange')],
    ),
  ];
}
