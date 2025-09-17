import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/workout_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _duration = 0;
  int _calories = 0;

  void _saveWorkout() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final workout = Workout(
        name: _name,
        duration: _duration,
        calories: _calories,
        date: DateTime.now(),
      );

      Provider.of<WorkoutProvider>(context, listen: false)
          .addWorkout(workout);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Workout logged!")),
      );

      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Log Workout")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Workout Name"),
                validator: (value) =>
                    value!.isEmpty ? "Enter a workout name" : null,
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: "Duration (minutes)"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "Enter duration" : null,
                onSaved: (value) => _duration = int.parse(value!),
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: "Calories Burned"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? "Enter calories" : null,
                onSaved: (value) => _calories = int.parse(value!),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveWorkout,
                child: const Text("Save Workout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
