import 'dart:ui';

import 'package:flutter/material.dart';

class FullBodyPage extends StatefulWidget {
  @override
  State<FullBodyPage> createState() => _FullBodyPageState();
}

class _FullBodyPageState extends State<FullBodyPage> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> foods = [
    {
      "name": "Burpee Long Jump",
      "image": "assets/images/Burpee-Long-Jump.gif",
      "description":
          "The Burpee Long Jump is an advanced, full-body plyometric conditioning exercise that combines the explosive power of a burpee with the athleticism of a broad jump. It challenges the entire body—building muscular endurance, cardiovascular stamina, and explosive power simultaneously. This movement is often used in high-intensity interval training (HIIT), CrossFit workouts, athletic conditioning, and military-style workouts.",
    },
    {
      "name": "Plate Push",
      "image": "assets/images/plate-push.gif",
      "description":
          "The Plate Push is a high-intensity, full-body exercise that mimics the sled push but uses a weight plate on a smooth surface instead of a sled. This movement helps increase explosive hip extension, strength, speed, conditioning, and functional strength. It’s commonly used in sports performance, CrossFit, and metabolic training to improve leg drive, power output, and cardiovascular endurance.",
    },
    {
      "name": "Body Saw Plank",
      "image": "assets/images/body-saw-plank.gif",
      "description":
          "The body saw plank is a dynamic core exercise performed from a forearm plank position. Instead of holding still, you shift your body forward and backward, like a sawing motion. This exercise strengthens the entire core, including deep stabilizers, and demands greater control than the traditional plank. It’s often used in athletic and functional training to improve posture, anti-extension strength, and shoulder stability.",
    },
    {
      "name": "Clean and Jerk",
      "image": "assets/images/clean-and-jerk.gif",
      "description":
          "The clean and jerk is one of the two main lifts in Olympic weightlifting competitions. It is a highly technical, full-body exercise that trains explosive power, coordination, balance, and strength. The lift consists of two phases: the clean, where the barbell is lifted from the ground to the shoulders, and the jerk, where it is driven overhead. The clean recruits the posterior chain for a powerful pull and hip extension, while the jerk emphasizes upper-body strength and speed for the overhead drive. Mastering this movement requires mobility, timing, and progressive training.",
    },
    {
      "name": "Dumbbell Push Press",
      "image": "assets/images/Dumbbell-Push-Press.gif",
      "description":
          "The dumbbell push press is a strength training exercise that targets the shoulders, triceps, and upper body, while also engaging the core and lower body for stability and support. It’s commonly used in athletic training, CrossFit, and general strength routines to develop shoulder strength and explosiveness.",
    },
    {
      "name": "Zercher Carry",
      "image": "assets/images/zercher-carry.gif",
      "description":
          "The Zercher carry involves walking while holding a barbell or heavy object in front of the torso, supported in the crease of the elbows. Unlike traditional carries that engage the grip directly, the Zercher position shifts the load forward, forcing the core and upper back to work harder to maintain upright posture and balance. It’s a demanding but highly effective total-body movement. It’s often used in strongman, powerlifting, and functional fitness to build real-world strength and resilience.",
    },
    {
      "name": "Dumbbell Power Clean",
      "image": "assets/images/Dumbbell-Power-Clean.gif",
      "description":
          "",
    },
    {
      "name": "Log Lift",
      "image": "assets/images/Log-Lift.gif",
      "description":
          "Stand with your feet shoulder-width apart and place your hands on the log or barbell, keeping your grip shoulder-width apart."
          "Keep your back straight, bend at the knees, and pick up the log, bringing it to your waist."
          "With the log resting on your waist, take a deep breath, tighten your core, and use your legs to push upward, lifting the log to your shoulder."
          "Once the log is on your shoulder, maintain a firm grip, keeping your elbow close to your side, and stand upright."
          "Pause for a few seconds and then lower the log back to your waist, keeping control of the weight throughout the movement.",
    },
    {
      "name": "Barbell Snatch",
      "image": "assets/images/Barbell-Snatch.gif",
      "description":
      "",
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
                    "Full Body",
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
