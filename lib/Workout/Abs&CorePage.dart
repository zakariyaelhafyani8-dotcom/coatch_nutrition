import 'dart:ui';
import 'package:coach_nutrition/Workout/MyPlanWorkout.dart';
import 'package:flutter/material.dart';

import 'package:coach_nutrition/MyWorkout/MyPlan.dart';
import 'package:provider/provider.dart';

class AbsCorePage extends StatefulWidget {
  @override
  State<AbsCorePage> createState() => _AbsCorePageState();
}

class _AbsCorePageState extends State<AbsCorePage> {

  // ⭐ This list stores exercises added to the plan
  List<Map<String, dynamic>> myPlan = [];

  final List<Map<String, dynamic>> foods = [
    {
      "name": "Body Saw Plank",
      "image": "assets/images/body-saw-plank.gif",
      "description": "Dynamic core exercise performed from a forearm plank position...",
    },
    {
      "name": "Dragon Flag",
      "image": "assets/images/Leg-Raise-Dragon-Flag.gif",
      "description": "Challenging exercise that develops core control and strength...",
    },
    {
      "name": "Cross Crunch",
      "image": "assets/images/Cross-Crunch.gif",
      "description": "Targets obliques and rectus abdominis...",
    },
    {
      "name": "Standing Cable Crunch",
      "image": "assets/images/Standing-Cable-Crunch.gif",
      "description": "Uses cable resistance to work abdominal muscles...",
    },
    {
      "name": "Seated Bench Pull-in",
      "image": "assets/images/Seated-Bench-Leg-Pull-in.gif",
      "description": "Targets lower abs while seated on a bench...",
    },
    {
      "name": "Crunches",
      "image": "assets/images/Crunch.gif",
      "description": "Basic core exercise to strengthen abdominal muscles...",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF050B38),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MyPlanWorkout(),
            ),
          );
        },
        icon: Icon(Icons.list),
        label: Text("My Plan"),
      ),

      appBar: AppBar(
        backgroundColor: Color(0xFF050B38),
        elevation: 0,
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            "Abs / Core",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),

      body: GridView.builder(
        padding: EdgeInsets.all(20),
        itemCount: foods.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 16,
          childAspectRatio: 4,
        ),

        itemBuilder: (context, index) {
          final item = foods[index];

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.orangeAccent, blurRadius: 6)],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(item["image"], height: 80, width: 80),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(item["name"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(height: 4),
                    Text("4 Sets × 8 Reps", style: TextStyle(color: Colors.grey)),
                  ],
                ),


                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                  ),
                  icon: Icon(Icons.info, color: Colors.white, size: 18),
                  label: Text("Info", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) {
                        return DraggableScrollableSheet(
                          expand: false,
                          builder: (_, controller) {
                            return Container(
                              padding: EdgeInsets.all(20),
                              child: ListView(
                                controller: controller,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(item["name"], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                      IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Image.asset(item["image"]),
                                  SizedBox(height: 20),
                                  Text("Overview", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 8),
                                  Text(item["description"], style: TextStyle(fontSize: 16)),
                                  SizedBox(height: 20),


                                  ElevatedButton.icon(
                                    icon: Icon(Icons.add),
                                    label: Text("Add to My Plan"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orangeAccent,
                                      foregroundColor: Colors.white,
                                      padding: EdgeInsets.symmetric(vertical: 14),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        myPlan.add(item);Provider.of<MyPlanProvider>(context, listen: false).addExercise(item);
                                      });
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("${item["name"]} Added to Plan"), duration: Duration(seconds: 2)),
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


