import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'models/project.dart';
import 'models/team_member.dart';
import 'models/testimonial.dart';
import 'models/social_link.dart';

class HomeController extends GetxController {
  // Use your *working* Web App URL + token (same as Postman)
  static const String _baseUrl =
      'https://script.google.com/macros/s/AKfycbzux9L2TbcHLAtAXL4vUrDqdJfiKEQd6ytgwOygpNhtLYMRRfQaO9rEgW-w0aWhG6VAtQ/exec';
  static const String _token =
      'b5f8d33e99f6e14028c8e8cc0d475458a4ed6889c7aac0d84ec584b1cb085dd76bb57d77a991c1870a7a4d7bac62f51faadad0b5f5499ae50e25790303566dd3';

  final RxList<Project> projects = <Project>[].obs;
  final RxList<TeamMember> teamMembers = <TeamMember>[].obs;
  final RxList<Testimonial> testimonials = <Testimonial>[].obs;
  final RxList<SocialLink> socialLinks = <SocialLink>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool isLoadingTeams = false.obs;
  final RxBool isLoadingTestimonials = false.obs;
  final RxBool isLoadingSocial = false.obs;

  Uri _uri({Map<String, String>? qp}) {
    final params = <String, String>{
      'token': _token,
      'debug': '1',          // keep while debugging (remove later if you want)
      ...?qp,
      // cache-buster so you always see fresh content during dev:
      'cb': DateTime.now().millisecondsSinceEpoch.toString(),
    };
    return Uri.parse(_baseUrl).replace(queryParameters: params);
  }

  Future<Map<String, dynamic>> _decode(http.Response r) async {
    // Log everything helpful
    // ignore: avoid_print
    print('HTTP ${r.statusCode} ${r.request?.url}');
    // ignore: avoid_print
    print('RAW: ${r.body.substring(0, r.body.length > 800 ? 800 : r.body.length)}');

    Map<String, dynamic> data;
    try {
      data = json.decode(r.body) as Map<String, dynamic>;
    } catch (_) {
      throw Exception('Non-JSON response (are you hitting the latest /exec URL?):\n${r.body}');
    }

    if (data['ok'] != true) {
      final msg = data['error'] ?? 'Unknown API error';
      throw Exception('API error: $msg');
    }
    return data;
  }

  @override
  void onInit() {
    super.onInit();
    fetchProjects();
    fetchTeamMembers();
    fetchTestimonials();
    fetchSocialLinks();
  }

  /// Optional: quick backend sanity check (matches Postman /health)
  Future<void> health() async {
    try {
      final r = await http.get(_uri(qp: {'action': 'health'}));
      final data = await _decode(r);
      // ignore: avoid_print
      print('Health: ${data['health']}');
    } catch (e) {
      // ignore: avoid_print
      print('Health check failed: $e');
    }
  }

  Future<void> fetchProjects({String? q}) async {
    try {
      isLoading.value = true;
      final r = await http.get(_uri(qp: {if (q != null && q.isNotEmpty) 'q': q}));
      final data = await _decode(r);
      final list = (data['data'] as List).cast<Map<String, dynamic>>();
      projects.assignAll(list.map(Project.fromJson));
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching projects: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchTeamMembers() async {
    try {
      isLoadingTeams.value = true;
      final r = await http.get(_uri(qp: {'sheet': 'Teams'}));
      final data = await _decode(r);
      final list = (data['data'] as List).cast<Map<String, dynamic>>();
      teamMembers.assignAll(list.map(TeamMember.fromJson));
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching team members: $e');
    } finally {
      isLoadingTeams.value = false;
    }
  }

  Future<void> fetchTestimonials() async {
    try {
      isLoadingTestimonials.value = true;
      final r = await http.get(_uri(qp: {'sheet': 'Testimonials'}));
      final data = await _decode(r);
      final list = (data['data'] as List).cast<Map<String, dynamic>>();
      testimonials.assignAll(list.map(Testimonial.fromJson));
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching testimonials: $e');
    } finally {
      isLoadingTestimonials.value = false;
    }
  }

  Future<void> fetchSocialLinks() async {
    try {
      isLoadingSocial.value = true;
      final r = await http.get(_uri(qp: {'sheet': 'Social'}));
      final data = await _decode(r);
      final list = (data['data'] as List).cast<Map<String, dynamic>>();
      socialLinks.assignAll(list.map(SocialLink.fromJson));
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching social links: $e');
    } finally {
      isLoadingSocial.value = false;
    }
  }

  // If you later want create/update/delete from Flutter (POST),
  // remember: on Flutter **web** `application/json` triggers CORS preflight.
  // Mobile/desktop are fine. If you target web, ask me—I'll give a no-preflight variant.
  Future<void> createProject(Project p) async {
    final body = {
      'token': _token,
      'action': 'create',
      'item': {
        'name': p.name,
        'link': p.url,
        'imageurl': p.imageUrl,
        'techused': p.techused.join(','),
        'date': p.date,
      },
      'debug': '1',
    };

    try {
      final r = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );
      await _decode(r);
      await fetchProjects();
    } catch (e) {
      // ignore: avoid_print
      print('Create failed: $e');
    }
  }

  Future<void> updateProject(Project p) async {
    final body = {
      'token': _token,
      'action': 'update',
      'id': p.id,
      'item': {
        'name': p.name,
        'link': p.url,
        'imageurl': p.imageUrl,
        'techused': p.techused.join(','),
        'date': p.date,
      },
      'debug': '1',
    };

    try {
      final r = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );
      await _decode(r);
      await fetchProjects();
    } catch (e) {
      // ignore: avoid_print
      print('Update failed: $e');
    }
  }

  Future<void> deleteProject(String id) async {
    final body = {
      'token': _token,
      'action': 'delete',
      'id': id,
      'debug': '1',
    };

    try {
      final r = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );
      await _decode(r);
      await fetchProjects();
    } catch (e) {
      // ignore: avoid_print
      print('Delete failed: $e');
    }
  }
}
