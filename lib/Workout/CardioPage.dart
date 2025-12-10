import 'dart:ui';
import 'package:coach_nutrition/Workout/MyPlanWorkout.dart';
import 'package:flutter/material.dart';
import 'package:coach_nutrition/MyWorkout/MyPlan.dart';
import 'package:coach_nutrition/MyWorkout/MyPlanPage.dart';
import 'package:provider/provider.dart';

class CardioPage extends StatefulWidget {
  @override
  State<CardioPage> createState() => _CardioPageState();
}

class _CardioPageState extends State<CardioPage> {
  List<Map<String, dynamic>> myPlan = [];

  final List<Map<String, dynamic>> foods = [
    {
      "name": "Power Lunge",
      "image": "assets/images/power-lunge.gif",
      "description": "Power lunges are high-intensity leg exercises improving strength and agility.",
    },
    {
      "name": "Shadow Boxing",
      "image": "assets/images/shadow-boxing-workout.gif",
      "description": "Shadow boxing practices punches, footwork, and defensive moves.",
    },
    {
      "name": "Burpee Long Jump",
      "image": "assets/images/Burpee-Long-Jump.gif",
      "description": "Full-body plyometric exercise combining burpee and broad jump.",
    },
    {
      "name": "Jump Rope",
      "image": "assets/images/Skip-Jump-Rope.gif",
      "description": "Classic cardio workout improving endurance and coordination.",
    },
    {
      "name": "Rowing Machine",
      "image": "assets/images/Rowing-Machine.gif",
      "description": "Full-body cardio exercise engaging legs, core, and arms.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF050B38),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orangeAccent,
        icon: Icon(Icons.list),
        label: Text("My Plan"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MyPlanWorkout(),
            ),
          );
        },
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
            "Cardio",
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
              boxShadow: [BoxShadow(color: Colors.white60, blurRadius: 6)],
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
                                      IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.pop(context)),
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
                                        myPlan.add(item);
                                        Provider.of<MyPlanProvider>(context, listen: false).addExercise(item);
                                      });
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("${item["name"]} Added to Plan"),
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


