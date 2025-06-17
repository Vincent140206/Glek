import 'package:flutter/material.dart';
import 'package:glek/components/draggable_scrollable_sheet.dart';
import 'package:glek/view/goals.dart';
import 'package:glek/view/profile.dart';
import 'package:glek/view/stats.dart';
import '../components/circular_progress.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFE5F6FD),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey[400]!,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good Morning',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF1A1A1A),
                            ),
                          ),
                          Text(
                            'User',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0XFF1A1A1A),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => StatsScreen()));
                        },
                        icon: Image.asset(
                          'assets/icons/Menu.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: Text(
                      "Today's Goal",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF1A1A1A),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Center(
                    child: Text(
                      '1300/2000 ml',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF1A1A1A),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Goals()));
                      },
                      child: CircularProgressWidget(),
                    ),
                  ),
                  SizedBox(height: 200),
                ],
              ),
            ),
          ),
          CustomDraggableScrollableSheet(),
        ],
      ),
    );
  }
}
