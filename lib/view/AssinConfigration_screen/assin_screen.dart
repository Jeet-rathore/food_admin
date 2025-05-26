import 'package:flutter/material.dart';
import 'package:foodapp_admin/Widgets/comman.dart';

// Import your common widgets
// import 'common_widgets.dart';

class AssignConfigurationScreen extends StatefulWidget {
  const AssignConfigurationScreen({super.key});

  @override
  State<AssignConfigurationScreen> createState() =>
      _AssignConfigurationScreenState();
}

class _AssignConfigurationScreenState extends State<AssignConfigurationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _entriesPerPage = 10;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showTrackingDetails(BuildContext context, String orderId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const TrackingDetailsDialog(orderId: 'ORD1234');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // Header - Fixed height
            Container(
              padding: const EdgeInsets.all(16.0),
              child: CommonHeader(
                title: 'Assign Configuration',
                icon: Icons.assignment,
                additionalAction: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Colors.blue),
                ),
              ),
            ),

            // Main Content - Flexible to fill remaining space
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Tab Bar - Fixed height
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: TabBar(
                          controller: _tabController,
                          tabs: [
                            Tab(
                              height: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.fiber_new, size: 20),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'New Deliveries',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Tab(
                              height: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.sync, size: 20),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'In Process',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Tab(
                              height: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.check_circle, size: 20),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Closed',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          labelColor: Colors.blue[700],
                          unselectedLabelColor: Colors.grey[600],
                          indicatorColor: Colors.blue[700],
                          indicatorWeight: 3,
                          labelStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          unselectedLabelStyle: const TextStyle(fontSize: 12),
                        ),
                      ),

                      // Table Controls - Fixed height
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey[200]!),
                          ),
                        ),
                        child: TableControlsWidget(
                          entriesPerPage: _entriesPerPage,
                          onEntriesChanged: (value) {
                            setState(() {
                              _entriesPerPage = value;
                            });
                          },
                          additionalControls: Row(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.track_changes, size: 16),
                                label: const Text('Track Orders'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.refresh, size: 16),
                                label: const Text('Refresh'),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Tab Content - Flexible to fill remaining space
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            _buildNewDeliveriesTab(),
                            _buildInProcessDeliveriesTab(),
                            _buildClosedDeliveriesTab(),
                          ],
                        ),
                      ),

                      // Pagination - Fixed height
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey[200]!),
                          ),
                        ),
                        child: PaginationWidget(
                          onPrevious: () {},
                          onNext: () {},
                          canGoNext: true,
                          canGoPrevious: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildNewDeliveriesTab() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Table Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                _buildHeaderCell('SL', flex: 1),
                _buildHeaderCell('Ryder Info', flex: 3),
                _buildHeaderCell('Phone', flex: 2),
                _buildHeaderCell('Pickup Location', flex: 4),
                _buildHeaderCell('Drop Location', flex: 4),
                _buildHeaderCell('Status', flex: 2),
                _buildHeaderCell('Select', flex: 1),
                _buildHeaderCell('Action', flex: 2),
              ],
            ),
          ),

          // Table Body - Scrollable
          Expanded(
            child: ListView.builder(
              itemCount: 15, // More items to show scrolling
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: index % 2 == 0 ? Colors.grey[50] : Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[200]!),
                    ),
                  ),
                  child: Row(
                    children: [
                      _buildDataCell('${index + 1}', flex: 1),
                      _buildDataCell(
                        ProfileAvatarWidget(name: 'Raj ${index + 1}'),
                        flex: 3,
                        isWidget: true,
                      ),
                      _buildDataCell('+91 73234 567${89 + index}', flex: 2),
                      _buildDataCell(
                        'Sector ${String.fromCharCode(65 + (index % 26))} - LNM Chicken, Barra Chorki, ${index + 1}st Street',
                        flex: 4,
                      ),
                      _buildDataCell(
                        'Borne St - Shop No. ${123 + index}, Vijay Nagar, ${index + 1}rd Lane',
                        flex: 4,
                      ),
                      _buildDataCell(
                        StatusWidget(isActive: index % 3 != 2),
                        flex: 2,
                        isWidget: true,
                      ),
                      _buildDataCell(
                        Checkbox(
                          value: index % 2 == 0,
                          onChanged: (value) {},
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        flex: 1,
                        isWidget: true,
                      ),
                      _buildDataCell(
                        ElevatedButton(
                          onPressed:
                              () => _showTrackingDetails(
                                context,
                                'ORD123${index + 4}',
                              ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            minimumSize: const Size(70, 32),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            'Allot',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                        flex: 2,
                        isWidget: true,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInProcessDeliveriesTab() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Table Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                _buildHeaderCell('SL', flex: 1),
                _buildHeaderCell('Order ID', flex: 3),
                _buildHeaderCell('Delivery ID', flex: 2),
                _buildHeaderCell('Ryder ID', flex: 2),
                _buildHeaderCell('Pickup Location', flex: 3),
                _buildHeaderCell('Drop Location', flex: 3),
                _buildHeaderCell('Time Slot', flex: 2),
                _buildHeaderCell('Status', flex: 2),
              ],
            ),
          ),

          // Table Body - Scrollable
          Expanded(
            child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: index % 2 == 0 ? Colors.grey[50] : Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[200]!),
                    ),
                  ),
                  child: Row(
                    children: [
                      _buildDataCell('${index + 1}', flex: 1),
                      _buildDataCell(
                        '00-D${(index + 10).toString().padLeft(2, '0')}-123${index}CAG-01',
                        flex: 3,
                      ),
                      _buildDataCell('D124EFG${456 + index}', flex: 2),
                      _buildDataCell('RY65432${index + 1}', flex: 2),
                      _buildDataCell(
                        'Sector ${String.fromCharCode(65 + (index % 26))} - LNM Chicken, Barra Chorki',
                        flex: 3,
                      ),
                      _buildDataCell(
                        'Borne St - Shop No. ${123 + index}, Vijay Nagar',
                        flex: 3,
                      ),
                      _buildDataCell(
                        '${10 + (index % 3)}:00 AM - ${10 + (index % 3)}:30 AM',
                        flex: 2,
                      ),
                      _buildDataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'In Process',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        flex: 2,
                        isWidget: true,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClosedDeliveriesTab() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Table Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                _buildHeaderCell('Delivery ID', flex: 2),
                _buildHeaderCell('Ryder ID', flex: 2),
                _buildHeaderCell('Pickup Location', flex: 3),
                _buildHeaderCell('Drop Location', flex: 3),
                _buildHeaderCell('Time Slot', flex: 2),
                _buildHeaderCell('Delivery Type', flex: 2),
                _buildHeaderCell('Items', flex: 1),
                _buildHeaderCell('Status', flex: 2),
              ],
            ),
          ),

          // Table Body - Scrollable
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: index % 2 == 0 ? Colors.grey[50] : Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[200]!),
                    ),
                  ),
                  child: Row(
                    children: [
                      _buildDataCell('D124EFG${456 + index}', flex: 2),
                      _buildDataCell('RY65432${index + 1}', flex: 2),
                      _buildDataCell(
                        'Sector ${String.fromCharCode(65 + (index % 26))} - LNM Chicken, Barra Chorki',
                        flex: 3,
                      ),
                      _buildDataCell(
                        'Borne St - Shop No. ${123 + index}, Vijay Nagar',
                        flex: 3,
                      ),
                      _buildDataCell(
                        '${10 + (index % 3)}:00 AM - ${10 + (index % 3)}:30 AM',
                        flex: 2,
                      ),
                      _buildDataCell(
                        ['Frozen Fruits', 'Fresh Fruits', 'Bulk Carton'][index %
                            3],
                        flex: 2,
                      ),
                      _buildDataCell('${(index % 10) + 1}', flex: 1),
                      _buildDataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green[600],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Completed',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        flex: 2,
                        isWidget: true,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String text, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildDataCell(
    dynamic content, {
    required int flex,
    bool isWidget = false,
  }) {
    return Expanded(
      flex: flex,
      child:
          isWidget
              ? content
              : Text(
                content.toString(),
                style: const TextStyle(fontSize: 11),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
    );
  }
}

// Tracking Details Dialog - Made responsive
class TrackingDetailsDialog extends StatelessWidget {
  final String orderId;

  const TrackingDetailsDialog({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: screenWidth * 0.6, // 60% of screen width
        height: screenHeight * 0.8, // 80% of screen height
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.blue[700],
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Live Tracking Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, size: 24),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey[100],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Map Placeholder - Responsive
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue[100]!, Colors.blue[200]!],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue[300]!),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.map, size: 64, color: Colors.blue[600]),
                          const SizedBox(height: 12),
                          Text(
                            'Live Map View',
                            style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Real-time delivery tracking',
                            style: TextStyle(
                              color: Colors.blue[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Mock location pins
                    Positioned(
                      top: 60,
                      left: 100,
                      child: _buildMapPin(Icons.store, Colors.green, 'Pickup'),
                    ),
                    Positioned(
                      top: 80,
                      right: 120,
                      child: _buildMapPin(Icons.home, Colors.red, 'Drop'),
                    ),
                    Positioned(
                      bottom: 100,
                      left: 150,
                      child: _buildMapPin(
                        Icons.delivery_dining,
                        Colors.orange,
                        'Ryder',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Order Details - Responsive
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order ID',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              orderId,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.orange[400]!,
                                Colors.orange[600]!,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Out For Delivery',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Location Info
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 18,
                          color: Colors.orange[600],
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black87,
                              ),
                              children: [
                                const TextSpan(
                                  text: 'Current Location: Ryder is ',
                                ),
                                TextSpan(
                                  text: '2.5 KMs',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.orange[600],
                                  ),
                                ),
                                const TextSpan(text: ' from delivery address'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 18,
                          color: Colors.green[600],
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Estimated Arrival: 12-15 Minutes',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.green[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Progress Steps
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildProgressStep('Order\nPlaced', true, false),
                          _buildProgressLine(true),
                          _buildProgressStep('Order\nPicked', true, false),
                          _buildProgressLine(true),
                          _buildProgressStep('Out for\nDelivery', true, true),
                          _buildProgressLine(false),
                          _buildProgressStep('Arriving\nSoon', false, false),
                          _buildProgressLine(false),
                          _buildProgressStep('Delivered', false, false),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Contact Info
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blue[100],
                            child: Text(
                              'JD',
                              style: TextStyle(
                                color: Colors.blue[700],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'John Doe',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Delivery Partner',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '+91 91941 56789',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.phone, size: 18),
                    label: const Text('Call Ryder'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.chat, size: 18),
                    label: const Text('Message'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.report_problem, size: 18),
                    label: const Text('Report Issue'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapPin(IconData icon, Color color, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 4,
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 16),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 2),
            ],
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressStep(String label, bool isCompleted, bool isActive) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color:
                isCompleted
                    ? Colors.green
                    : (isActive ? Colors.orange : Colors.grey[300]),
            shape: BoxShape.circle,
            boxShadow:
                isActive || isCompleted
                    ? [
                      BoxShadow(
                        color: (isCompleted ? Colors.green : Colors.orange)
                            .withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 4,
                      ),
                    ]
                    : null,
          ),
          child: Icon(
            isCompleted
                ? Icons.check
                : (isActive ? Icons.local_shipping : Icons.circle),
            size: 16,
            color: isCompleted || isActive ? Colors.white : Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            color: isCompleted || isActive ? Colors.black87 : Colors.grey[600],
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressLine(bool isCompleted) {
    return Container(
      width: 40,
      height: 3,
      margin: const EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
        color: isCompleted ? Colors.green : Colors.grey[300],
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}

// Common Header Widget (from your provided code, included here for completeness)

class TableControlsWidget extends StatelessWidget {
  final int entriesPerPage;
  final Function(int) onEntriesChanged;
  final Widget? additionalControls;

  const TableControlsWidget({
    super.key,
    required this.entriesPerPage,
    required this.onEntriesChanged,
    this.additionalControls,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Show',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: DropdownButton<int>(
                value: entriesPerPage,
                underline: const SizedBox(),
                isDense: true,
                items:
                    [10, 25, 50, 100].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(
                          value.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                onChanged: (newValue) {
                  if (newValue != null) {
                    onEntriesChanged(newValue);
                  }
                },
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'entries per page',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ],
        ),
        if (additionalControls != null) additionalControls!,
      ],
    );
  }
}

class StatusWidget extends StatelessWidget {
  final bool isActive;

  const StatusWidget({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? Colors.green[100] : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isActive ? Colors.green[300]! : Colors.grey[400]!,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: isActive ? Colors.green : Colors.grey[500],
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              isActive ? 'Active' : 'Inactive',
              style: TextStyle(
                color: isActive ? Colors.green[700] : Colors.grey[700],
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileAvatarWidget extends StatelessWidget {
  final String name;
  final String? initial;

  const ProfileAvatarWidget({super.key, required this.name, this.initial});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: Colors.blue[100],
          child: Text(
            initial ?? name.substring(0, 1).toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              color: Colors.blue[700],
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'RYD${name.hashCode.abs() % 1000}',
                style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Pagination Widget - Enhanced for full screen
class PaginationWidget extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final bool canGoNext;
  final bool canGoPrevious;

  const PaginationWidget({
    super.key,
    required this.onPrevious,
    required this.onNext,
    required this.canGoNext,
    required this.canGoPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Showing 1 to 10 of 50 entries',
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
        Row(
          children: [
            IconButton(
              onPressed: canGoPrevious ? onPrevious : null,
              icon: const Icon(Icons.chevron_left),
              style: IconButton.styleFrom(
                backgroundColor:
                    canGoPrevious ? Colors.blue[50] : Colors.grey[100],
                foregroundColor:
                    canGoPrevious ? Colors.blue[700] : Colors.grey[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '1',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 4),
            TextButton(
              onPressed: () {},
              child: const Text('2'),
              style: TextButton.styleFrom(foregroundColor: Colors.grey[600]),
            ),
            const SizedBox(width: 4),
            TextButton(
              onPressed: () {},
              child: const Text('3'),
              style: TextButton.styleFrom(foregroundColor: Colors.grey[600]),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: canGoNext ? onNext : null,
              icon: const Icon(Icons.chevron_right),
              style: IconButton.styleFrom(
                backgroundColor: canGoNext ? Colors.blue[50] : Colors.grey[100],
                foregroundColor:
                    canGoNext ? Colors.blue[700] : Colors.grey[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
