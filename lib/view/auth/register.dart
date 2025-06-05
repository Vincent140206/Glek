import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:glek/components/button.dart';
import 'package:glek/components/textfield.dart';

import 'login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isVisiblePassword = false;
  bool isVisibleConfirmPassword = false;

  void togglePasswordVisibility() {
    setState(() {
      isVisiblePassword = !isVisiblePassword;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      isVisibleConfirmPassword = !isVisibleConfirmPassword;
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
            SizedBox(height: 30,),
            Center(
              child: Column(
                children: [
                  Image.asset('assets/images/Logo.png', width: 108, height: 108),
                  Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Text("Email"),
            SizedBox(height: 5,),
            Textfield(
              hintText: "Enter your email",
              width: double.infinity,
              height: 50,
            ),
            SizedBox(height: 10,),
            Text("Password"),
            SizedBox(height: 5,),
            Textfield(
              hintText: "Enter your password",
              width: double.infinity,
              height: 50,
              obscureText: isVisiblePassword,
              suffixIcon: isVisiblePassword ? Icons.visibility : Icons.visibility_off,
              onSuffixIconPressed: togglePasswordVisibility,
            ),
            SizedBox(height: 10,),
            Text("Confirm Password"),
            SizedBox(height: 5,),
            Textfield(
              hintText: "Confirm your password",
              width: double.infinity,
              height: 50,
              obscureText: isVisibleConfirmPassword,
              suffixIcon: isVisibleConfirmPassword ? Icons.visibility : Icons.visibility_off,
              onSuffixIconPressed: toggleConfirmPasswordVisibility,
            ),
            SizedBox(height: 50,),
            Button(
              text: 'Sign Up',
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              width: double.infinity,
              height: 50,
              background: Colors.blue
            ),
            SizedBox(height: 100,),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign In',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
