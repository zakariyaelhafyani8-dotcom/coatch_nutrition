import 'dart:ui';
import 'package:coach_nutrition/Workout/MyPlanWorkout.dart';
import 'package:flutter/material.dart';
import 'package:coach_nutrition/MyWorkout/MyPlanPage.dart';
import 'package:coach_nutrition/MyWorkout/MyPlan.dart';
import 'package:provider/provider.dart';

class LegsPage extends StatefulWidget {
  @override
  State<LegsPage> createState() => _LegsPageState();
}

class _LegsPageState extends State<LegsPage> {
  List<Map<String, dynamic>> myPlan = [];

  final List<Map<String, dynamic>> Exercises = [
    {
      "name": "Smith Machine Squat",
      "image": "assets/images/smith-machine-squat.gif",
      "description":
          "The Smith Machine Squat is a squat variation performed inside a Smith machine...",
    },
    {
      "name": "Dumbbell Goblet Squat",
      "image": "assets/images/Dumbbell-Goblet-Squat.gif",
      "description": "The goblet squat is an effective lower body exercise...",
    },
    {
      "name": "Pendulum Lunge",
      "image": "assets/images/pendulum-lunge.gif",
      "description": "The pendulum lunge is a dynamic lower-body exercise...",
    },
    {
      "name": "Dmbel Walking Lunge",
      "image": "assets/images/dumbbell-lunges.gif",
      "description": "Walking lunges strengthen the entire legs...",
    },
    {
      "name": "Barbell Squat",
      "image": "assets/images/BARBELL-SQUAT.gif",
      "description": "The barbell squat is a strength training exercise...",
    },
    {
      "name": "Leg Press",
      "image": "assets/images/Leg-Press.gif",
      "description": "The leg press strengthens your quadriceps...",
    },
    {
      "name": "Leg Curl",
      "image": "assets/images/Leg-Curl.gif",
      "description": "Leg curls target the hamstrings...",
    },
    {
      "name": "Leg Extension",
      "image": "assets/images/LEG-EXTENSION.gif",
      "description": "Leg extensions isolate the quadriceps...",
    },
    {
      "name": "Deadlift",
      "image": "assets/images/Barbell-Deadlift.gif",
      "description": "The deadlift works multiple muscle groups...",
    },
    {
      "name": "Hack Squats Machine",
      "image": "assets/images/Sled-Hack-Squat.gif",
      "description": "The hack squat machine strengthens the lower body...",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => MyPlanWorkout()),
          );
        },
        icon: Icon(Icons.list),
        label: Text("My Plan"),
      ),

      appBar: AppBar(
        title: Text(
          "Legs Exercices",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF050B38),
      ),

      body: Container(
        color: Color(0xFF050B38),
        child: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: Exercises.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 4,
            mainAxisSpacing: 16,
          ),

          itemBuilder: (context, index) {
            final item = Exercises[index];

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black54)],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(item["image"], height: 80, width: 80),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item["name"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "4 Sets × 8 Reps",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  ElevatedButton.icon(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return DraggableScrollableSheet(
                            expand: false,
                            builder: (_, controller) {
                              return Container(
                                padding: EdgeInsets.all(20),
                                child: ListView(
                                  controller: controller,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          item["name"],
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 20),
                                    Image.asset(item["image"]),
                                    SizedBox(height: 20),

                                    Text(
                                      "Overview",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      item["description"],
                                      style: TextStyle(fontSize: 16),
                                    ),

                                    SizedBox(height: 30),

                                    ElevatedButton.icon(
                                      icon: Icon(Icons.add),
                                      label: Text("Add to My Plan"),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orangeAccent,
                                        foregroundColor: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                          vertical: 14,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          myPlan.add(item);
                                          Provider.of<MyPlanProvider>(
                                            context,
                                            listen: false,
                                          ).addExercise(item);
                                        });

                                        Navigator.pop(context);

                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              "${item["name"]} Added to Plan",
                                            ),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                    ),
                    icon: Icon(Icons.info, color: Colors.white, size: 18),
                    label: Text("Info", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
