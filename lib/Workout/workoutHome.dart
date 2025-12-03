import 'package:flutter/material.dart';
import 'package:coach_nutrition/Workout/ChestPage.dart';
import 'package:coach_nutrition/Workout/ShouldersPage.dart';
import 'package:coach_nutrition/Workout/BackPage.dart';
import 'package:coach_nutrition/Workout/Biceps&TricepsPage.dart';
import 'package:coach_nutrition/Workout/LegsPage.dart';
import 'package:coach_nutrition/Workout/Abs&CorePage.dart';
import 'package:coach_nutrition/Workout/FullBodyPage.dart';
import 'package:coach_nutrition/Workout/CardioPage.dart';

class workoutHome extends StatelessWidget {
  const workoutHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/backgroundApp.png"),
          fit: BoxFit.cover, // fill the screen
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                'WORKOUT PLACE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              _buildHomeButton(
                title: "Chest",
                icon: Icons.fitness_center,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChestPage()),
                  );
                },
              ),
              const SizedBox(height: 5),
              _buildHomeButton(
                title: "Shoulders",
                icon: Icons.fitness_center,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShouldersPage()),
                  );
                },
              ),
              const SizedBox(height: 5),
              _buildHomeButton(
                title: "Back",
                icon: Icons.fitness_center,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BackPage()),
                  );
                },
              ),
              const SizedBox(height: 5),
              _buildHomeButton(
                title: "Biceps & triceps",
                icon: Icons.fitness_center,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BicepsTricepsPage()),
                  );
                },
              ),
              const SizedBox(height: 5),
              _buildHomeButton(
                title: "Legs",
                icon: Icons.fitness_center,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LegsPage()),
                  );
                },
              ),

              const SizedBox(height: 5),
              _buildHomeButton(
                title: "Abs / Core",
                icon: Icons.fitness_center,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AbsCorePage()),
                  );
                },
              ),
              const SizedBox(height: 5),
              _buildHomeButton(
                title: "Full Body",
                icon: Icons.fitness_center,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FullBodyPage()),
                  );
                },
              ),
              const SizedBox(height: 5),
              _buildHomeButton(
                title: "Cardio",
                icon: Icons.fitness_center,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CardioPage()),
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeButton({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.black12.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(width: 15),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
