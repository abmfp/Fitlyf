import 'package:flutter/material.dart';
import '../widgets/glass_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF181824), Color(0xFF0E0E1A)],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 56, 16, 16),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            const SizedBox(height: 12),
            const Text('Alex Johnson',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text('Fitness Enthusiast',
                style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: const [
                  _ProfileOption(
                      icon: Icons.settings, label: 'Settings'),
                  SizedBox(height: 12),
                  _ProfileOption(
                      icon: Icons.bar_chart, label: 'Achievements'),
                  SizedBox(height: 12),
                  _ProfileOption(
                      icon: Icons.help_outline, label: 'Help & Support'),
                  SizedBox(height: 12),
                  _ProfileOption(
                      icon: Icons.logout, label: 'Logout'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ProfileOption({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        children: [
          Icon(icon, color: Colors.purpleAccent, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Text(label,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          ),
          const Icon(Icons.chevron_right, color: Colors.white70),
        ],
      ),
    );
  }
}
