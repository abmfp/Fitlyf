import 'package:flutter/material.dart';
import '../widgets/glass_card.dart';

class WeeklyPlanScreen extends StatelessWidget {
  const WeeklyPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF102030), Color(0xFF0D0D1F)],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 56, 16, 16),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Weekly Plan',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: const [
                  _DayPlan(day: 'Monday', workout: 'Cardio + Core'),
                  SizedBox(height: 12),
                  _DayPlan(day: 'Tuesday', workout: 'Upper Body Strength'),
                  SizedBox(height: 12),
                  _DayPlan(day: 'Wednesday', workout: 'Yoga + Flexibility'),
                  SizedBox(height: 12),
                  _DayPlan(day: 'Thursday', workout: 'Lower Body Strength'),
                  SizedBox(height: 12),
                  _DayPlan(day: 'Friday', workout: 'HIIT 20 min'),
                  SizedBox(height: 12),
                  _DayPlan(day: 'Saturday', workout: 'Outdoor Run'),
                  SizedBox(height: 12),
                  _DayPlan(day: 'Sunday', workout: 'Rest & Recovery'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DayPlan extends StatelessWidget {
  final String day;
  final String workout;
  const _DayPlan({required this.day, required this.workout, super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        children: [
          const Icon(Icons.calendar_today, color: Colors.purpleAccent, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(day,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(workout, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.white70),
        ],
      ),
    );
  }
}
