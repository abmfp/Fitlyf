import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _workoutsCount;
  late Animation<int> _caloriesCount;
  late Animation<int> _stepsCount;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _workoutsCount = IntTween(begin: 0, end: 120).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _caloriesCount = IntTween(begin: 0, end: 35000).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _stepsCount = IntTween(begin: 0, end: 250000).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _statCard(String label, Animation<int> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text("${animation.value}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(label,
                  style: const TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0D0D0D), Color(0xFF1E1E2E)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/9919?v=4"),
              ),
              const SizedBox(height: 12),
              const Text("Abhiram Chebrolu",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text("Fitness Enthusiast 💪",
                  style: TextStyle(color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 30),

              // Stats row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: _statCard("Workouts", _workoutsCount)),
                  const SizedBox(width: 12),
                  Expanded(child: _statCard("Calories", _caloriesCount)),
                  const SizedBox(width: 12),
                  Expanded(child: _statCard("Steps", _stepsCount)),
                ],
              ),
              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About Me",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    SizedBox(height: 8),
                    Text(
                        "I’m passionate about health, fitness, and progress tracking. "
                        "This year my goal is to build consistency and hit personal records!",
                        style: TextStyle(color: Colors.white70, fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
