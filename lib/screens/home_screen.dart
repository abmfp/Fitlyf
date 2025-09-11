import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'FitLyf',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.purpleAccent.withOpacity(0.2),
              child: const Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Welcome to FitLyf!",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
