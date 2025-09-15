import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800))
          ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _animatedGoalCard(String text, int index) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: _controller, curve: Interval(0.2 * index, 1)),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.2),
          end: Offset.zero,
        ).animate(
            CurvedAnimation(parent: _controller, curve: Interval(0.2 * index, 1))),
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(text,
              style: const TextStyle(color: Colors.white70, fontSize: 16)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0D0D0D), Color(0xFF1E1E2E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("FitLyf",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
              const SizedBox(height: 10),
              Text("Welcome back, champ 👊",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[400],
                      )),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _quickAction(Icons.fitness_center, "Workouts"),
                  _quickAction(Icons.local_fire_department, "Calories"),
                  _quickAction(Icons.timer, "Tracker"),
                ],
              ),
              const SizedBox(height: 30),

              Text("Today’s Goals",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              const SizedBox(height: 15),

              _animatedGoalCard("🏋️  Complete 3 sets of Pushups", 1),
              _animatedGoalCard("🔥 Burn 500 kcal", 2),
              _animatedGoalCard("🚶 Walk 10,000 steps", 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _quickAction(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0xFF9B5DE5),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
