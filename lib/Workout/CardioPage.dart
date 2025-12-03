import 'dart:ui';

import 'package:flutter/material.dart';

class CardioPage extends StatefulWidget {
  @override
  State<CardioPage> createState() => _CardioPageState();
}

class _CardioPageState extends State<CardioPage> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> foods = [
    {
      "name": "Power Lunge",
      "image": "assets/images/power-lunge.gif",
      "description":
          "Power lunges are a dynamic high-intensity exercise that can help increase leg strength, explosive power and agility. They are often included in workouts aimed at enhancing athletic performance, such as in sports like basketball, soccer, and track and field. Additionally, power lunges can be incorporated into various fitness routines, including HIIT (High-Intensity Interval Training) workouts, to increase cardiovascular fitness and lower-body strength.",
    },
    {
      "name": "Shadow Boxing",
      "image": "assets/images/shadow-boxing-workout.gif",
      "description":
          "Shadow boxing involves a fighter or athlete practicing their punches, footwork, and defensive moves in front of an imaginary opponent, hence the name “shadow boxing”. It’s an essential part of training for many combat sports, helping fighters develop their skills, improve their form, and build muscle memory.",
    },
    {
      "name": "Burpee Long Jump",
      "image": "assets/images/Burpee-Long-Jump.gif",
      "description":
          "The Burpee Long Jump is an advanced, full-body plyometric conditioning exercise that combines the explosive power of a burpee with the athleticism of a broad jump. It challenges the entire body—building muscular endurance, cardiovascular stamina, and explosive power simultaneously. This movement is often used in high-intensity interval training (HIIT), CrossFit workouts, athletic conditioning, and military-style workouts.",
    },
    {
      "name": "5 Dot Drills",
      "image": "assets/images/5-Dot-drills-agility-exercise.gif",
      "description":
          "The 5 Dot Drill is an agility workout that involves creating an X-shaped pattern using five markers positioned on the ground. The objective is to perform dynamic jumps and movements between these markers to enhance agility and coordination. Incorporating 5 Dot drills into your training regimen can be a valuable addition for individuals seeking to enhance their athletic performance, agility, and overall fitness.",
    },
    {
      "name": "Depth Jump to Hurdle Hop",
      "image": "assets/images/Depth-Jump-to-Hurdle-Hop.gif",
      "description":
          "The depth jump to hurdle hop is an advanced plyometric exercise frequently used in sports that require explosive power and agility. This exercise combines two plyometric movements: the depth jump and the hurdle hop. By incorporating this exercise into your training regimen, you can expect improvements in explosive power, agility, and lower body strength, making it a valuable tool for athletes aiming to excel in their respective sports.",
    },
    {
      "name": "Riding Outdoor Bicycle",
      "image": "assets/images/Riding-Outdoor-Bicycle.gif",
      "description": "",
    },
    {"name": "Sprint", "image": "assets/images/sprint.gif", "description": ""},
    {
      "name": "Jump Rope",
      "image": "assets/images/Skip-Jump-Rope.gif",
      "description":
          "Jump rope, also known as skipping, is a classic cardio workout that engages multiple muscle groups and improves cardiovascular endurance, coordination, and agility. Portable and inexpensive, it’s a favorite among athletes, boxers, and general fitness enthusiasts alike.",
    },
    {
      "name": "Incline Treadmill",
      "image": "assets/images/Incline-Treadmill.gif",
      "description":
          "By elevating the treadmill deck, it simulates uphill walking or running. Most treadmills have adjustable incline settings, typically ranging from 0 to 15 percent. Using an incline activates more muscle groups, increases caloric expenditure, and helps improve cardiovascular fitness",
    },
    {
      "name": "Rowing Machine",
      "image": "assets/images/Rowing-Machine.gif",
      "description":
          "The rowing machine is a cardio and strength-training exercise tool that simulates rowing. By engaging both upper and lower body muscle groups, it improves stamina, strength, and calorie expenditure simultaneously. It provides a full-body workout, engaging muscles in the legs, core, back, and arms while offering low-impact cardiovascular conditioning. It is widely used for fat loss, aerobic endurance, and sport-specific conditioning.",
    },
    {
      "name": "Manual Treadmill",
      "image": "assets/images/Assault-Air-Runner.gif",
      "description": "",
    },
    {
      "name": "Elliptical Machine",
      "image": "assets/images/Elliptical-Machine.gif",
      "description": "",
    },
    {
      "name": "Stair Climber Machine",
      "image": "assets/images/Walking-on-Stepmill.gif",
      "description":
          "The stepmill is a cardio machine that mimics walking upstairs on a continuously rotating staircase. It provides a highly effective low-impact workout that strengthens the legs and glutes, boosts cardiovascular health, and supports weight management. Compared to treadmills or ellipticals, the stepmill increases vertical loading, making it a more challenging form of walking.",
    },
    {
      "name": "Push-up Toe Touch",
      "image": "assets/images/Push-up-Toe-Touch.gif",
      "description": "",
    },
    {
      "name": "Bicycle Crunch",
      "image": "assets/images/Bicycle-Crunch.gif",
      "description":
          "The Bicycle Crunch, a dynamic abdominal exercise, effectively targets the core muscles, including the obliques and rectus abdominis, by combining both upper and lower body movements. This effective exercise involves a dynamic combination of twisting and cycling-like motions, making it a valuable addition to any core strengthening routine.",
    },
    {
      "name": "Power Skips",
      "image": "assets/images/Power-Skips.gif",
      "description": "",
    },
    {
      "name": "Fast Feet Run",
      "image": "assets/images/Fast-Feet-Run.gif",
      "description": "",
    },
    {
      "name": "Jumping jack",
      "image": "assets/images/Jumping-jack.gif",
      "description":
          "Jumping jack are a plyometric exercise. Plyometrics are explosive aerobic moves that increase speed, quickness, and power and they work your whole body."
          "Jumping jack target the arm, shoulder, abdominal muscles, hip muscles and hip flexors and also work on the thighs, knee tendons and quadriceps."
          "Jumps are beneficial to your health because they combine cardiovascular conditioning with strength work. Since jumps elevate your heart rate, they can also improve your cardiovascular fitness.",
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
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Cardio",
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
                          icon: Icon(Icons.open_in_new_sharp),
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
