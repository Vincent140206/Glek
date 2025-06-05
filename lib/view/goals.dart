import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/circular_progress.dart';
import '../components/funfact.dart';

class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFE5F6FD),
      body: Padding(
        padding: const EdgeInsets.all(34),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0XFF1A1A1A),
                  ),
                ),
                const Text(
                  'Goals',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF1A1A1A),
                  ),
                ),
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
            SizedBox(height: 60,),
            Text(
              'Water Intake Goal!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0XFF1A1A1A),
              ),
            ),
            Text(
              'Keep it up to stay hydrated',
              style: TextStyle(
                fontSize: 14,
                color: Color(0XFF1A1A1A),
              ),
            ),
            SizedBox(height: 50,),
            CircularProgressWidget(
              percentage: 65,
              subtitle: '700 ml more',
              size: 220,
              progressColor: Color(0XFFA5C6E0),
              backgroundColor: Color(0XFFDDE9E8),
              strokeWidth: 25.0,
            ),
            SizedBox(height: 60,),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: funFacts.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 220,
                    margin: EdgeInsets.only(right: 12),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.water_drop_rounded, color: Color(0XFFA5C6E0)),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            funFacts[index].text,
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: Color(0XFF1A1A1A),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      )
    );
  }
}
