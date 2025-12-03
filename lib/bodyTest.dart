import 'package:flutter/material.dart';

class BodyTestPage extends StatefulWidget {
  const BodyTestPage({super.key});
  @override
  _BodyTestPageState createState() => _BodyTestPageState();
}

class _BodyTestPageState extends State<BodyTestPage> {
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  String? sex;

  String result = "";
  Color resultColor = Colors.white;

  void calculate() {
    final double height = double.tryParse(heightController.text) ?? 0;
    final double weight = double.tryParse(weightController.text) ?? 0;

    if (height <= 0 || weight <= 0) {
      setState(() {
        result = "Please enter valid values!";
        resultColor = Colors.redAccent;
      });
      return;
    }

    double h = height / 100;
    double bmi = weight / (h * h);

    String text = "";

    if (bmi < 18.5) {
      text = "You need to GAIN mass";
      resultColor = Colors.orangeAccent;
    } else if (bmi >= 18.5 && bmi < 25) {
      text = "Your weight is NORMAL";
      resultColor = Colors.greenAccent;
    } else {
      text = "You need to LOSE weight";
      resultColor = Colors.redAccent;
    }

    setState(() {
      result = "BMI = ${bmi.toStringAsFixed(1)}\n$text";
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Title
                    Text(
                      "Body Test",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 30),

                    // Glassmorphism Card
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(0.15),
                        border: Border.all(color: Colors.white.withOpacity(0.3)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: Colors.black.withOpacity(0.1),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildInput("Age", ageController),
                          SizedBox(height: 15),
                          _buildInput("Height (cm)", heightController),
                          SizedBox(height: 15),
                          _buildInput("Weight (kg)", weightController),
                          SizedBox(height: 15),

                          // Sex dropdown
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.white70),
                            ),
                            child: DropdownButton<String>(
                              dropdownColor: Colors.white,
                              value: sex,
                              hint: Text(
                                "Select Sex",
                                style: TextStyle(color: Colors.white),
                              ),
                              isExpanded: true,
                              underline: SizedBox(),
                              items: [
                                DropdownMenuItem(
                                  value: "male",
                                  child: Text("Male"),
                                ),
                                DropdownMenuItem(
                                  value: "female",
                                  child: Text("Female"),
                                )
                              ],
                              onChanged: (val) {
                                setState(() {
                                  sex = val;
                                });
                              },
                            ),
                          ),

                          SizedBox(height: 25),

                          // Amazing Button
                          GestureDetector(
                            onTap: calculate,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white,
                                    Colors.white.withOpacity(0.8),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  "Test My Body",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 30),

                    // Result Card (Animated)
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: result.isEmpty
                            ? Colors.transparent
                            : resultColor.withOpacity(0.25),
                      ),
                      child: Text(
                        result,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }

  // Custom styled input field
  Widget _buildInput(String label, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white70),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white70),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
