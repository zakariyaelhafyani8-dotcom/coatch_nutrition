import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coach_nutrition/MyWorkout/MyPlan.dart';

class MyPlanPage extends StatefulWidget {
  const MyPlanPage({super.key});

  @override
  State<MyPlanPage> createState() => _MyPlanPageState();
}

class _MyPlanPageState extends State<MyPlanPage> {
  @override
  Widget build(BuildContext context) {
    final myPlan = Provider.of<MyPlanProvider>(context).myPlan;

    return myPlan.isEmpty
        ? Center(
            child: Text(
              "No exercises added yet",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          )
        : ListView.builder(
            itemCount: myPlan.length,
            itemBuilder: (context, index) {
              final item = myPlan[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 10,
                    ),
                    child: Card(
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return DraggableScrollableSheet(
                                expand: false,
                                builder: (_, controller) {
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
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.close),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                            ),
                                          ],
                                        ),

                                        SizedBox(height: 20),
                                        Image.asset(item["image"]),
                                        SizedBox(height: 20),

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

                                        SizedBox(height: 30),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(blurRadius: 10, color: Colors.black54),
                            ],
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              item['image'],
                              width: 50,
                              height: 50,
                            ),
                            title: Text(item['name']),
                            subtitle: Text("4 Sets * 12 reps"),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Delete Confirmation"),
                                      content: Text(
                                        "Are you sure you want to remove this exercise from your plan?",
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text("Cancel"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text("OK"),
                                          onPressed: () {
                                            Provider.of<MyPlanProvider>(
                                              context,
                                              listen: false,
                                            ).removeExercise(item['name']);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
  }
}
