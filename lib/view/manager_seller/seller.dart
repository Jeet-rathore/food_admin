import 'package:flutter/material.dart';
import 'package:foodapp_admin/Models/seller_models.dart';
import 'package:foodapp_admin/Widgets/comman.dart';
import 'package:foodapp_admin/view/Manage_rider/ride_screnn.dart';
import 'package:foodapp_admin/view/manager_seller/edit_screen.dart';

// Your existing common widgets would be imported here
// import 'common_widgets.dart';

class SellerListScreen extends StatefulWidget {
  @override
  _SellerListScreenState createState() => _SellerListScreenState();
}

class _SellerListScreenState extends State<SellerListScreen> {
  int _entriesPerPage = 10;
  int _currentPage = 1;
  List<SellerData> _sellers = [];

  @override
  void initState() {
    super.initState();
    _loadSellers();
  }

  void _loadSellers() {
    // Sample data - replace with your actual data loading
    _sellers = List.generate(50, (index) {
      return SellerData(
        id: index + 1,
        name: 'Big SmartN',
        email: 'bigsmart@gmail.com',
        contact: '+91 73374 52390',
        type: index % 3 == 0 ? 'Inactive' : 'Active',
        isActive: index % 3 != 0,
      );
    });
  }

  void _editSeller(SellerData seller) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditSellerScreen(seller: seller)),
    );
  }

  void _deleteSeller(SellerData seller) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Delete Seller'),
            content: Text('Are you sure you want to delete ${seller.name}?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _sellers.remove(seller);
                  });
                  Navigator.pop(context);
                },
                child: Text('Delete'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final startIndex = (_currentPage - 1) * _entriesPerPage;
    final endIndex = (startIndex + _entriesPerPage).clamp(0, _sellers.length);
    final displayedSellers = _sellers.sublist(startIndex, endIndex);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RiderManagementScreen(),
                  ),
                );
              },
              child: CommonHeader(title: 'Manage Seller', icon: Icons.store),
            ),
            SizedBox(height: 16),

            // Table Controls
            TableControlsWidget(
              entriesPerPage: _entriesPerPage,
              onEntriesChanged: (value) {
                setState(() {
                  _entriesPerPage = value;
                  _currentPage = 1;
                });
              },
            ),
            SizedBox(height: 16),

            // Data Table
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Table Header
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Table(
                        columnWidths: {
                          0: FixedColumnWidth(60),
                          1: FlexColumnWidth(2),
                          2: FlexColumnWidth(2.5),
                          3: FlexColumnWidth(2),
                          4: FlexColumnWidth(1.5),
                          5: FlexColumnWidth(1.5),
                        },
                        children: [
                          TableRow(
                            children: [
                              _buildHeaderCell('Sl. No.'),
                              _buildHeaderCell('Name'),
                              _buildHeaderCell('Email ID'),
                              _buildHeaderCell('Contact No.'),
                              _buildHeaderCell('Type'),
                              _buildHeaderCell('Actions'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Table Body
                    Expanded(
                      child: SingleChildScrollView(
                        child: Table(
                          columnWidths: {
                            0: FixedColumnWidth(60),
                            1: FlexColumnWidth(2),
                            2: FlexColumnWidth(2.5),
                            3: FlexColumnWidth(2),
                            4: FlexColumnWidth(1.5),
                            5: FlexColumnWidth(1.5),
                          },
                          children:
                              displayedSellers.map((seller) {
                                return TableRow(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey[200]!,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  children: [
                                    _buildDataCell(seller!.id.toString()),
                                    _buildDataCellWithWidget(
                                      ProfileAvatarWidget(
                                        name: seller.name,
                                        initial: 'B',
                                      ),
                                    ),
                                    _buildDataCell(seller.email),
                                    _buildDataCell(seller.contact),
                                    _buildDataCellWithWidget(
                                      StatusWidget(isActive: seller.isActive),
                                    ),
                                    _buildDataCellWithWidget(
                                      ActionButtonsWidget(
                                        onEdit: () => _editSeller(seller),
                                        onDelete: () => _deleteSeller(seller),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Pagination
            PaginationWidget(
              canGoPrevious: _currentPage > 1,
              canGoNext: endIndex < _sellers.length,
              onPrevious: () {
                if (_currentPage > 1) {
                  setState(() {
                    _currentPage--;
                  });
                }
              },
              onNext: () {
                if (endIndex < _sellers.length) {
                  setState(() {
                    _currentPage++;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildDataCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(text, style: TextStyle(fontSize: 13)),
    );
  }

  Widget _buildDataCellWithWidget(Widget widget) {
    return Padding(padding: const EdgeInsets.all(12.0), child: widget);
  }
}

// Edit Seller Screen
// Data Models
