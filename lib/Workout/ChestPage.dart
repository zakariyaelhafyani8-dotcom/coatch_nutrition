import 'dart:ui';

import 'package:flutter/material.dart';

class ChestPage extends StatefulWidget {
  @override
  State<ChestPage> createState() => _ChestPageState();
}

class _ChestPageState extends State<ChestPage> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> foods = [
    {
      "name": "Bench Press",
      "image": "assets/images/Barbell-Bench-Press.gif",
      "description":
          "The bench press is a compound strength training exercise that primarily targets the chest muscles (pectoralis major and minor). It can be performed using various grips and angles to target different areas of the chest, with variations such as the incline, decline, or flat bench. This exercise is fundamental in bodybuilding, powerlifting, and general fitness training."
          "Overall, the bench press effectively targets multiple muscle groups in the upper body and is a valuable addition to any strength training routine",
    },
    {
      "name": "Incline Chest Fly Machine",
      "image": "assets/images/Incline-Chest-Fly-Machine.gif",
      "description":
          "The incline chest fly machine is a machine-based resistance training exercise designed to isolate the upper pectoral muscles. It typically consists of a bench or seat set at an inclined angle (usually around 30 to 45 degrees) and handles or levers connected to a weight stack or resistance system."
          "The incline position places more emphasis on the clavicular (upper) fibers of the pectoralis major, helping to develop and strengthen that area of the chest. It’s often used in strength training to isolate the chest muscles and promote muscle growth and definition in the upper chest region.",
    },
    {
      "name": "Pec Deck Fly",
      "image": "assets/images/Pec-Deck-Fly.gif",
      "description":
          "The pec deck fly is a machine-based isolation exercise that primarily targets the chest muscles. It is performed on a special machine that provides a controlled and stable movement that reduces the risk of injury compared to other chest exercises that require free weights. The machine acts as a stabilizer here, emphasizing the pectoralis major and pectoralis minor muscles in the chest. This isolation exercise, which combines pushing and compression movements, helps develop and strengthen the chest muscles",
    },
    {
      "name": "High Cable Crossover",
      "image": "assets/images/High-Cable-Crossover.gif",
      "description":
          "High cable crossover is a cable exercise that targets the chest muscles. It involves using a cable machine with the pulleys set to the highest position and crossing the arms in front of the body at the end of the movement. This move targets the pecs, specifically the lower, inner and outer areas, while also working the shoulders and triceps as secondary muscles.",
    },
    {
      "name": "Incline Dumbbell Press",
      "image": "assets/images/Incline-Dumbbell-Press.gif",
      "description":
          "The incline dumbbell press is a strength training exercise that targets the chest (upper pectoral) muscles, as well as the shoulders and triceps. It is performed on an incline bench set at a 30-45 degree angle, with a dumbbell in each hand.",
    },
    {
      "name": "Decline Dumbbell Press",
      "image": "assets/images/Decline-Dumbbell-Press.gif",
      "description":
          "The Decline Dumbbell Press is a variation of the traditional bench press where the bench is set at a declined angle (usually between 15-30 degrees downward), and dumbbells are used instead of a barbell. This exercise specifically targets the lower portion of the pectoralis major (lower chest) while also engaging the triceps and anterior deltoids (front shoulder muscles)",
    },
    {
      "name": "Chest Dips",
      "image": "assets/images/Chest-Dips.gif",
      "description":
          "Chest Dips are a bodyweight exercise that primarily targets the lower chest and triceps, while also engaging the shoulders and core for stabilization. This exercise is performed using parallel bars and is highly effective for building upper body strength and muscle definition, especially in the chest and triceps.",
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
                    "Chest",
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
