class Testimonial {
  final String id;
  final String name;
  final String position;
  final String company;
  final String message;
  final String? imageUrl;
  final int rating;

  Testimonial({
    required this.id,
    required this.name,
    required this.position,
    required this.company,
    required this.message,
    this.imageUrl,
    required this.rating,
  });

  factory Testimonial.fromJson(Map<String, dynamic> json) {
    return Testimonial(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      position: json['position']?.toString() ?? '',
      company: json['company']?.toString() ?? '',
      message: json['message']?.toString() ?? '',
      imageUrl: json['imageurl']?.toString(),
      rating: int.tryParse(json['rating']?.toString() ?? '5') ?? 5,
    );
  }
}