import 'package:flutter/material.dart';

import '../models/university_model.dart';
import '../services/university_service.dart';

class UniversityProvider extends ChangeNotifier {
  final _service = UniversityService();
  bool isLoading = true;
  List<University> _universities = [];
  List<University> get universities => _universities;

  getUniversities() async {
    isLoading = true;

    // Future.delayed(const Duration(seconds: 0), () {
    //   notifyListeners();
    // });

    notifyListeners();

    _universities = await _service.getUniversities();

    isLoading = false;
    notifyListeners();
  }

  void removeUniversity(String name) {
    _universities.removeWhere((element) => element.name == name);
    notifyListeners();
  }
}
