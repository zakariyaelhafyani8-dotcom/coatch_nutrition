import 'dart:ui';

import 'package:flutter/material.dart';

class LegsPage extends StatefulWidget {
  @override
  State<LegsPage> createState() => _LegsPageState();
}

class _LegsPageState extends State<LegsPage> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> foods = [
    {
      "name": "Smith Machine Squat",
      "image": "assets/images/smith-machine-squat.gif",
      "description":
      "The Smith Machine Squat is a squat variation performed inside a Smith machine, where the barbell moves along fixed rails. This removes the need to balance the bar and allows the user to focus on form, depth, and muscle engagement. While it limits natural bar path, it offers a safe and effective method for building lower body strength, especially in hypertrophy or rehabilitation-focused programs.",
    },
    {
      "name": "Dumbbell Goblet Squat",
      "image": "assets/images/Dumbbell-Goblet-Squat.gif",
      "description":
      "The goblet squat is a simple yet effective lower body exercise targeting the quadriceps, glutes, and hamstrings. It improves squat mechanics, strengthens the core, and promotes better posture, making it ideal for both beginners and advanced lifters in strength, hypertrophy, and general fitness routines.",
    },
    {
      "name": "Pendulum Lunge",
      "image": "assets/images/pendulum-lunge.gif",
      "description":
      "The pendulum lunge is a dynamic lower-body exercise that combines forward and reverse lunges into a single flowing movement. This continuous motion challenges the quadriceps, hamstrings, and glutes while also improving balance, coordination, and muscular endurance. It is often used in athletic training, functional workouts, and conditioning programs to develop unilateral leg strength and stability.",
    },
    {
      "name": "Dumbbell Walking Lunge",
      "image": "assets/images/dumbbell-lunges.gif",
      "description":
      "The dumbbell walking lunge is a dynamic lower-body exercise that combines strength, balance, and coordination. By holding a dumbbell in each hand and lunging forward step by step, you activate major muscle groups while enhancing stability and joint mobility. It combines elements of both strength and cardio training, allowing you to get a full-body workout in less time. It is an excellent movement for athletic training, hypertrophy, and functional fitness.",
    },
    {
      "name": "Barbell Squat",
      "image": "assets/images/BARBELL-SQUAT.gif",
      "description":
      "The barbell squat is a strength training exercise that targets the muscles of the lower body, particularly the quadriceps, hamstrings, and glutes. It is a compound exercise, meaning it works multiple muscle groups simultaneously. The exercise is performed using a barbell, which is a long, straight bar that is weighted with plates. Often referred to as the king of all lifts, it is a staple in powerlifting, bodybuilding, athletic training, and general fitness due to its versatility and effectiveness.",
    },
    {
      "name": "Leg Press",
      "image": "assets/images/Leg-Press.gif",
      "description":
      "The leg press, is a type of strength training exercise. It’s an effective move for strengthening your quadriceps, which are in the front of your upper legs. It is commonly performed using a leg press machine, which typically consists of a seat and a platform to which weight plates can be added.",
    },
    {
      "name": "Leg Curl",
      "image": "assets/images/Leg-Curl.gif",
      "description":
      "The leg curl is an isolation exercise that targets the muscles of the back of the thigh, specifically the hamstrings. It is an effective exercise for developing strength, size, and muscular endurance in the hamstrings. It is commonly performed using a leg curl machine found in gyms or fitness centers.",
    },
    {
      "name": "Leg Extension",
      "image": "assets/images/LEG-EXTENSION.gif",
      "description": "Leg extensions are a popular isolation exercise that primarily target the quadriceps muscles, which are located at the front of the thigh. Leg extension exercises typically involve the use of a leg extension machine found in most gyms. Here’s a step-by-step guide on how to perform leg extensions:",
    },
    {
      "name": "Deadlift",
      "image": "assets/images/Barbell-Deadlift.gif",
      "description": "The deadlift is a compound exercise that involves lifting a weight from the ground to a standing position. It is often considered one of the best exercises for building overall strength and power, as it works multiple muscle groups throughout the body.",
    },
    {
      "name": "Hack Squats Machine",
      "image": "assets/images/Sled-Hack-Squat.gif",
      "description": "The hack squat machine is a popular lower-body exercise used to build strength and muscle in the quadriceps, glutes, and hamstrings. With the support of a sled-like machine, you perform a controlled squat at a fixed angle, which allows for greater safety and muscle isolation. It’s a staple in bodybuilding and strength programs for leg development.",
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
                    "Legs",
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
                                            Image.asset(
                                              item["image"],
                                            ),
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
