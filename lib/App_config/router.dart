import 'package:flutter/material.dart';
import 'package:foodapp_admin/view/Auth_screen/Loigin_Screen.dart';
import 'package:foodapp_admin/view/Auth_screen/sinup_screen.dart';
import 'package:foodapp_admin/view/Home_screen/manage_admin.dart';
import 'package:foodapp_admin/view/Manage_rider/ride_screnn.dart';
import 'package:foodapp_admin/view/manage_buyer/Buyer_screen.dart';
import 'package:foodapp_admin/view/manager_seller/seller.dart';

import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'LoginScreen',
      builder:
          (BuildContext context, GoRouterState state) =>
              RiderManagementScreen(),
    ),
    GoRoute(
      path: '/forget_password',
      name: "forgetpassword",
      builder:
          (BuildContext context, GoRouterState state) =>
              const ResetPasswordScreen(),
    ),
    GoRoute(
      path: '/Admi-screen',
      name: "Adminscreen",
      builder:
          (BuildContext context, GoRouterState state) =>
              const AdminManagementScreen(),
    ),
  ],
);
