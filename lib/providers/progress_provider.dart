import 'package:flutter/material.dart';
import '../models/workout_log.dart';
import '../models/weight_entry.dart';

class ProgressProvider with ChangeNotifier {
  final List<WorkoutLog> _logs = [];
  final List<WeightEntry> _weights = [];

  List<WorkoutLog> get logs => _logs;
  List<WeightEntry> get weights => _weights;

  void addWorkout(WorkoutLog log) {
    _logs.add(log);
    notifyListeners();
  }

  void addWeight(WeightEntry entry) {
    _weights.add(entry);
    notifyListeners();
  }
}
