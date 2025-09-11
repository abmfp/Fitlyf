import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'screens/progress_screen.dart';
import 'screens/weekly_plan_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const FitLyfApp());
}

class FitLyfApp extends StatelessWidget {
  const FitLyfApp({super.key});

  @override
  Widget build(BuildContext context) {
    final base = ThemeData.dark();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitLyf',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(base.textTheme),
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    ProgressScreen(),
    WeeklyPlanScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_index],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: BottomNavigationBar(
              currentIndex: _index,
              onTap: (i) => setState(() => _index = i),
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              backgroundColor: Colors.white.withOpacity(0.06),
              selectedItemColor: Colors.purpleAccent.shade200,
              unselectedItemColor: Colors.white70,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.show_chart_rounded), label: 'Progress'),
                BottomNavigationBarItem(icon: Icon(Icons.calendar_view_week_rounded), label: 'Plan'),
                BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: 'Profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
