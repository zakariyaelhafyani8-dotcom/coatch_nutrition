import 'dart:ui';
import 'package:coach_nutrition/Workout/MyPlanWorkout.dart';
import 'package:flutter/material.dart';
import 'package:coach_nutrition/MyWorkout/MyPlan.dart';
import 'package:provider/provider.dart';

class BackPage extends StatelessWidget {
  final List<Map<String, dynamic>> foods = [
    {
      "name": "Pull-Up",
      "image": "assets/images/Pull-up.gif",
      "description":
      "The pull-up is a foundational bodyweight compound exercise that targets the back, arms, and core.",
    },
    {
      "name": "Lat Pulldown",
      "image": "assets/images/Lat-Pulldown.gif",
      "description":
      "The lat pulldown is a pulling exercise that targets the latissimus dorsi muscles.",
    },
    {
      "name": "Barbell Bent Over Row",
      "image": "assets/images/Barbell-Bent-Over-Row.gif",
      "description":
      "A compound exercise targeting the upper back, lats, traps, and biceps.",
    },
    {
      "name": "Seated Cable Row",
      "image": "assets/images/Seated-Cable-Row.gif",
      "description":
      "A cable exercise that targets the upper back and lats.",
    },
    {
      "name": "Lever T-Bar Row",
      "image": "assets/images/Lever-T-bar-Row.gif",
      "description":
      "A rowing movement that targets the entire back chain for strength.",
    },
    {
      "name": "Dumbbell Row",
      "image": "assets/images/Dumbbell-Row.gif",
      "description":
      "A unilateral movement that enhances back thickness and posture.",
    },
    {
      "name": "Seated Row Machine",
      "image": "assets/images/Seated-Row-Machine.gif",
      "description":
      "A beginner-friendly back exercise using the row machine.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final myPlanProvider = Provider.of<MyPlanProvider>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orangeAccent,
        icon: Icon(Icons.list),
        label: Text("My Plan"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => MyPlanWorkout()),
          );
        },
      ),
      appBar: AppBar(
        title: Text("Back Exercises",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Color(0xFF050B38),
      ),
      body: Container(
        color: Color(0xFF050B38),
        child: GridView.builder(
          padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 4,
          ),
          itemCount: foods.length,
          itemBuilder: (context, index) {
            final item = foods[index];

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10)],
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
                          color: Colors.black87,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("4 Sets × 8 Reps", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Open bottom sheet
                      ElevatedButton.icon(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return DraggableScrollableSheet(
                                expand: false,
                                builder: (context, controller) {
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
                                              style: TextStyle(fontSize: 22),
                                            ),
                                            IconButton(
                                              onPressed: () => Navigator.pop(context),
                                              icon: Icon(Icons.close),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Image.asset(item["image"]),
                                        SizedBox(height: 10),
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
                                        SizedBox(height: 20),
                                        ElevatedButton.icon(
                                          icon: Icon(Icons.add),
                                          label: Text("Add to My Plan"),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orangeAccent,
                                            foregroundColor: Colors.white,
                                            padding: EdgeInsets.symmetric(vertical: 14),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10)),
                                          ),
                                          onPressed: () {
                                            myPlanProvider.addExercise(item);
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content:
                                                Text("${item["name"]} added to My Plan"),
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
                        label: Text(
                          "Info",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
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
