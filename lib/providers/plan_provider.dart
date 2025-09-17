import 'package:flutter/foundation.dart';

class DayPlan {
  final String day; // e.g. Monday
  List<String> workouts;

  DayPlan({required this.day, required this.workouts});
}

class PlanProvider with ChangeNotifier {
  final List<DayPlan> _weeklyPlan = [
    DayPlan(day: "Monday", workouts: ["Push-ups", "Running"]),
    DayPlan(day: "Tuesday", workouts: ["Squats", "Cycling"]),
    DayPlan(day: "Wednesday", workouts: ["Plank", "Jump Rope"]),
    DayPlan(day: "Thursday", workouts: ["Lunges", "Swimming"]),
    DayPlan(day: "Friday", workouts: ["Bench Press", "Rowing"]),
    DayPlan(day: "Saturday", workouts: ["Pull-ups", "Yoga"]),
    DayPlan(day: "Sunday", workouts: ["Rest"]),
  ];

  List<DayPlan> get weeklyPlan => _weeklyPlan;

  /// Update the workouts for a specific day
  void updateDayPlan(String day, List<String> updatedWorkouts) {
    final index = _weeklyPlan.indexWhere((plan) => plan.day == day);
    if (index != -1) {
      _weeklyPlan[index].workouts = updatedWorkouts;
      notifyListeners();
    }
  }

  /// Reset all days to rest (optional helper)
  void resetPlan() {
    for (var plan in _weeklyPlan) {
      plan.workouts = ["Rest"];
    }
    notifyListeners();
  }
}
