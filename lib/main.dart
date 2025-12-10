import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coach_nutrition/MyWorkout/MyPlan.dart';
import 'package:coach_nutrition/start_home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MyPlanProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
