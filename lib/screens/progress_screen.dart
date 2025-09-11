import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/glass_card.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1B1C30), Color(0xFF0F0F1F)],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(16, 56, 16, 16),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Progress',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: const [
                  GlassCard(child: _WeeklyChart()),
                  SizedBox(height: 18),
                  GlassCard(child: _StatsSummary()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _WeeklyChart extends StatelessWidget {
  const _WeeklyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                getTitlesWidget: (value, meta) {
                  const labels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                  return Text(
                    labels[value.toInt() % 7],
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 3),
                FlSpot(1, 4.5),
                FlSpot(2, 3.8),
                FlSpot(3, 5),
                FlSpot(4, 4.2),
                FlSpot(5, 6),
                FlSpot(6, 5.5),
              ],
              isCurved: true,
              color: Colors.purpleAccent,
              barWidth: 4,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsSummary extends StatelessWidget {
  const _StatsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('This Week',
            style: TextStyle(
                color: Colors.white70, fontWeight: FontWeight.w600)),
        SizedBox(height: 8),
        Text('Total Workouts: 4',
            style: TextStyle(color: Colors.white, fontSize: 16)),
        SizedBox(height: 4),
        Text('Calories Burned: 1800 kcal',
            style: TextStyle(color: Colors.white, fontSize: 16)),
        SizedBox(height: 4),
        Text('Active Time: 4h 30m',
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ],
    );
  }
}
