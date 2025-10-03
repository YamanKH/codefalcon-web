// Team Member Model
class TeamMember {
  final String id;
  final String name;
  final String role;
  final String? imageUrl;
  final Map<String, String> socialLinks;

  TeamMember({
    required this.id,
    required this.name,
    required this.role,
    this.imageUrl,
    required this.socialLinks,
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    final socialLinks = <String, String>{};
    // Parse social links from columns like 'linkedin', 'github', etc.
    if (json['linkedin'] != null && json['linkedin'].toString().isNotEmpty) {
      socialLinks['linkedin'] = json['linkedin'].toString();
    }
    if (json['github'] != null && json['github'].toString().isNotEmpty) {
      socialLinks['github'] = json['github'].toString();
    }
    if (json['twitter'] != null && json['twitter'].toString().isNotEmpty) {
      socialLinks['twitter'] = json['twitter'].toString();
    }
    // Add more social platforms as needed

    return TeamMember(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      role: json['role']?.toString() ?? '',
      imageUrl: json['imageurl']?.toString(),
      socialLinks: socialLinks,
    );
  }
}
