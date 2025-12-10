import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MyPlanProvider with ChangeNotifier {
  List<Map<String, dynamic>> _myPlan = [];

  List<Map<String, dynamic>> get myPlan => _myPlan;

  MyPlanProvider() {
    loadPlan();
  }

  void addExercise(Map<String, dynamic> exercise) {
    if (!_myPlan.any((e) => e['name'] == exercise['name'])) {
      _myPlan.add(exercise);
      savePlan();
      notifyListeners();
    }
  }

  void removeExercise(String name) {
    _myPlan.removeWhere((e) => e['name'] == name);
    savePlan();
    notifyListeners();
  }

  void savePlan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('my_plan', jsonEncode(_myPlan));
  }

  void loadPlan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('my_plan');
    if (data != null) {
      _myPlan = List<Map<String, dynamic>>.from(jsonDecode(data));
      notifyListeners();
    }
  }
}
