import 'dart:ui';

import 'package:flutter/material.dart';

class AbsCorePage extends StatefulWidget {
  @override
  State<AbsCorePage> createState() => _AbsCorePageState();
}

class _AbsCorePageState extends State<AbsCorePage> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> foods = [
    {
      "name": "Body Saw Plank",
      "image": "assets/images/body-saw-plank.gif",
      "description":
          "The body saw plank is a dynamic core exercise performed from a forearm plank position. Instead of holding still, you shift your body forward and backward, like a sawing motion. This exercise strengthens the entire core, including deep stabilizers, and demands greater control than the traditional plank. It’s often used in athletic and functional training to improve posture, anti-extension strength, and shoulder stability.",
    },
    {
      "name": "Dragon Flag",
      "image": "assets/images/Leg-Raise-Dragon-Flag.gif",
      "description":
          "The Dragon Flag is a challenging exercise that offers a wide range of benefits, particularly for your core muscles. To perform Dragon Flags correctly, you need precise control over your body’s movement, both during the lowering and raising phases."
          "This includes controlling the lowering (eccentric) phase and raising (concentric) phase of the exercise. Maintaining stability throughout the exercise showcases your mastery of control and coordination, which is a key element of advanced calisthenics.",
    },
    {
      "name": "Cross Crunch",
      "image": "assets/images/Cross-Crunch.gif",
      "description":
          "The cross crunches is a popular abdominal exercise that targets the obliques and rectus abdominis.The twisting motion involved in Cross Crunches helps activate and strengthen the oblique muscles, which are responsible for rotating and stabilizing the torso.",
    },
    {
      "name": "Standing Cable Crunch",
      "image": "assets/images/Standing-Cable-Crunch.gif",
      "description":
          "The Standing Cable Crunch is an effective exercise that targets the abdominal muscles, particularly the rectus abdominis. It involves using a cable machine to provide resistance throughout the movement.",
    },
    {
      "name": "Seated Bench Leg Pull-in",
      "image": "assets/images/Seated-Bench-Leg-Pull-in.gif",
      "description":
          "The Seated Bench Leg Pull-In is a variation of the leg pull exercise that targets the abs, specifically the lower abs. It is performed while seated on a bench or chair. By incorporating this exercise into your routine, you specifically target the lower abs for better muscle definition.",
    },
    {
      "name": "Crunches",
      "image": "assets/images/Crunch.gif",
      "description":
          "Crunch movement is one of the most basic exercises designed to strengthen the core muscles of the body. Exercise helps to strengthen core muscles, improve posture, and increase muscle mobility and flexibility.",
    },
    {
      "name": "Leg Raise",
      "image": "assets/images/Lying-Leg-Raise.gif",
      "description":
          "1- Lie on your back with your arms placed by your sides. Raise your legs into a vertical position, keeping your knees and feet together and your back and hips neutral."
          "2- Slowly lower your legs, keeping your feet and knees together, controlling the movement with your core and keeping your torso stationary."
          "3- Continue the movement until your feet are as near to the floor as you can get, maintaining a neutral back. Hold this position briefly, then slowly lift your legs back to the start position, with a controlled, smooth motion. Avoid lifting your lower back as you repeat.",
    },
    {
      "name": "Oblique Floor Crunches",
      "image": "assets/images/Oblique-Floor-Crunches.gif",
      "description":
          "1- Lie on your right side, with your right arm outstretched, palm down, and your left hand lightly supporting your head. Bend slightly from the waist so that your legs are at an angle of around 30 degrees to your torso."
          "2- Squeeze your oblique muscles to raise your head and shoulders, taking care not to force the movement."
          "3- Pause briefly at the top of the movement, then return to the start position slowly and under control. Complete the desired number of reps, then switch sides.",
    },
    {
      "name": "Heel Touch",
      "image": "assets/images/Heel-Touch.gif",
      "description":
          "1- Lie on your back with your arms by your sides, palms down, and bend your knees. Engage your core to raise your shoulders and upper back off the floor, keeping your neck relaxed and your spine in a neutral position."
          "2- Reach down as far as you can toward your right foot with your right hand in a slow and controlled movement, crunching the left side of your abdomen to drive the movement and avoid straining with your neck."
          "3- Pause briefly, then return to the starting position and alternate for the required number of repetitions. Repeat the movement to the left side of your body.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF050B38),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(color: Colors.white24, blurRadius: 10, spreadRadius: 1),
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
                backgroundColor: Color(0xFF050B38),
                elevation: 0,
                title: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Abs / Core",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                centerTitle: true,
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

            return GestureDetector(
              onTap: (){
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
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.orangeAccent, blurRadius: 6)],
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
                            icon: Icon(Icons.zoom_out_map),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
