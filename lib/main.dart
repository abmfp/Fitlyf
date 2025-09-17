import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/workout_provider.dart';
import 'providers/plan_provider.dart';
import 'screens/home_screen.dart';
import 'screens/progress_screen.dart';
import 'screens/plan_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WorkoutProvider()),
        ChangeNotifierProvider(create: (_) => PlanProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
