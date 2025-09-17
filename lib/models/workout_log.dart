class WorkoutLog {
  final DateTime date;
  final String muscleGroup;
  final List<String> exercises;
  final bool completed;

  WorkoutLog({
    required this.date,
    required this.muscleGroup,
    required this.exercises,
    required this.completed,
  });
}
