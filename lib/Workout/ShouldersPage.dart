import 'dart:ui';

import 'package:flutter/material.dart';

class ShouldersPage extends StatefulWidget {
  @override
  State<ShouldersPage> createState() => _ShouldersPageState();
}

class _ShouldersPageState extends State<ShouldersPage> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> exercices = [
    {
      "name": "Seated Barbell Press",
      "image": "assets/images/Barbell-Shoulder-Press.gif",
      "description":
          "The seated barbell shoulder press is a compound exercise that targets the muscles of the shoulders, triceps, and upper body. It involves pressing a barbell overhead while seated on a bench or chair. As a fundamental movement, it is frequently used in strength, power, and hypertrophy training",
    },
    {
      "name": "Cable Lateral Raise",
      "image": "assets/images/Cable-Lateral-Raise.gif",
      "description":
          "The dumbbell push press is a strength training exercise that targets the shoulders, triceps, and upper body, while also engaging the core and lower body for stability and support. It’s commonly used in athletic training, CrossFit, and general strength routines to develop shoulder strength and explosiveness.",
    },
    {
      "name": "Lever Shoulder Press",
      "image": "assets/images/Lever-Shoulder-Press.gif",
      "description":
          "The standing dumbbell shoulder press, also known as the “Dumbbell Overhead Press” or simply the “Shoulder Press,” is a strength training exercise that targets the muscles of the shoulder, primarily the deltoids. In this exercise, you lift a weight (usually dumbbells or a barbell) overhead while standing. It is an effective compound exercise that also engages other upper body muscles, including the triceps and upper chest.",
    },
    {
      "name": "Dumbbell Lateral Raise",
      "image": "assets/images/Dumbbell-Lateral-Raise.gif",
      "description":
          "The dumbbell lateral raise is a strength exercise where you lift dumbbells out to the sides until your arms are parallel to the floor. It mainly targets the side deltoids, with support from the trapezius and upper back muscles. Popular in bodybuilding and rehab routines, it helps build round shoulders and improves shoulder stability.",
    },
    {
      "name": "Dumbbell Shoulder Press",
      "image": "assets/images/Dumbbell-Shoulder-Press.gif",
      "description":
          "The dumbbell shoulder press is a compound pushing exercise performed seated or standing with a dumbbell in each hand. It focuses on pressing the weights overhead by extending the elbows and elevating the arms in the scapular plane. This movement challenges the deltoid muscles to generate force while the stabilizers of the upper back and core maintain alignment and control. Its versatility makes it effective for muscle growth, general strength, or athletic development.",
    },
    {
      "name": "Rear Delt Fly Machine",
      "image": "assets/images/Rear-Delt-Machine-Flys.gif",
      "description":
          "Starting Position: Adjust the seat so that the handles are about shoulder level, and make sure to maintain good neck and lower back posture."
          "Form: Exhale and pull your arms apart until your shoulders are parallel with your body. Hold for a brief second and then slowly return to the starting position."
          "Personal Trainer Tips: You don’t have to pull your arms as far back as possible during this exercise. Use a comfortable range of motion, and don’t force your shoulder too far past parallel with your body."
          "As with every exercise posture is very important, make sure that your keep your head in good alignment and don’t let your head move forwards."
          "Also make sure that you do not cheat by using your lower back to pull the weights backwards. If you feel muscle work in your lower back, that could be a sign that the weight you are using is too heavy and you are likely compensating by using your lower back muscles.",
    },
    {
      "name": "Cable Row Rope",
      "image": "assets/images/Half-Kneeling-High-Cable-Row-Rope.gif",
      "description":
          "Half kneeling high cable row is a tremendous exercise that effectively works many muscles, including the shoulder, back, wing and trapezius muscles. It also activates the trapezius muscles, and may benefit discomfort caused by muscle weakness such as postural posture and shoulder blade protrusion by affecting the infraspinatus and subscapula muscles that cover the scapula. In addition, face pull is one of the most effective corrective exercises that help compensate for poor posture and shoulder dysfunction."
          "Many of the movements that work the same muscle group may look alike, but they focus on different parts of the muscles because they are at different angles. If you want to build better muscle specifically, keep in mind that it is more beneficial to include exercises that focus on different aspects to your training program.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black, blurRadius: 10, spreadRadius: 1),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
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
                    "Shoulders",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                centerTitle: true,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.grey, Colors.black12],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: GridView.builder(
          padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // 2 items per row
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 4,
          ),

          itemCount: exercices.length,
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
                          color: Colors.black87,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "4 Sets * 8reps",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  item["name"],
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                  ),
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
                                            Text(
                                              'Overview',
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              item["description"],
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            });
                          },
                          icon: Icon(Icons.login),
                        ),
                      ],
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
