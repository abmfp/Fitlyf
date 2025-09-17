import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/workout_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final workoutProvider = Provider.of<WorkoutProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/profile.png"),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("John Doe",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                      Text("Fitness Enthusiast",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white70,
                                  )),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 30),

              // Workout Stats
              Text("Your Stats",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _statCard("Workouts", "${workoutProvider.workouts.length}"),
                  _statCard("Calories", "1200"), // placeholder
                  _statCard("Streak", "5 days"), // placeholder
                ],
              ),

              const SizedBox(height: 30),

              // Recent Workouts
              Text("Recent Workouts",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
              const SizedBox(height: 12),

              if (workoutProvider.workouts.isEmpty)
                const Text("No workouts logged yet.",
                    style: TextStyle(color: Colors.white70))
              else
                Column(
                  children: workoutProvider.workouts
                      .take(5)
                      .map((w) => Card(
                            color: Colors.white.withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: ListTile(
                              title: Text(w.name,
                                  style: const TextStyle(color: Colors.white)),
                              subtitle: Text(
                                  "${w.type} • ${w.duration} min",
                                  style: const TextStyle(color: Colors.white70)),
                            ),
                          ))
                      .toList(),
                ),

              const SizedBox(height: 30),

              // Settings
              Text("Settings",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
              const SizedBox(height: 12),

              Card(
                color: Colors.white.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    _settingsTile(Icons.person, "Edit Profile", () {}),
                    _settingsTile(Icons.dark_mode, "Dark Mode", () {}),
                    _settingsTile(Icons.logout, "Logout", () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statCard(String title, String value) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _settingsTile(IconData icon, String text, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.purpleAccent),
      title: Text(text, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.arrow_forward_ios,
          size: 16, color: Colors.white70),
      onTap: onTap,
    );
  }
}
