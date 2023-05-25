import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/university_model.dart';

class UniversityService {
  Future<List<University>> getUniversities() async {
    const url = 'http://universities.hipolabs.com/search?country=United+States';
    final uri = Uri.parse(url);

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        final universities = json.map((e) {
          return University(
            country: e['country'],
            name: e['name'],
            webPages: e['web_pages'],
          );
        }).toList();
        return universities;
      }
    } catch (e) {
      print(e);
    }

    return [];
  }
}
