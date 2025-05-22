import 'package:flutter/material.dart';
import 'package:foodapp_admin/Models/rider_model.dart';
import 'package:foodapp_admin/Widgets/comman.dart';
import 'package:foodapp_admin/view/Manage_rider/add_ride.dart';
import 'package:foodapp_admin/view/Manage_rider/edit_ride.dart'
    show EditRiderScreen;
import 'package:foodapp_admin/view/manage_catogary/catogrt.dart';

// Main Rider Management Screen
class RiderManagementScreen extends StatefulWidget {
  @override
  _RiderManagementScreenState createState() => _RiderManagementScreenState();
}

class _RiderManagementScreenState extends State<RiderManagementScreen> {
  int entriesPerPage = 10;
  List<Rider> riders = List.generate(
    12,
    (index) => Rider(
      name: 'Raj Joshith',
      riderId: 'ID: 4512347',
      contactNo: '+91 91234 56789',
      vehicleInfo: 'Vehicle Name: TVS Jupiter\nV Number: AP 04 AA 1111',
      type: 'F',
      isActive: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryManagementScreen(),
                  ),
                );
              },
              child: CommonHeader(
                title: 'Manage Ryder',
                icon: Icons.motorcycle,
                additionalAction: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddRiderScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Add Ryder',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TableControlsWidget(
              entriesPerPage: entriesPerPage,
              onEntriesChanged: (value) {
                setState(() {
                  entriesPerPage = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Table Header
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: Text(
                              'SL No.',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              'Name',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            child: Text(
                              'Ryder ID',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 140,
                            child: Text(
                              'Contact No.',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: Text(
                              'Riding Vehicle',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: Text(
                              'Type',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              'Status',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          Text(
                            'Actions',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Table Rows
                    Expanded(
                      child: ListView.builder(
                        itemCount: riders.length,
                        itemBuilder: (context, index) {
                          final rider = riders[index];
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey[200]!),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: ProfileAvatarWidget(name: rider.name),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    rider.riderId,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                                SizedBox(
                                  width: 140,
                                  child: Text(
                                    rider.contactNo,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                                SizedBox(
                                  width: 180,
                                  child: Text(
                                    rider.vehicleInfo,
                                    style: const TextStyle(fontSize: 10),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  width: 60,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Text(
                                      'F',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                  child: StatusWidget(isActive: rider.isActive),
                                ),
                                ActionButtonsWidget(
                                  onEdit: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditRiderScreen(),
                                      ),
                                    );
                                  },
                                  onDelete: () {
                                    _showDeleteDialog(context, index);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            PaginationWidget(
              onPrevious: () {
                // Handle previous page
              },
              onNext: () {
                // Handle next page
              },
              canGoPrevious: true,
              canGoNext: true,
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Rider'),
          content: const Text('Are you sure you want to delete this rider?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  riders.removeAt(index);
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Rider deleted successfully')),
                );
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
