import 'dart:ui';
import 'package:coach_nutrition/Workout/MyPlanWorkout.dart';
import 'package:flutter/material.dart';
import 'package:coach_nutrition/MyWorkout/MyPlan.dart';
import 'package:provider/provider.dart';

class BicepsTricepsPage extends StatelessWidget {
  final List<Map<String, dynamic>> foods = [
    {
      "name": "Barbell Curl",
      "image": "assets/images/Barbell-Curl.gif",
      "description":
          "A barbell curl primarily targets the biceps muscles using an underhand grip.",
    },
    {
      "name": "Seated Zottman Curl",
      "image": "assets/images/Seated-Zottman-Curl.gif",
      "description":
          "A seated variation targeting biceps and forearms with supination and pronation phases.",
    },
    {
      "name": "Dumbbell Curl",
      "image": "assets/images/Dumbbell-Curl.gif",
      "description":
          "A basic strength exercise that targets the front arm muscles for balanced development.",
    },
    {
      "name": "EZ Bar Preacher Curl",
      "image": "assets/images/Z-Bar-Preacher-Curl.gif",
      "description":
          "An isolation exercise using the preacher bench to fully target the biceps.",
    },
    {
      "name": "Push-down",
      "image": "assets/images/Pushdown.gif",
      "description":
          "A triceps isolation exercise performed on a cable machine.",
    },
    {
      "name": "One Arm Pushdown",
      "image": "assets/images/One-arm-triceps-pushdown.gif",
      "description":
          "A single-arm variation to correct imbalances and develop triceps strength.",
    },
    {
      "name": "Cable Rope Overhead",
      "image": "assets/images/Cable-Rope-Overhead-Triceps-Extension.gif",
      "description":
          "A cable overhead extension that keeps the triceps under constant tension.",
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF050B38),
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: AppBar(
                elevation: 0,
                title: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Biceps & Triceps",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                centerTitle: true,
                backgroundColor: Color(0xFF050B38),
              ),
            ),
          ),
        ),
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
                                              onPressed: () =>
                                                  Navigator.pop(context),
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
                                            backgroundColor:
                                                Colors.orangeAccent,
                                            foregroundColor: Colors.white,
                                            padding: EdgeInsets.symmetric(
                                              vertical: 14,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                                  "${item["name"]} added to My Plan",
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
