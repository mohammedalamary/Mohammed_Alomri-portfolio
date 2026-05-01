class ProjectModel {
  final String title;
  final String description;
  final String company;
  final String emoji;
  final String link;
  final List<ProjectTag> tags;

  ProjectModel({
    required this.title,
    required this.description,
    required this.company,
    required this.emoji,
    this.link = '',
    required this.tags,
  });
}

class ProjectTag {
  final String title;
  final String colorClass; // e.g., 'primary', 'purple', 'orange'

  ProjectTag(this.title, this.colorClass);
}

class ExperienceModel {
  final String date;
  final String role;
  final String company;
  final List<String> points;

  ExperienceModel({
    required this.date,
    required this.role,
    required this.company,
    required this.points,
  });
}
