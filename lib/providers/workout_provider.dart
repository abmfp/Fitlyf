import 'package:flutter/foundation.dart';

class Workout {
  final String name;
  final String type; // e.g. Cardio, Strength, Yoga
  final int duration; // in minutes
  final DateTime date;

  Workout({
    required this.name,
    required this.type,
    required this.duration,
    required this.date,
  });
}

class WorkoutProvider with ChangeNotifier {
  final List<Workout> _workouts = [];

  List<Workout> get workouts => _workouts;

  void addWorkout(Workout workout) {
    _workouts.add(workout);
    notifyListeners();
  }

  void removeWorkout(Workout workout) {
    _workouts.remove(workout);
    notifyListeners();
  }

  /// Returns workouts filtered by date
  List<Workout> getWorkoutsByDate(DateTime date) {
    return _workouts.where((w) =>
        w.date.year == date.year &&
        w.date.month == date.month &&
        w.date.day == date.day).toList();
  }

  /// Total workout duration for progress screen
  int get totalDuration {
    return _workouts.fold(0, (sum, w) => sum + w.duration);
  }

  /// Workouts grouped by type
  Map<String, int> get workoutSummaryByType {
    final Map<String, int> summary = {};
    for (var w in _workouts) {
      summary[w.type] = (summary[w.type] ?? 0) + w.duration;
    }
    return summary;
  }
}
