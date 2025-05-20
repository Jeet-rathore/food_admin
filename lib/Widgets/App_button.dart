import 'package:flutter/material.dart';
import 'package:foodapp_admin/Them/colour.dart';
import 'package:go_router/go_router.dart';

class CommonButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const CommonButton({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:
          onPressed ??
          () {
            context.go('/Admi-screen');
          },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange, // Or AppColors.buttonColor
        foregroundColor: Colors.white, // Text color
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(label, style: const TextStyle(fontSize: 18)),
    );
  }
}
