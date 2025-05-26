import 'package:flutter/material.dart';
import 'package:foodapp_admin/Them/colour.dart';
import 'package:foodapp_admin/Widgets/comman.dart';

class EditBuyerScreen extends StatelessWidget {
  const EditBuyerScreen({super.key});

  Widget buildLabeledField({
    required IconData icon,
    required String label,
    Color iconColor = Colors.black,
  }) {
    return Stack(
      children: [
        Container(
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.grey.shade400),
          ),
          alignment: Alignment.centerLeft,
          child: Text(' ', style: TextStyle(color: Colors.grey.shade600)),
        ),
        Positioned(
          left: 5,
          top: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            color: AppColors.lightYellow,
            child: Row(
              children: [
                Icon(icon, size: 14, color: iconColor),
                const SizedBox(width: 4),
                Text(
                  label,
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCityDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('City', style: TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: 55,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: const [
              Icon(Icons.location_city, size: 20, color: Colors.orange),
              SizedBox(width: 8),
              Text('Select City', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              const CommonHeader(title: 'Edit Buyer', icon: Icons.edit),

              const SizedBox(height: 12),
              const Center(
                child: Text(
                  'Edit Buyer Details',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'General Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Row(
                        children: [
                          Expanded(
                            child: buildLabeledField(
                              icon: Icons.badge,
                              label: 'Buyer ID',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: buildLabeledField(
                              icon: Icons.person,
                              label: 'First Name',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: buildLabeledField(
                              icon: Icons.person,
                              label: 'Last Name',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: buildLabeledField(
                              icon: Icons.email,
                              label: 'Email',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: buildLabeledField(
                              icon: Icons.phone,
                              label: 'Contact No.',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: buildLabeledField(
                              icon: Icons.phone_android,
                              label: 'Office No.',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: buildLabeledField(
                              icon: Icons.location_on,
                              label: 'Door No . /House NO.',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: buildLabeledField(
                              icon: Icons.map,
                              label: 'Street Area',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: buildLabeledField(
                              icon: Icons.location_on,
                              label: 'Locality',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: buildCityDropdown()),
                          const SizedBox(width: 12),
                          Expanded(
                            child: buildLabeledField(
                              icon: Icons.pin_drop,
                              label: 'Pin Code',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () => Navigator.pop(context),

                            label: const Text(
                              'Cancel',
                              style: TextStyle(color: AppColors.darkYellow),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.lightYellow,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton.icon(
                            onPressed: () {},

                            label: const Text('Update'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.darkYellow,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
