import 'dart:ui';

import 'package:flutter/material.dart';

class BicepsTricepsPage extends StatefulWidget {
  @override
  State<BicepsTricepsPage> createState() => _BicepsTricepsPageState();
}

class _BicepsTricepsPageState extends State<BicepsTricepsPage> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> foods = [
    {
      "name": "Barbell Curl",
      "image": "assets/images/Barbell-Curl.gif",
      "description":
          "A barbell curl is a weightlifting exercise that primarily targets the biceps muscles in the upper arms. It involves lifting a barbell with an underhand grip and curling it towards the chest while keeping the elbows stationary."
          "This exercise is typically performed while standing with feet shoulder-width apart and the barbell held at arm’s length in front of the body. Barbell curls can be performed using various weights and grip positions, allowing for variations in the exercise and the ability to target different muscles. They are a popular exercise for those looking to increase the size and definition of their biceps",
    },
    {
      "name": "Seated Zottman Curl",
      "image": "assets/images/Seated-Zottman-Curl.gif",
      "description":
          "The seated Zottman curl is a variation of the dumbbell curl exercise that targets the biceps brachii, brachialis, and forearms. The seated position helps stabilize your body and isolate the muscles being worked on. This exercise targets both the biceps during the supination phase and the forearm muscles (especially the brachioradialis) during the pronation phase, providing a more comprehensive arm workout.",
    },
    {
      "name": "Dumbbell Curl",
      "image": "assets/images/Dumbbell-Curl.gif",
      "description":
          "Dumbbell curl is a basic strength training exercise to build muscle and strength in the arms. Specifically, the dumbbell curl works all the muscles in the front of the arm. The exercise can be performed in a variety of ways, including alternating arms, performing both arms at the same time, or using different grips or variations to target specific areas of the biceps. Also, by working each arm independently, you can identify and resolve any weakness or imbalance, ultimately promoting more balanced muscle development.",
    },
    {
      "name": "EZ Bar Preacher Curl",
      "image": "assets/images/Z-Bar-Preacher-Curl.gif",
      "description":
          "The EZ Bar preacher curl, a variation of the preacher curl performed with a straight barbell, is an effective isolation exercise primarily targeting the biceps and forearms."
          "Performing the preacher curl involves using a specialized bench, known as the preacher curl bench, and a curl bar with an underhand grip. This grip positions the wrists and elbows in a way that maximizes bicep engagement, facilitating optimal muscle activation throughout the movement."
          "The EZ-bar allows for a more comfortable grip, reducing the strain on the wrists and elbows. The preacher bench helps isolate the biceps by keeping the upper arms stationary and eliminating any swinging or cheating that can occur during regular bicep curls.",
    },
    {
      "name": "Push-down",
      "image": "assets/images/Pushdown.gif",
      "description":
          "The triceps pushdown is a basic strength training exercise that isolates and strengthens the triceps. This movement is performed using a cable machine with a straight bar, rope, or V-bar attachment. It is used in strength training routines to enhance arm aesthetics or increase pressing power.",
    },
    {
      "name": "One Arm Triceps Pushdown",
      "image": "assets/images/One-arm-triceps-pushdown.gif",
      "description":
          "The one arm triceps pushdown is a resistance exercise that isolates the triceps, helping to build strength and definition in the upper arms. This exercise is commonly performed using a cable machine with a single-handle attachment. It allows for greater control, reduces muscle imbalances, and ensures both arms develop evenly.",
    },
    {
      "name": "Cable Rope Overhead",
      "image": "assets/images/Cable-Rope-Overhead-Triceps-Extension.gif",
      "description":
          "The cable rope overhead triceps extension is a resistance-based exercise that focuses on the triceps brachii. It involves extending the arms overhead against cable resistance, which keeps the triceps under constant tension. The rope attachment allows for a greater range of motion and a more natural grip, reducing strain on the wrists and elbows."
          "This exercise is commonly performed while standing, but it can also be done in a seated or kneeling position to modify the level of difficulty and target muscle engagement.",
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
                    "Biceps & Triceps",
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
