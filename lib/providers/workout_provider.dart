import 'package:flutter/material.dart';

class Workout {
  final String name;
  final int duration; // in minutes
  final DateTime date;
  final int calories;

  Workout({
    required this.name,
    required this.duration,
    required this.date,
    required this.calories,
  });
}

class WorkoutProvider with ChangeNotifier {
  final List<Workout> _workouts = [];

  List<Workout> get workouts => _workouts;

  void addWorkout(Workout workout) {
    _workouts.add(workout);
    notifyListeners();
  }

  void clearWorkouts() {
    _workouts.clear();
    notifyListeners();
  }
}
