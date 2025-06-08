import 'package:flutter/material.dart';
import 'package:glek/components/button.dart';
import 'package:glek/components/textfield.dart';
import 'package:glek/view/auth/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFE5F6FD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE5F6FD),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF1A1A1A)),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A1A),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                // Placeholder for profile picture
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  const Text(
                    'User Name',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Textfield(height: 60,),
                  SizedBox(height: 20,),
                  Textfield(height: 60,),
                  SizedBox(height: 20,),
                  Textfield(height: 60,),
                  SizedBox(height: 20,),
                  Textfield(height: 60,),
                  SizedBox(height: 90,),
                  Row(
                    children: [
                      Spacer(),
                      ElevatedButton(onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      } , child: Text('Logout'))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
