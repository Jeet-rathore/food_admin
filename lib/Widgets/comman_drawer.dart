import 'package:flutter/material.dart';
import 'package:foodapp_admin/view/Add-product/product_screen.dart';
import 'package:foodapp_admin/view/AssinConfigration_screen/assin_screen.dart';
import 'package:foodapp_admin/view/Manage_rider/add_ride.dart';
import 'package:foodapp_admin/view/manage_buyer/buyer_screen.dart';

import 'package:foodapp_admin/view/manage_catogary/catogrt.dart';
import 'package:foodapp_admin/view/manage_vechail/vechali_screen.dart';

import 'package:foodapp_admin/view/manager_seller/seller.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.orange),
            child: Center(
              child: Text(
                'Admin Panel',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          _buildDrawerItem(
            context,
            Icons.admin_panel_settings,
            "Buyer Admin",
            const BuyerManagementScreen(),
          ),
          _buildDrawerItem(
            context,
            Icons.shopping_bag,
            "seller Buyers",
            SellerListScreen(),
          ),
          _buildDrawerItem(context, Icons.store, "Add rider", AddRiderScreen()),
          _buildDrawerItem(
            context,
            Icons.fastfood,
            "Manage catogary",
            CategoryManagementScreen(),
          ),
          _buildDrawerItem(
            context,
            Icons.list_alt,
            "manage product",
            ProductManagementScreen(),
          ),
          _buildDrawerItem(
            context,
            Icons.bar_chart,
            "manage assignconfigration",
            AssignConfigurationScreen(),
          ),
          _buildDrawerItem(
            context,
            Icons.settings,
            "manage vichali",
            VehicleManagementScreen(),
          ),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(
    BuildContext context,
    IconData icon,
    String title,
    Widget screen,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // close drawer
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}
