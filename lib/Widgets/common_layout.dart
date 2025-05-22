import 'package:flutter/material.dart';

class CommonLayout extends StatelessWidget {
  final String imagePath;

  const CommonLayout({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
