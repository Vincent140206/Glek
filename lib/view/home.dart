import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  foregroundImage: AssetImage('assets/images/profile.png'),
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
                      style: TextStyle(fontSize: 16, color: Color(0XFF1A1A1A)),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
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
              child: CircularProgressWidget(
                percentage: 65,
                subtitle: '700 ml more',
                size: 200,
                progressColor: Colors.blue[200]!,
                backgroundColor: Color(0X80E0FFFF),
                strokeWidth: 12.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
