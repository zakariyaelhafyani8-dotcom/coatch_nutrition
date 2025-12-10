import 'dart:ui';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class foodGuidPage extends StatefulWidget {
  const foodGuidPage({super.key});

  @override
  State<foodGuidPage> createState() => _foodGuidPageState();
}

class _foodGuidPageState extends State<foodGuidPage> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> foods = [
    {
      "name": "Chicken breast",
      "image": "assets/images/checkenBreast.jpg",
      "calories": "165",
      "protein": "31",
      "carbs": "0",
      "fat": "3.6",
      "proteinPrst": 79.00,
      "carbsPrst": 0.00,
      "fatPrst": 21.00,
    },
    {
      "name": "Wild salmon",
      "image": "assets/images/salmonFood.jpg",
      "calories": "142–182",
      "protein": "20–25",
      "carbs": "0",
      "fat": "6–10",
      "proteinPrst": 58.00,
      "carbsPrst": 0.00,
      "fatPrst": 42.00,
    },
    {
      "name": "Brown rice",
      "image": "assets/images/browenRice.jpg",
      "calories": "112",
      "protein": "2.3",
      "carbs": "23.5",
      "fat": "0.8",
      "proteinPrst": 8.00,
      "carbsPrst": 85.00,
      "fatPrst": 7.00,
    },
    {
      "name": "Quinoa",
      "image": "assets/images/Quinoa.jpg",
      "calories": "120",
      "protein": "4.4",
      "carbs": "21.3",
      "fat": "1.9",
      "proteinPrst": 16.00,
      "carbsPrst": 72.00,
      "fatPrst": 12.00,
    },
    {
      "name": "Broccoli",
      "image": "assets/images/Broccoli.jpg",
      "calories": "34",
      "protein": "2.8",
      "carbs": "6.6",
      "fat": "0.4",
      "proteinPrst": 27.00,
      "carbsPrst": 65.00,
      "fatPrst": 8.00,
    },
    {
      "name": "Spinach",
      "image": "assets/images/spinach.jpg",
      "calories": "23",
      "protein": "2.9",
      "carbs": "3.6",
      "fat": "0.4",
      "proteinPrst": 39.00,
      "carbsPrst": 49.00,
      "fatPrst": 12.00,
    },
    {
      "name": "Almonds",
      "image": "assets/images/almonds.jpg",
      "calories": "575–578",
      "protein": "21–22",
      "carbs": "21–22",
      "fat": "49–50",
      "proteinPrst": 14.00,
      "carbsPrst": 12.00,
      "fatPrst": 74.00,
    },
    {
      "name": "Greek yogurt",
      "image": "assets/images/Greekyogurt.jpg",
      "calories": "59–100",
      "protein": "10–17",
      "carbs": "3.6–6",
      "fat": "0–1",
      "proteinPrst": 41.00,
      "carbsPrst": 24.00,
      "fatPrst": 35.00,
    },
    {
      "name": "Apple",
      "image": "assets/images/apple.jpg",
      "calories": "52",
      "protein": "0.3",
      "carbs": "13.8",
      "fat": "0.17",
      "proteinPrst": 2.00,
      "carbsPrst": 95.00,
      "fatPrst": 3.00,
    },
    {
      "name": "Avocado",
      "image": "assets/images/avocado.jpg",
      "calories": "160",
      "protein": "2",
      "carbs": "8.5",
      "fat": "14.7",
      "proteinPrst": 5.00,
      "carbsPrst": 19.00,
      "fatPrst": 76.00,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          final List<ChartData> chartData = [
                            ChartData(
                              "Protein",
                              item["proteinPrst"],
                              Color(0x96721546),
                            ),
                            ChartData(
                              "Carbs",
                              item["carbsPrst"],
                              Colors.greenAccent,
                            ),
                            ChartData(
                              "Fat",
                              item["fatPrst"],
                              Color(0x72F19600),
                            ),
                          ];
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
                                Text(
                                  'Nutrition (per 100 g):',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Calories: " +
                                      item["calories"] +
                                      "kal",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Protein " + item["protein"] + "g",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Carbs: " + item["carbs"] + "g",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Fat: " + item["fat"] + "g",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Container(
                                  width: 100,
                                  height: 200,
                                  child: SfCircularChart(
                                    legend: Legend(isVisible: true),

                                    series: <CircularSeries>[
                                      PieSeries<ChartData, String>(
                                        dataSource: chartData,
                                        xValueMapper: (d, _) => d.label,
                                        yValueMapper: (d, _) => d.value,
                                        pointColorMapper: (d, _) =>
                                        d.color,
                                        animationDuration: 1500,
                                      ),
                                    ],
                                  ),
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
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Calories: " +
                            item["calories"] +
                            "kal",
                        style: TextStyle(fontSize: 12),
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
                                      final List<ChartData> chartData = [
                                        ChartData(
                                          "Protein",
                                          item["proteinPrst"],
                                          Color(0x96721546),
                                        ),
                                        ChartData(
                                          "Carbs",
                                          item["carbsPrst"],
                                          Colors.greenAccent,
                                        ),
                                        ChartData(
                                          "Fat",
                                          item["fatPrst"],
                                          Color(0x72F19600),
                                        ),
                                      ];
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
                                            Text(
                                              'Nutrition (per 100 g):',
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "Calories: " +
                                                  item["calories"] +
                                                  "kal",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              "Protein " + item["protein"] + "g",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              "Carbs: " + item["carbs"] + "g",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              "Fat: " + item["fat"] + "g",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Container(
                                              width: 100,
                                              height: 200,
                                              child: SfCircularChart(
                                                legend: Legend(isVisible: true),

                                                series: <CircularSeries>[
                                                  PieSeries<ChartData, String>(
                                                    dataSource: chartData,
                                                    xValueMapper: (d, _) => d.label,
                                                    yValueMapper: (d, _) => d.value,
                                                    pointColorMapper: (d, _) =>
                                                        d.color,
                                                    animationDuration: 1500,
                                                  ),
                                                ],
                                              ),
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
    );
  }
}
class ChartData {
  final String label;
  final double value;
  final Color color;

  ChartData(this.label, this.value, this.color);
}
