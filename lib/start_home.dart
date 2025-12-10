import 'package:coach_nutrition/MyWorkout/MyPlanPage.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:coach_nutrition/Workout/workoutHome.dart';
import 'package:coach_nutrition/Food/food_home.dart';
import 'package:coach_nutrition/Profile/ProfilePages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> pages = [
    Home(key: ValueKey(1)),
    MyPlanPage(key: ValueKey(2)),
    workoutHome(key: ValueKey(3)),
    foodGuidPage(key: ValueKey(4)),
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
              BoxShadow(color: Colors.white10, blurRadius: 10, spreadRadius: 0.3),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "HEALTH CHECK",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      IconButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProfilePage()),
                            );
                          },
                          icon: Icon(Icons.person, color: Colors.white,),
                      ),
                    ],
                  ),
                ),
                centerTitle: true,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF050B38),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return SlideTransition(
            position: Tween(
              begin: Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        child: pages[currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade400, Colors.green.shade600],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFF050B38),

            elevation: 0,
            selectedItemColor: Colors.orangeAccent,
            unselectedItemColor: Colors.white38,
            selectedFontSize: 16,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.sticky_note_2_outlined),
                label: "My Plan",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center),
                label: "Training",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.restaurant),
                label: "Food",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> images = [
    'assets/images/imageHome.png',
    'assets/images/ranningImag.jpg',
    'assets/images/losingWeightImg.jpg',
    'assets/images/healthyFoodImg.jpg',
  ];

  final PageController _pageController = PageController();

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Auto page slider
    Future.delayed(Duration.zero, () {
      _autoSlide();
    });
  }

  void _autoSlide() async {
    while (true) {
      await Future.delayed(Duration(seconds: 3));
      if (_pageController.hasClients) {
        int nextPage = _currentIndex + 1;
        if (nextPage >= images.length) nextPage = 0;
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: _currentIndex == index ? 12 : 8,
                    height: _currentIndex == index ? 12 : 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? Colors.black26
                          : Colors.white,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 30),
              Text(
                "Training • Food • Health Test",
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 70),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 100,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Icon(Icons.run_circle_outlined, size: 80,),
                          Text('Running',),
                          SizedBox(height: 6,),
                          Text('%',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 100,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Icon(Icons.local_fire_department_rounded, size: 80,),
                          Text('Calories'),
                          SizedBox(height: 6,),
                          Text('%',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,),),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 100,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Icon(Icons.monitor_heart, size: 80,),
                          Text('Heart rate',),
                          SizedBox(height: 6,),
                          Text('%',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

}
