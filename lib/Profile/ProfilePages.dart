import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:coach_nutrition/Profile/ProfileField.dart';
import 'package:coach_nutrition/Profile/ModifierProfilePage.dart';


class ProfilePageApp extends StatelessWidget {
  const ProfilePageApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  List<ProfileField> fields = [
    ProfileField(key: 'userName', label: 'Full Name', value: 'Zakariya', type: FieldType.text),
    ProfileField(key: 'userAge', label: 'Age', value: 25, type: FieldType.number),
    ProfileField(key: 'userHeight', label: 'Height (cm)', value: 170, type: FieldType.number),
    ProfileField(key: 'userWeight', label: 'Weight (Kg)', value: 70, type: FieldType.number),
    ProfileField(key: 'userSex', label: 'Sex', value: 'Male', type: FieldType.dropdown, options: ['Male', 'Female']),
    ProfileField(key: 'userLevel', label: 'Level', value: 'Beginner', type: FieldType.dropdown, options: ['Beginner', 'Intermediate', 'Advanced']),
    ProfileField(key: 'userActivity', label: 'Daily Activity', value: false, type: FieldType.checkbox),
    ProfileField(key: 'userDOB', label: 'Date of Birth', value: DateTime(2000, 1, 1), type: FieldType.date),
  ];
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }
  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var field in fields) {
      switch (field.type) {
        case FieldType.text:
        case FieldType.dropdown:
          field.value = prefs.getString(field.key) ?? field.value;
          break;
        case FieldType.number:
          field.value = prefs.getInt(field.key) ?? field.value;
          break;
        case FieldType.checkbox:
          field.value = prefs.getBool(field.key) ?? field.value;
          break;
        case FieldType.date:
          int? millis = prefs.getInt(field.key);
          field.value = millis != null ? DateTime.fromMillisecondsSinceEpoch(millis) : field.value;
          break;
      }
    }
    setState(() {});
  }
  Future<void> _saveUserData(ProfileField field) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (field.type) {
      case FieldType.text:
      case FieldType.dropdown:
        await prefs.setString(field.key, field.value.toString());
        break;
      case FieldType.number:
        await prefs.setInt(field.key, field.value as int);
        break;
      case FieldType.checkbox:
        await prefs.setBool(field.key, field.value as bool);
        break;
      case FieldType.date:
        await prefs.setInt(field.key, (field.value as DateTime).millisecondsSinceEpoch);
        break;
    }
  }
  Map<String, int> calculateIdealWeightRange() {
    final heightField = fields.firstWhere((f) => f.key == 'userHeight', orElse: () => ProfileField(key: 'userHeight', label: '', value: 170, type: FieldType.number));
    double h = (heightField.value ?? 170).toDouble() / 100.0;
    int minW = (18.5 * h * h).round();
    int maxW = (24.9 * h * h).round();
    return {'min': minW, 'max': maxW};
  }
  String weightAnalysisInterval(int currentWeight, Map<String, int> range) {
    if (currentWeight < range['min']!) return 'Below Ideal Weight';
    if (currentWeight > range['max']!) return 'Above Ideal Weight';
    return 'Within Ideal Weight';
  }
  int get currentWeight {
    final w = fields.firstWhere((f) => f.key == 'userWeight', orElse: () => ProfileField(key: 'userWeight', label: '', value: 70, type: FieldType.number));
    return (w.value ?? 70) as int;
  }
  int get currentHeight {
    final h = fields.firstWhere((f) => f.key == 'userHeight', orElse: () => ProfileField(key: 'userHeight', label: '', value: 170, type: FieldType.number));
    return (h.value ?? 170) as int;
  }
  double calculateBMI() {
    double heightM = currentHeight / 100.0;
    if (heightM <= 0) return 0.0;
    return currentWeight / (heightM * heightM);
  }
  double bmiToNormalized(double bmi) {
    const minBmi = 15.0;
    const maxBmi = 40.0;
    double norm = (bmi - minBmi) / (maxBmi - minBmi);
    if (norm < 0) norm = 0;
    if (norm > 1) norm = 1;
    return norm;
  }
  Color bmiColor(double bmi) {
    if (bmi < 18.5) return Colors.blue;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }
  Future<void> _saveAllFields() async {
    for (var f in fields) {
      await _saveUserData(f);
    }
  }

  @override
  Widget build(BuildContext context) {
    final idealRange = calculateIdealWeightRange();
    final bmi = calculateBMI();
    final analysis = weightAnalysisInterval(currentWeight, idealRange);
    final norm = bmiToNormalized(bmi);
    final color = bmiColor(bmi);

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFF050B38),
        title: const Text('Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFF050B38),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                child: Card(
                  color: Color(0xFF1A2FA4),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const CircleAvatar(radius: 40, backgroundImage: AssetImage('assets/images/avatar.png')),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(fields.firstWhere((f) => f.key == 'userName').value.toString(), style: const TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 6),
                              Text('Level: ${fields.firstWhere((f) => f.key == 'userLevel').value}', style: const TextStyle(color: Colors.white70)),
                              const SizedBox(height: 6),
                              Text('Sex: ${fields.firstWhere((f) => f.key == 'userSex').value}', style: const TextStyle(color: Colors.white70)),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.orangeAccent),
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ModifierProfilePage(fields: fields.map((f) => ProfileField(key: f.key, label: f.label, value: f.value, type: f.type, options: f.options)).toList())),
                            );
                            if (result != null) {
                              setState(() {
                                fields = result;
                              });
                              await _saveAllFields();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                color: Color(0xFF1A2FA4),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: fields.map((f) {
                      String display;
                      switch (f.type) {
                        case FieldType.text:
                        case FieldType.number:
                        case FieldType.dropdown:
                          display = f.value.toString();
                          break;
                        case FieldType.checkbox:
                          display = (f.value ?? false) ? 'Yes' : 'No';
                          break;
                        case FieldType.date:
                          display = (f.value as DateTime).toLocal().toString().split(' ')[0];
                          break;
                      }
                      return ListTile(
                        dense: true,
                        title: Text(f.label,style: TextStyle(color: Colors.white,fontSize: 16,),),
                        trailing: Text(display,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                color: Color(0xFF1A2FA4),
                child: ListTile(
                  leading: const Icon(Icons.fitness_center, color: Colors.orangeAccent),
                  title: Text('Ideal Weight: ${idealRange['min']} - ${idealRange['max']}Kg',style: TextStyle(color: Colors.white),),
                  subtitle: Text('Analysis: $analysis',style: TextStyle(color: Colors.white),),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                color: Color(0xFF1A2FA4),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.monitor_weight,color: Colors.orangeAccent,),
                          const SizedBox(width: 8),
                          Text('BMI: ${bmi.toStringAsFixed(1)}', style: const TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.bold)),
                          const Spacer(),
                          Text(analysis, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 12),

                      GaugeSpeedometer(
                        value: norm,
                        color: color,
                      ),
                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Weak', style: TextStyle(color: Colors.blue)),
                          Text('Normal', style: TextStyle(color: Colors.green)),
                          Text('Overweight', style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold)),
                          Text('Fat', style: TextStyle(color: Colors.red)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class GaugeSpeedometer extends StatelessWidget {
  final double value;
  final Color color;

  const GaugeSpeedometer({required this.value, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    const double startAngle = pi;
    const double sweepAngle = pi;

    final double angle = startAngle + (sweepAngle * value);

    return SizedBox(
      height: 160,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: startAngle, end: angle),
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeOutCubic,
        builder: (context, animatedAngle, child) {
          return CustomPaint(
            size: const Size(double.infinity, 140),
            painter: _GaugePainter(animatedAngle, color),
          );
        },
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  final double needleAngle;
  final Color color;
  _GaugePainter(this.needleAngle, this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final Paint arcPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 18
      ..strokeCap = StrokeCap.round;
    final center = Offset(size.width / 2, size.height);
    final radius = size.width * 0.4;
    final List<Color> colors = [Colors.blue, Colors.green, Colors.orange, Colors.red];
    final double segmentSweep = pi / colors.length;
    for (int i = 0; i < colors.length; i++) {
      arcPaint.color = colors[i].withOpacity(0.9);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        pi + (i * segmentSweep),
        segmentSweep,
        false,
        arcPaint,
      );
    }
    final Paint inner = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..color = Colors.black12;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius - 12), pi, pi, false, inner);
    final needlePaint = Paint()
      ..color = Colors.black87
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    final needleLength = radius - 10;
    final needleX = center.dx + cos(needleAngle) * needleLength;
    final needleY = center.dy + sin(needleAngle) * needleLength;
    final shadow = Paint()
      ..color = Colors.black26
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(center, Offset(needleX, needleY), shadow);
    canvas.drawLine(center, Offset(needleX, needleY), needlePaint);
    final Paint knob = Paint()..color = color;
    canvas.drawCircle(center, 8, knob);
    final Paint knobBorder = Paint()..style = PaintingStyle.stroke..color = Colors.black12..strokeWidth = 2;
    canvas.drawCircle(center, 8, knobBorder);
  }

  @override
  bool shouldRepaint(covariant _GaugePainter oldDelegate) {
    return oldDelegate.needleAngle != needleAngle || oldDelegate.color != color;
  }
}



