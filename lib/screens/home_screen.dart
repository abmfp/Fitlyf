import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Calendar Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildDayCircle("Mon", "8", true),
                    _buildDayCircle("Tue", "9", false),
                    _buildDayCircle("Wed", "10", false),
                    _buildDayCircle("Thu", "11", false),
                    _buildDayCircle("Fri", "12", false),
                  ],
                ),
                const SizedBox(height: 24),

                // Greeting
                const Text(
                  "Get ready, User",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Here's your plan for Monday",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 24),

                // Workout Card
                _buildCard(
                  title: "Chest & Biceps",
                  subtitle: "1 exercise",
                  icon: Icons.arrow_forward,
                  onTap: () {},
                ),
                const SizedBox(height: 16),

                // Weight Card
                _buildCard(
                  title: "Weight for 8 Sep",
                  subtitle: "No Entry",
                  icon: Icons.add,
                  onTap: () {},
                ),
                const SizedBox(height: 16),

                // Weekly Goal Card
                _buildCard(
                  title: "Day 0 / 5",
                  subtitle: "Let's start the week strong!",
                  icon: Icons.local_fire_department,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDayCircle(String day, String date, bool isSelected) {
    return Column(
      children: [
        Text(
          day,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 6),
        CircleAvatar(
          backgroundColor: isSelected ? Colors.white : Colors.transparent,
          radius: 22,
          child: Text(
            date,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
          InkWell(
            onTap: onTap,
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.2),
              child: Icon(icon, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
