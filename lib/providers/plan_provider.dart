import 'package:flutter/material.dart';
import '../models/weekly_plan.dart';

class PlanProvider with ChangeNotifier {
  final List<WeeklyPlan> _plan = [
    WeeklyPlan(day: "Monday", workout: "Chest & Biceps"),
    WeeklyPlan(day: "Tuesday", workout: "Back & Triceps"),
    WeeklyPlan(day: "Wednesday", workout: "Legs & Shoulders"),
    WeeklyPlan(day: "Thursday", workout: "Rest"),
    WeeklyPlan(day: "Friday", workout: "Chest & Back"),
  ];

  List<WeeklyPlan> get plan => _plan;

  void updateWorkout(String day, String newWorkout) {
    final index = _plan.indexWhere((p) => p.day == day);
    if (index != -1) {
      _plan[index].workout = newWorkout;
      notifyListeners();
    }
  }
}
