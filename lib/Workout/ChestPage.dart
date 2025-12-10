import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:coach_nutrition/MyWorkout/MyPlan.dart';
import 'package:provider/provider.dart';
import 'package:coach_nutrition/Workout/MyPlanWorkout.dart';

class ChestPage extends StatefulWidget {
  @override
  State<ChestPage> createState() => _ChestPageState();
}

class _ChestPageState extends State<ChestPage> {
  final List<Map<String, dynamic>> Exercices = [
    {
      "name": "Bench Press",
      "image": "assets/images/Barbell-Bench-Press.gif",
      "description": "The bench press is a compound exercise that targets the chest, shoulders, and triceps."
    },
    {
      "name": "Incline Chest Fly Machine",
      "image": "assets/images/Incline-Chest-Fly-Machine.gif",
      "description": "Isolates the upper chest using controlled fly movements on a machine."
    },
    {
      "name": "Pec Deck Fly",
      "image": "assets/images/Pec-Deck-Fly.gif",
      "description": "Machine isolation that targets the pectoralis major and minor with stable movement."
    },
    {
      "name": "High Cable Crossover",
      "image": "assets/images/High-Cable-Crossover.gif",
      "description": "Cable exercise emphasizing inner and lower chest, plus secondary shoulder activation."
    },
    {
      "name": "Incline Dumbbell Press",
      "image": "assets/images/Incline-Dumbbell-Press.gif",
      "description": "Strengthens upper chest, front shoulders, and triceps on an incline bench."
    },
    {
      "name": "Decline Dumbbell Press",
      "image": "assets/images/Decline-Dumbbell-Press.gif",
      "description": "Targets the lower chest using dumbbells on a decline bench."
    },
    {
      "name": "Chest Dips",
      "image": "assets/images/Chest-Dips.gif",
      "description": "Bodyweight exercise for lower chest, triceps, and shoulders."
    },
  ];

  @override
  Widget build(BuildContext context) {
    final myPlanProvider = Provider.of<MyPlanProvider>(context);
    List<Map<String, dynamic>> myPlan = [];
    return Scaffold(
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
        title: Text("Chest Workouts",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Color(0xFF050B38),
      ),

      body: Container(
        color: Color(0xFF050B38),
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: Exercices.length,
          itemBuilder: (context, index) {
            final item = Exercices[index];

            return Container(
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6, spreadRadius: 1)],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(14)),
                    child: Image.asset(item["image"], width: 100, height: 100, fit: BoxFit.cover),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item["name"], style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                        SizedBox(height: 6),
                        Text("4 Sets • 8 Reps", style: TextStyle(color: Colors.grey[600])),
                        SizedBox(height: 10),
                        SizedBox(width: 10),


                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent),
                      icon: Icon(Icons.info, color: Colors.white),
                      label: Text("Info", style: TextStyle(color: Colors.white)),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(item["name"], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                      IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: Icon(Icons.close),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Image.asset(item["image"], height: 200),
                                  SizedBox(height: 20),
                                  Text("Overview", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 10),
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
                                      myPlanProvider.addExercise(item);
                                      myPlan.add(item);
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("${item["name"]} added to My Plan"),
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

                    ),
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

