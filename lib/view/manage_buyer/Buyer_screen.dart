import 'package:flutter/material.dart';
import 'package:foodapp_admin/Models/buyer_model.dart';
import 'package:foodapp_admin/Widgets/buyer.dart';
import 'package:foodapp_admin/Widgets/comman.dart';
import 'package:foodapp_admin/view/manage_buyer/edit.dart';
import 'package:foodapp_admin/view/manager_seller/seller.dart';

class BuyerManagementScreen extends StatefulWidget {
  const BuyerManagementScreen({super.key});

  @override
  State<BuyerManagementScreen> createState() => _BuyerManagementScreenState();
}

class _BuyerManagementScreenState extends State<BuyerManagementScreen> {
  List<Buyer> buyers = [
    Buyer(
      id: 1,
      name: "Raj Joshth",
      email: "raj@gmail.com",
      contact: "+91 93234 56789",
      isActive: true,
    ),
    Buyer(
      id: 2,
      name: "Raj Joshth",
      email: "raj@gmail.com",
      contact: "+91 93234 56789",
      isActive: true,
    ),
    Buyer(
      id: 3,
      name: "Raj Joshth",
      email: "raj@gmail.com",
      contact: "+91 93234 56789",
      isActive: false,
    ),
    Buyer(
      id: 4,
      name: "Raj Joshth",
      email: "raj@gmail.com",
      contact: "+91 93234 56789",
      isActive: false,
    ),
    Buyer(
      id: 5,
      name: "Raj Joshth",
      email: "raj@gmail.com",
      contact: "+91 93234 56789",
      isActive: true,
    ),
    Buyer(
      id: 6,
      name: "Raj Joshth",
      email: "raj@gmail.com",
      contact: "+91 93234 56789",
      isActive: true,
    ),
    Buyer(
      id: 7,
      name: "Raj Joshth",
      email: "raj@gmail.com",
      contact: "+91 93234 56789",
      isActive: false,
    ),
    Buyer(
      id: 8,
      name: "Raj Joshth",
      email: "raj@gmail.com",
      contact: "+91 93234 56789",
      isActive: false,
    ),
  ];

  int _entriesPerPage = 10;
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SellerListScreen()),
                  );
                },
                child: CommonHeader(title: 'Manage Buyer', icon: Icons.group),
              ),
              const SizedBox(height: 16),
              Expanded(child: _buildDataTable()),
              const SizedBox(height: 16),
              PaginationWidget(
                onPrevious: _currentPage > 0 ? _previousPage : null,
                onNext: _canGoNext() ? _nextPage : null,
                canGoPrevious: _currentPage > 0,
                canGoNext: _canGoNext(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TableControlsWidget(
          entriesPerPage: _entriesPerPage,
          onEntriesChanged: (value) {
            setState(() {
              _entriesPerPage = value;
              _currentPage = 0;
            });
          },
        ),
        const SizedBox(height: 12),
        Expanded(
          child: BuyerDataTable(
            buyers: _getCurrentPageBuyers(),
            onEdit: _editBuyer,
            onDelete: _deleteBuyer,
          ),
        ),
      ],
    );
  }

  List<Buyer> _getCurrentPageBuyers() {
    final startIndex = _currentPage * _entriesPerPage;
    final endIndex = startIndex + _entriesPerPage;
    return buyers.sublist(
      startIndex,
      endIndex > buyers.length ? buyers.length : endIndex,
    );
  }

  bool _canGoNext() {
    return (_currentPage + 1) * _entriesPerPage < buyers.length;
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
    }
  }

  void _nextPage() {
    if (_canGoNext()) {
      setState(() {
        _currentPage++;
      });
    }
  }

  void _editBuyer(Buyer buyer) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditBuyerScreen(buyer: buyer)),
    );
  }

  void _deleteBuyer(Buyer buyer) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Delete Buyer'),
            content: Text('Are you sure you want to delete ${buyer.name}?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    buyers.removeWhere((b) => b.id == buyer.id);
                  });
                  Navigator.pop(context);
                },
                child: const Text('Delete'),
              ),
            ],
          ),
    );
  }
}
