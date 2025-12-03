import 'dart:ui';

import 'package:flutter/material.dart';

class BackPage extends StatefulWidget {
  @override
  State<BackPage> createState() => _BackPageState();
}

class _BackPageState extends State<BackPage> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> foods = [
    {
      "name": "Pull-Up",
      "image": "assets/images/Pull-up.gif",
      "description":
          "The pull-up is a foundational bodyweight compound exercise that targets the back, arms, and core. It’s widely used in strength training, military fitness tests, calisthenics, and sports performance programs due to its ability to build upper body pulling power and muscular endurance with minimal equipment. It requires coordination between the lats, biceps, rhomboids, and core, making it one of the most effective exercises for developing upper body strength using your own bodyweight.",
    },
    {
      "name": "Lat Pulldown",
      "image": "assets/images/Lat-Pulldown.gif",
      "description":
          "The lat pulldown is a pulling exercise that primarily targets the latissimus dorsi muscles (commonly known as “lats”) in your back. It involves pulling a cable bar or handle down towards your chest while seated on a machine specifically designed for this exercise. The lat pulldown is typically performed with a wide grip, but can also be done with a narrow grip or underhand grip to target different muscle groups in the back and arms. It is a popular exercise for building upper body strength and improving posture.",
    },
    {
      "name": "Barbell Bent Over Row",
      "image": "assets/images/Barbell-Bent-Over-Row.gif",
      "description":
          "The Barbell Bent Over Row is a compound weightlifting exercise that primarily targets the muscles of the upper back, including the lats (latissimus dorsi), rhomboids, and traps, as well as the biceps and rear deltoids. It also engages the core muscles for stability. This exercise is commonly used to build strength and muscle mass in the back and arms.",
    },
    {
      "name": "Seated Cable Row",
      "image": "assets/images/Seated-Cable-Row.gif",
      "description":
          "The seated cable row is a popular cable exercise that targets the upper back and lats. This exercise involves pulling a cable attachment towards your body while seated, using a cable machine. Whether you’re a beginner or an experienced lifter, this exercise can be a valuable addition to your training program.",
    },
    {
      "name": "Lever T-Bar Row",
      "image": "assets/images/Lever-T-bar-Row.gif",
      "description":
          "T-bar row are a strength training exercise that mimics the movement of rowing a boat. The goal is to strengthen the muscles that bring the arms toward the body, as well as those that move the shoulder blades toward the spine. The t-bar row can allow you to lift more weight. Due to the nature of this movement, you are able to leverage more weight."
          "The T bar, which targets the entire back chain, targets the latissimus dorsi, infraspinatus, trapezius, posterior deltoids and rhomboids, so adding exercises such as barbell rows and t-bar rows to your training programs will be beneficial for the development of back muscles.",
    },
    {
      "name": "Dumbbell Row",
      "image": "assets/images/Dumbbell-Row.gif",
      "description":
          "The dumbbell row is a fundamental strength training movement that builds back thickness, improves posture, and enhances upper body pulling strength. This unilateral exercise allows for greater range of motion and muscle activation while correcting strength imbalances",
    },
    {
      "name": "Seated Row Machine",
      "image": "assets/images/Seated-Row-Machine.gif",
      "description":
          "The seated row machine is a pulling exercise that works the back muscles in general, particularly the latissimus dorsi. Suitable for beginners, this exercise can be used as part of upper body strength training.",
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
                    "Back",
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
