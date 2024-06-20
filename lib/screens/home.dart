import 'package:fitness_time/models/activity.dart';
import 'package:fitness_time/styles/app_styles.dart';
import 'package:fitness_time/widgets/activity_card.dart';
import 'package:flutter/material.dart';

import 'new_activity.dart';

List<Activity> activities = [];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fitness Time"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Actividades",
              style: AppStyles.bigTitle,
            ),
            if (activities.isEmpty)
              const Padding(
                padding: EdgeInsets.all(80.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.run_circle_outlined,
                      size: 120,
                      color: Colors.black45,
                    ),
                    Text(
                      "No hay actividades. Pulsa + per añadir una.",
                      style: AppStyles.subtitle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            for (var activity in activities)
              Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  activities.remove(activity);
                },
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const Icon(Icons.delete),
                                title: const Text("Eliminar actividad"),
                                onTap: () {
                                  activities.remove(activity);
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        });
                  },
                  child: ActivityCard(activity: activity),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var activity = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewActivity()));
          activities.add(activity);
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
