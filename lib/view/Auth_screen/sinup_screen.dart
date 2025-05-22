import 'package:flutter/material.dart';
import 'package:foodapp_admin/App_config/assets.dart';
import 'package:foodapp_admin/Them/colour.dart';
import 'package:foodapp_admin/Them/sizeconfig.dart';
import 'package:foodapp_admin/Them/spacing.dart';
import 'package:foodapp_admin/Widgets/App_button.dart';
import 'package:foodapp_admin/Widgets/common_textfield.dart';
import 'package:foodapp_admin/Widgets/common_layout.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.lightYellow,
      body: Row(
        children: [
          const CommonLayout(imagePath: Assets.Applogo),
          Expanded(
            flex: 1,
            child: Padding(
              padding: Spacing.pxy(12, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 40),
                  Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.brownText,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Enter email",
                    style: TextStyle(
                      color: AppColors.brownText,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  CommonTextField(hintText: "Raj@gmail.com", icon: Icons.email),
                  SizedBox(height: 20),
                  Text(
                    "Create New Password",
                    style: TextStyle(
                      color: AppColors.brownText,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  CommonTextField(
                    hintText: "********",
                    icon: Icons.lock,
                    obscure: true,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Confirm New Password",
                    style: TextStyle(
                      color: AppColors.brownText,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  CommonTextField(
                    hintText: "********",
                    icon: Icons.lock,
                    obscure: true,
                  ),
                  SizedBox(height: 30),
                  Center(child: CommonButton(label: "Submit")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
