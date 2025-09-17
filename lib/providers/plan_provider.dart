import 'package:flutter/material.dart';

class PlanProvider with ChangeNotifier {
  Map<String, String> _weeklyPlan = {
    "Monday": "Chest",
    "Tuesday": "Back",
    "Wednesday": "Legs",
    "Thursday": "Shoulders",
    "Friday": "Arms",
    "Saturday": "Cardio",
    "Sunday": "Rest",
  };

  Map<String, String> get weeklyPlan => _weeklyPlan;

  void updateDayPlan(String day, String workout) {
    _weeklyPlan[day] = workout;
    notifyListeners();
  }
}
