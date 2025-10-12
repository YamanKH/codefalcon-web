class Service {
  final String id;
  final String name;
  final String description;
  final String? iconUrl;
  final String? imageUrl;

  Service({
    required this.id,
    required this.name,
    required this.description,
    this.iconUrl,
    this.imageUrl,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['techused']?.toString() ?? '',
      iconUrl: json['link']?.toString(),
      imageUrl: json['imageurl']?.toString(),
    );
  }
}