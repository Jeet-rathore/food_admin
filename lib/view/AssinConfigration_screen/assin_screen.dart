import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header
            CommonHeader(
              title: 'Assign Configuration',
              icon: Icons.assignment,
              additionalAction: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 16),

            // Tab Controls
            Container(
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
                  // Tab Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      tabs: [
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.fiber_new, size: 16),
                              const SizedBox(width: 4),
                              const Text('New Deliveries'),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.sync, size: 16),
                              const SizedBox(width: 4),
                              const Text('In Process Deliveries'),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.check_circle, size: 16),
                              const SizedBox(width: 4),
                              const Text('Closed Deliveries'),
                            ],
                          ),
                        ),
                      ],
                      labelColor: Colors.blue[700],
                      unselectedLabelColor: Colors.grey[600],
                      indicatorColor: Colors.blue[700],
                      labelStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      unselectedLabelStyle: const TextStyle(fontSize: 12),
                    ),
                  ),

                  // Table Controls
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TableControlsWidget(
                      entriesPerPage: _entriesPerPage,
                      onEntriesChanged: (value) {
                        setState(() {
                          _entriesPerPage = value;
                        });
                      },
                      additionalControls: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                            ),
                            child: const Text(
                              'Track Your Orders',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Tab Content
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildNewDeliveriesTab(),
                        _buildInProcessDeliveriesTab(),
                        _buildClosedDeliveriesTab(),
                      ],
                    ),
                  ),

                  // Pagination
                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
          ],
        ),
      ),
    );
  }

  Widget _buildNewDeliveriesTab() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(Colors.grey[800]),
        headingTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        dataTextStyle: const TextStyle(fontSize: 11),
        columnSpacing: 16,
        horizontalMargin: 16,
        columns: const [
          DataColumn(label: Text('SL No.')),
          DataColumn(label: Text('Ryder Name')),
          DataColumn(label: Text('Ryder ID')),
          DataColumn(label: Text('Phone No.')),
          DataColumn(label: Text('Pickup Location')),
          DataColumn(label: Text('Drop Location')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Check Box')),
          DataColumn(label: Text('Allot')),
        ],
        rows: List.generate(
          10,
          (index) => DataRow(
            cells: [
              DataCell(Text('${index + 1}')),
              DataCell(ProfileAvatarWidget(name: 'Raj')),
              DataCell(Text('RYD${(index + 10).toString().padLeft(2, '0')}')),
              DataCell(Text('+91 73234 56789')),
              DataCell(
                const Text(
                  'Sector A - LNM Chicken, Barra Chorki, 2nd Street',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              DataCell(
                const Text(
                  'Borne St - Shop No. 123, Vijay Nagar, 3rd Lane',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              DataCell(StatusWidget(isActive: index % 3 != 2)),
              DataCell(Checkbox(value: index % 2 == 0, onChanged: (value) {})),
              DataCell(
                ElevatedButton(
                  onPressed:
                      () => _showTrackingDetails(context, 'ORD123${index + 4}'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    minimumSize: const Size(60, 24),
                  ),
                  child: const Text('Allot', style: TextStyle(fontSize: 10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInProcessDeliveriesTab() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(Colors.grey[800]),
        headingTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        dataTextStyle: const TextStyle(fontSize: 11),
        columnSpacing: 16,
        horizontalMargin: 16,
        columns: const [
          DataColumn(label: Text('SL No.')),
          DataColumn(label: Text('Order ID')),
          DataColumn(label: Text('Delivery ID')),
          DataColumn(label: Text('Ryder ID')),
          DataColumn(label: Text('Pickup Location')),
          DataColumn(label: Text('Drop Location')),
          DataColumn(label: Text('Delivery Slot Time')),
          DataColumn(label: Text('Allot')),
        ],
        rows: List.generate(
          10,
          (index) => DataRow(
            cells: [
              DataCell(Text('${index + 1}')),
              DataCell(
                Text(
                  '00-D${(index + 10).toString().padLeft(2, '0')}-123${index}CAG-01',
                ),
              ),
              DataCell(Text('D124EFG456')),
              DataCell(Text('RY654321')),
              DataCell(
                const Text(
                  'Sector A - LNM Chicken, Barra Chorki, 2nd Street',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              DataCell(
                const Text(
                  'Borne St - Shop No. 123, Vijay Nagar, 3rd Lane',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              DataCell(
                const Text(
                  '10:00 AM - 10:30 AM',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              DataCell(
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'In Process',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClosedDeliveriesTab() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(Colors.grey[800]),
        headingTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        dataTextStyle: const TextStyle(fontSize: 11),
        columnSpacing: 16,
        horizontalMargin: 16,
        columns: const [
          DataColumn(label: Text('Delivery ID')),
          DataColumn(label: Text('Ryder ID')),
          DataColumn(label: Text('Pickup Location')),
          DataColumn(label: Text('Drop Location')),
          DataColumn(label: Text('Delivery Slot Time')),
          DataColumn(label: Text('Type Of Delivery')),
          DataColumn(label: Text('No. of Items')),
          DataColumn(label: Text('Status')),
        ],
        rows: List.generate(
          10,
          (index) => DataRow(
            cells: [
              DataCell(Text('D124EFG456')),
              DataCell(Text('RY654321')),
              DataCell(
                const Text(
                  'Sector A - LNM Chicken, Barra Chorki, 2nd Street',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              DataCell(
                const Text(
                  'Borne St - Shop No. 123, Vijay Nagar, 3rd Lane',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              DataCell(
                const Text(
                  '10:00 AM - 10:30 AM',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              DataCell(
                Text(
                  ['Frozen Fruits', 'Fresh Fruits', 'Bulk Carton'][index % 3],
                  style: const TextStyle(fontSize: 10),
                ),
              ),
              DataCell(Text('${(index % 10) + 1}')),
              DataCell(
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Closed',
                    style: TextStyle(color: Colors.white, fontSize: 10),
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

// Tracking Details Dialog
class TrackingDetailsDialog extends StatelessWidget {
  final String orderId;

  const TrackingDetailsDialog({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.blue),
                    const SizedBox(width: 8),
                    const Text(
                      'Tracking Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Map Placeholder
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue[200]!),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.map, size: 48, color: Colors.blue[400]),
                        const SizedBox(height: 8),
                        Text(
                          'Map View',
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Mock location pins
                  Positioned(
                    top: 40,
                    left: 80,
                    child: Icon(Icons.location_on, color: Colors.red, size: 24),
                  ),
                  Positioned(
                    top: 60,
                    right: 100,
                    child: Icon(
                      Icons.location_on,
                      color: Colors.green,
                      size: 24,
                    ),
                  ),
                  Positioned(
                    bottom: 80,
                    left: 120,
                    child: Icon(
                      Icons.delivery_dining,
                      color: Colors.orange,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Order Details
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order ID - $orderId',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Out For Delivery',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Current Location: Ryder is 2 KMs from',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const Text(
                    'Delivering Address',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'Estimated Arrival: 15 Mins',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 12),

                  // Progress Steps
                  Row(
                    children: [
                      _buildProgressStep('Order Placed', true, true),
                      _buildProgressLine(true),
                      _buildProgressStep('Picked up\nOrder', true, true),
                      _buildProgressLine(true),
                      _buildProgressStep('Out for\nDelivery', true, false),
                      _buildProgressLine(false),
                      _buildProgressStep('Arriving\nSoon', false, false),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Contact Info
                  Row(
                    children: [
                      const Icon(Icons.person, size: 16),
                      const SizedBox(width: 4),
                      const Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.phone, size: 16),
                      const SizedBox(width: 4),
                      const Text(
                        '+91 91941 56789',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.delivery_dining, size: 16),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Call Ryder'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Track & Report'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressStep(String label, bool isCompleted, bool isActive) {
    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color:
                isCompleted
                    ? Colors.green
                    : (isActive ? Colors.orange : Colors.grey[300]),
            shape: BoxShape.circle,
          ),
          child: Icon(
            isCompleted ? Icons.check : Icons.circle,
            size: 12,
            color: isCompleted || isActive ? Colors.white : Colors.grey[600],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 8,
            color: isCompleted || isActive ? Colors.black : Colors.grey[600],
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressLine(bool isCompleted) {
    return Expanded(
      child: Container(
        height: 2,
        color: isCompleted ? Colors.green : Colors.grey[300],
        margin: const EdgeInsets.only(bottom: 24),
      ),
    );
  }
}

// Common Header Widget (from your provided code, included here for completeness)
class CommonHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? additionalAction;

  const CommonHeader({
    super.key,
    required this.title,
    required this.icon,
    this.additionalAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 24, color: Colors.grey[600]),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (additionalAction != null) ...[
                const SizedBox(width: 16),
                additionalAction!,
              ],
            ],
          ),
          Row(
            children: [
              Container(
                width: 250,
                height: 36,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[400],
                      size: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Icon(Icons.refresh, color: Colors.grey[600], size: 20),
              const SizedBox(width: 16),
              Icon(
                Icons.notifications_outlined,
                color: Colors.grey[600],
                size: 20,
              ),
              const SizedBox(width: 16),
              const UserProfileWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

// User Profile Widget (from your provided code)
class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Pavan',
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Manager',
              style: TextStyle(fontSize: 10, color: Colors.grey[500]),
            ),
          ],
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          radius: 14,
          backgroundColor: Colors.blue[100],
          child: Icon(Icons.person, size: 16, color: Colors.blue[700]),
        ),
      ],
    );
  }
}

// Other common widgets (from your provided code)
class PaginationWidget extends StatelessWidget {
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final bool canGoNext;
  final bool canGoPrevious;

  const PaginationWidget({
    super.key,
    this.onPrevious,
    this.onNext,
    this.canGoNext = true,
    this.canGoPrevious = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: canGoPrevious ? onPrevious : null,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.chevron_left,
                      size: 18,
                      color: canGoPrevious ? Colors.black : Colors.grey,
                    ),
                    Text(
                      'Previous',
                      style: TextStyle(
                        fontSize: 14,
                        color: canGoPrevious ? Colors.black : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              onTap: canGoNext ? onNext : null,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 14,
                        color: canGoNext ? Colors.black : Colors.grey,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 18,
                      color: canGoNext ? Colors.black : Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

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
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButton<int>(
                value: entriesPerPage,
                underline: const SizedBox(),
                isDense: true,
                items:
                    [10, 25, 50, 100].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                onChanged: (newValue) {
                  if (newValue != null) {
                    onEntriesChanged(newValue);
                  }
                },
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Records',
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
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: isActive ? Colors.white : Colors.grey[600],
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 3),
          Flexible(
            child: Text(
              isActive ? 'Active' : 'Inactive',
              style: TextStyle(
                color: isActive ? Colors.white : Colors.grey[600],
                fontSize: 10,
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
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: Colors.blue[100],
          child: Text(
            initial ?? name.substring(0, 1).toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              color: Colors.blue[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            name,
            style: const TextStyle(fontSize: 13),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
