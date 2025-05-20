import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscure;
  final Color fillColor;

  const CommonTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscure = false,
    this.fillColor = Colors.white, // Default to white
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.grey), // Default border
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.grey), // Always visible
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ), // On focus
        ),
      ),
    );
  }
}
