import 'package:fitness_time/models/activity.dart';
import 'package:flutter/material.dart';

class NewActivity extends StatelessWidget {
  const NewActivity({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController activityController = TextEditingController();
    TextEditingController distanceController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Nueva actividad"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: activityController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Tipo de actividad',
                ),
              ),
              TextField(
                controller: distanceController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Distancia',
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  var activityType = activityController.text;
                  var distance = distanceController.text;
                  var activity = Activity(
                    type: activityType,
                    date: DateTime.now(),
                    distance: double.tryParse(distance) ?? 0,
                  );
                  Navigator.pop(
                    context,
                    activity,
                  );
                },
                child: const Text("Añade Actividad"),
              )
            ],
          ),
        ));
  }
}
