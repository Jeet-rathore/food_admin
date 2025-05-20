import 'package:flutter/material.dart';
import 'package:foodapp_admin/App_config/assets.dart';
import 'package:foodapp_admin/Them/colour.dart';
import 'package:foodapp_admin/Widgets/App_button.dart';
import 'package:foodapp_admin/Widgets/common_textfield.dart';
import 'package:foodapp_admin/Widgets/widgets/common_layout.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightYellow,
      body: Row(
        children: [
          const CommonLayout(imagePath: Assets.Applogo),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "User ID",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.brownText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const CommonTextField(
                    hintText: 'Enter User ID',
                    icon: Icons.person,
                    fillColor: Colors.white, // Background color
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.brownText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const CommonTextField(
                    hintText: 'Enter Password',
                    icon: Icons.lock,
                    obscure: true,
                    fillColor: Colors.white, // Background color
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        context.go('/forget_password');
                      },
                      child: const Text(
                        "Forget Password",
                        style: TextStyle(color: AppColors.brownText),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Centered Login Button
                  Center(child: CommonButton(label: 'Login')),
                  const SizedBox(height: 10),

                  // Centered Sign Up
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Sign Up / Create Account",
                        style: TextStyle(color: AppColors.blue),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Center(child: Text("Or")),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage(Assets.Googleicon),
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(width: 20),
                      Image(
                        image: AssetImage(Assets.Instgramicon),
                        width: 35,
                        height: 35,
                      ),
                      SizedBox(width: 20),
                      Image(
                        image: AssetImage(Assets.Whatsappicon),
                        width: 35,
                        height: 35,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
