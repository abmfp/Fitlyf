import 'package:flutter/material.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  final List<Map<String, String>> weeklyPlan = const [
    {"day": "Monday", "workout": "Chest & Biceps"},
    {"day": "Tuesday", "workout": "Back & Triceps"},
    {"day": "Wednesday", "workout": "Legs & Shoulders"},
    {"day": "Thursday", "workout": "Rest"},
    {"day": "Friday", "workout": "Chest & Back"},
    {"day": "Saturday", "workout": "Cardio & Abs"},
    {"day": "Sunday", "workout": "Active Rest"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6A1B9A),
              Color(0xFF4A148C),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  "Weekly Plan",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // Plan List
                Expanded(
                  child: ListView.builder(
                    itemCount: weeklyPlan.length,
                    itemBuilder: (context, index) {
                      final dayPlan = weeklyPlan[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 14),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Day + Workout
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dayPlan["day"]!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  dayPlan["workout"]!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                            // Edit Button
                            IconButton(
                              icon: const Icon(Icons.edit,
                                  color: Colors.white70),
                              onPressed: () {
                                // TODO: Implement edit functionality
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
