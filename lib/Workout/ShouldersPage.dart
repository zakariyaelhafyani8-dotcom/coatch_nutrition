import 'dart:ui';
import 'package:coach_nutrition/MyWorkout/MyPlanPage.dart';
import 'package:coach_nutrition/Workout/MyPlanWorkout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coach_nutrition/MyWorkout/MyPlan.dart';

class ShouldersPage extends StatelessWidget {
  final List<Map<String, dynamic>> exercices = [
    {
      "name": "Seated Barbell Press",
      "image": "assets/images/Barbell-Shoulder-Press.gif",
      "description":
          "The seated barbell shoulder press is a compound exercise targeting the shoulders, triceps, and upper body.",
    },
    {
      "name": "Cable Lateral Raise",
      "image": "assets/images/Cable-Lateral-Raise.gif",
      "description":
          "Targets the lateral deltoids using controlled cable resistance. Great for shoulder width.",
    },
    {
      "name": "Lever Shoulder Press",
      "image": "assets/images/Lever-Shoulder-Press.gif",
      "description":
          "Machine press focusing on deltoid strength with stable guided movement.",
    },
    {
      "name": "Dumbbell Lateral Raise",
      "image": "assets/images/Dumbbell-Lateral-Raise.gif",
      "description":
          "Builds round shoulders by targeting the side delts. Essential bodybuilding exercise.",
    },
    {
      "name": "Dumbbell Press",
      "image": "assets/images/Dumbbell-Shoulder-Press.gif",
      "description":
          "Overhead dumbbell press that strengthens front delts and triceps. Can be done seated or standing.",
    },
    {
      "name": "Rear Delt Fly Machine",
      "image": "assets/images/Rear-Delt-Machine-Flys.gif",
      "description":
          "Isolation exercise for rear delts and upper back to fix posture and shoulder balance.",
    },
    {
      "name": "Cable Row Rope",
      "image": "assets/images/Half-Kneeling-High-Cable-Row-Rope.gif",
      "description":
          "Posture correction exercise targeting rear delts, rhomboids, and mid traps.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final myPlanProvider = Provider.of<MyPlanProvider>(context);
    List<Map<String, dynamic>> myPlan = [];

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orangeAccent,
        icon: Icon(Icons.list, color: Colors.white),
        label: Text('My Plan'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => MyPlanWorkout()),
          );
        },
      ),

      appBar: AppBar(
        title: Text("Shoulders",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Color(0xFF050B38),
      ),

      body: Container(
        color: Color(0xFF050B38),
        child: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: exercices.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 16,
            childAspectRatio: 4,
          ),
          itemBuilder: (context, index) {
            final item = exercices[index];

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
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "4 Sets × 8 Reps",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            builder: (_) => DraggableScrollableSheet(
                              expand: false,
                              builder: (_, controller) => Padding(
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
                                          onPressed: () => Navigator.pop(context),
                                          icon: Icon(Icons.close),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Image.asset(item["image"], height: 200),
                                    SizedBox(height: 20),
                                    Text(
                                      "Overview",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
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
                                        padding: EdgeInsets.symmetric(
                                          vertical: 14,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {
                                        myPlanProvider.addExercise(item);
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
                              ),
                            ),
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
