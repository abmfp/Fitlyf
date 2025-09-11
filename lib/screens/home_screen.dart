import 'package:flutter/material.dart';
import '../widgets/glass_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0F1022), Color(0xFF0B243B)],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 56, 16, 16),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Good Morning,',
                        style: TextStyle(fontSize: 14, color: Colors.white70)),
                    SizedBox(height: 4),
                    Text('Alex',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            const GlassCard(child: _SearchAndSummary()),
            const SizedBox(height: 18),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: const [
                  _QuickActions(),
                  SizedBox(height: 14),
                  _TodayStatsCard(),
                  SizedBox(height: 10),
                  _WorkoutPreviewCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SearchAndSummary extends StatelessWidget {
  const _SearchAndSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.02),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: const [
              Icon(Icons.search, size: 20, color: Colors.white70),
              SizedBox(width: 8),
              Expanded(
                  child: Text('Search exercises, plans...',
                      style: TextStyle(color: Colors.white70))),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Text('Weekly summary',
            style: TextStyle(
                color: Colors.white70, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('4 workouts',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text('12h 30m active',
                      style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            const _MiniProgressCircle(percent: 0.72),
          ],
        )
      ],
    );
  }
}

class _MiniProgressCircle extends StatelessWidget {
  final double percent;
  const _MiniProgressCircle({required this.percent, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
              value: percent,
              strokeWidth: 6,
              backgroundColor: Colors.white12),
          Text('${(percent * 100).round()}%',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  const _QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: GlassCard(
                child: _ActionTile(
                    icon: Icons.play_arrow_rounded, label: 'Start'))),
        const SizedBox(width: 12),
        Expanded(
            child: GlassCard(
                child: _ActionTile(
                    icon: Icons.restaurant_menu_rounded, label: 'Nutrition'))),
        const SizedBox(width: 12),
        Expanded(
            child: GlassCard(
                child: _ActionTile(
                    icon: Icons.bolt, label: 'Challenges'))),
      ],
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ActionTile({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 28, color: Colors.purpleAccent),
        const SizedBox(height: 8),
        Text(label,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _TodayStatsCard extends StatelessWidget {
  const _TodayStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Today', style: TextStyle(color: Colors.white70)),
          SizedBox(height: 8),
          Text('Steps: 6,421', style: TextStyle(color: Colors.white)),
          SizedBox(height: 6),
          Text('Calories: 420 kcal', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class _WorkoutPreviewCard extends StatelessWidget {
  const _WorkoutPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white10),
            child: const Icon(Icons.fitness_center, size: 36),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Full Body Strength',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text('35 min • Intermediate',
                    style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.white70)
        ],
      ),
    );
  }
}
