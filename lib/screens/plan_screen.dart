import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/plan_provider.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final planProvider = Provider.of<PlanProvider>(context);
    final plan = planProvider.weeklyPlan;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Weekly Plan",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: plan.length,
                  itemBuilder: (context, index) {
                    final day = plan.keys.elementAt(index);
                    final workouts = plan[day]!;

                    return Card(
                      color: Colors.white.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        title: Text(
                          day,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        subtitle: Text(
                          workouts.isEmpty
                              ? "No workout assigned"
                              : workouts.join(", "),
                          style: const TextStyle(color: Colors.white70),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            _editWorkouts(context, planProvider, day, workouts);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _editWorkouts(
      BuildContext context, PlanProvider provider, String day, List<String> workouts) {
    final controller =
        TextEditingController(text: workouts.join(", ")); // comma separated

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text("Edit $day",
              style: const TextStyle(color: Colors.white)),
          content: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "Enter workouts separated by commas",
              hintStyle: TextStyle(color: Colors.white54),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white38)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purpleAccent)),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                final updated = controller.text
                    .split(",")
                    .map((e) => e.trim())
                    .where((e) => e.isNotEmpty)
                    .toList();
                provider.updateDayPlan(day, updated);
                Navigator.pop(context);
              },
              child:
                  const Text("Save", style: TextStyle(color: Colors.purpleAccent)),
            ),
          ],
        );
      },
    );
  }
}
