class Project {
  final String id;
  final String name;
  final String description;     // <- mapped from techused for now
  final List<String> techused;  // list of technologies
  final String? url;            // <- mapped from link
  final String? imageUrl;       // <- mapped from imageurl
  final String updatedAt;
  final String? date;           // optional, from date if you want to display it

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.techused,
    this.url,
    this.imageUrl,
    required this.updatedAt,
    this.date,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    final link = json['link']?.toString();
    final img  = json['imageurl']?.toString();
    final techStr = json['techused']?.toString() ?? '';
    final tech = techStr.isNotEmpty ? techStr.split(',').map((e) => e.trim()).toList() : <String>[];

    return Project(
      id: (json['id'] ?? '').toString(),
      name: (json['name'] ?? '').toString(),
      description: (json['description'] ?? techStr).toString(), // prefer 'description' if you add it later; else techused joined
      techused: tech,
      url: (json['url'] ?? link)?.toString(),                // prefer 'url' if ever added; else link
      imageUrl: (json['imageurl'] ?? img)?.toString(),
      updatedAt: (json['updated_at'] ?? '').toString(),
      date: json['date']?.toString(),
    );
  }
}
