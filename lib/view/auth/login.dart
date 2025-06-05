import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:glek/components/button.dart';
import 'package:glek/components/textfield.dart';
import 'package:glek/view/auth/register.dart';

import '../home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisiblePassword = false;
  bool isChecked = false;

  void toggleCheckbox(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  }

  void togglePasswordVisibility() {
    setState(() {
      isVisiblePassword = !isVisiblePassword;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFE5F6FD),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Logo.png',
                    width: 108,
                    height: 108,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
            Text('Email'),
            SizedBox(height: 5,),
            Textfield(
              hintText: 'Enter your email',
              width: double.infinity,
              height: 50,
            ),
            SizedBox(height: 20),
            Text('Password'),
            SizedBox(height: 5),
            Textfield(
              hintText: 'Enter your password',
              width: double.infinity,
              height: 50,
              obscureText: isVisiblePassword,
              suffixIcon: isVisiblePassword ? Icons.visibility : Icons.visibility_off,
              onSuffixIconPressed: () {
                togglePasswordVisibility();
              },
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Text("Remember me"),
                Spacer(),
                Checkbox(
                  value: isChecked,
                  onChanged: toggleCheckbox,
                  activeColor: Colors.blue,
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.black54,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Or",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.black54,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network('https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png', width: 30, height: 30),
                  SizedBox(width: 10),
                  Text(
                    "Continue with Google",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Button(
                text: 'Login',
                onPressed: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                width: double.infinity,
                height: 50,
                background: Colors.blue
            ),
            SizedBox(height: 20),
            Center(
              child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                        },
                      ),
                    ],
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
