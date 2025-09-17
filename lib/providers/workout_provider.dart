class Workout {
  final String name;
  final int duration;
  final int calories;
  final DateTime date;
  final String type; // ✅ added

  Workout({
    required this.name,
    required this.duration,
    required this.calories,
    required this.date,
    this.type = "General", // ✅ default type
  });
}
