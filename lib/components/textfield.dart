import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final double? width;
  final double? height;
  final bool obscureText;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  const Textfield({super.key, this.hintText, this.controller, this.width, this.height, this.obscureText = false, this.suffixIcon, this.onSuffixIconPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 12.0,
            color: Colors.black54,
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
            icon: Icon(suffixIcon),
            onPressed: onSuffixIconPressed,
          )
              : null,
          filled: true,
          fillColor: const Color(0XFFB1B8BB),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
        ),
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        cursorColor: Colors.black,
        controller: controller,
        obscureText: obscureText,
      ),
    );
  }
}
