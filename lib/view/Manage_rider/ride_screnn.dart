import 'package:flutter/material.dart';
import 'package:foodapp_admin/Models/rider_model.dart';
import 'package:foodapp_admin/Widgets/comman.dart';
import 'package:foodapp_admin/view/Manage_rider/add_ride.dart';
import 'package:foodapp_admin/view/Manage_rider/edit_ride.dart'
    show EditRiderScreen;

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Header Section with Back Button
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    tooltip: 'Back',
                  ),
                  Expanded(
                    child: CommonHeader(
                      title: 'Manage Ryder',
                      icon: Icons.motorcycle,
                      additionalAction: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amber.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
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
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Controls Section
            Container(
              width: double.infinity,
              child: TableControlsWidget(
                entriesPerPage: entriesPerPage,
                onEntriesChanged: (value) {
                  setState(() {
                    entriesPerPage = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),

            // Main Table Section - Full Width
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Table Header - Responsive
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          // Responsive column widths based on screen size
                          SizedBox(
                            width: screenWidth * 0.06,
                            child: _headerText('SL No.'),
                          ),
                          SizedBox(
                            width: screenWidth * 0.18,
                            child: _headerText('Rider Name'),
                          ),
                          SizedBox(
                            width: screenWidth * 0.12,
                            child: _headerText('Rider ID'),
                          ),
                          SizedBox(
                            width: screenWidth * 0.15,
                            child: _headerText('Contact Number'),
                          ),
                          SizedBox(
                            width: screenWidth * 0.22,
                            child: _headerText('Vehicle Information'),
                          ),
                          SizedBox(
                            width: screenWidth * 0.08,
                            child: _headerText('Status'),
                          ),
                          Expanded(child: _headerText('Actions')),
                        ],
                      ),
                    ),

                    // Table Body - Scrollable with full width
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: riders.length,
                          itemBuilder: (context, index) {
                            final rider = riders[index];
                            return Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey[200]!,
                                    width: 1,
                                  ),
                                ),
                                color:
                                    index % 2 == 0
                                        ? Colors.grey[50]
                                        : Colors.white,
                              ),
                              child: Row(
                                children: [
                                  // Serial Number
                                  SizedBox(
                                    width: screenWidth * 0.06,
                                    child: Text(
                                      '${index + 1}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),

                                  // Rider Name with Avatar
                                  SizedBox(
                                    width: screenWidth * 0.18,
                                    child: ProfileAvatarWidget(
                                      name: rider.name,
                                    ),
                                  ),

                                  // Rider ID
                                  SizedBox(
                                    width: screenWidth * 0.12,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        rider.riderId,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Contact Number
                                  SizedBox(
                                    width: screenWidth * 0.15,
                                    child: Text(
                                      rider.contactNo,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),

                                  // Vehicle Information
                                  SizedBox(
                                    width: screenWidth * 0.22,
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          color: Colors.grey[300]!,
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        rider.vehicleInfo,
                                        style: const TextStyle(
                                          fontSize: 11,
                                          height: 1.3,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),

                                  // Status
                                  SizedBox(
                                    width: screenWidth * 0.08,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            rider.isActive
                                                ? Colors.green.withOpacity(0.1)
                                                : Colors.red.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color:
                                              rider.isActive
                                                  ? Colors.green
                                                  : Colors.red,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CircleAvatar(
                                            radius: 4,
                                            backgroundColor:
                                                rider.isActive
                                                    ? Colors.green
                                                    : Colors.red,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            rider.isActive
                                                ? 'Active'
                                                : 'Inactive',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  rider.isActive
                                                      ? Colors.green[700]
                                                      : Colors.red[700],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  // Actions
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.blue.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.edit,
                                              color: Colors.blue,
                                              size: 18,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) =>
                                                          EditRiderScreen(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                              size: 18,
                                            ),
                                            onPressed:
                                                () => _showDeleteDialog(
                                                  context,
                                                  index,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Pagination Section - Full Width
            Container(
              width: double.infinity,
              child: PaginationWidget(
                onPrevious: () {},
                onNext: () {},
                canGoPrevious: true,
                canGoNext: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerText(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Colors.white,
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Row(
            children: [
              Icon(Icons.warning, color: Colors.red, size: 24),
              const SizedBox(width: 8),
              const Text(
                'Delete Rider',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: const Text(
            'Are you sure you want to delete this rider? This action cannot be undone.',
            style: TextStyle(fontSize: 14),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  riders.removeAt(index);
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Rider deleted successfully'),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
