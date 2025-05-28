import 'package:flutter/material.dart';
import 'package:foodapp_admin/Widgets/comman.dart'
    show ActionButtonsWidget, CommonHeader;
import 'package:foodapp_admin/view/AssinConfigration_screen/assin_screen.dart';

// Vehicle Data Model
class Vehicle {
  final int slNo;
  final String vehicleType;
  final String vehicleName;
  final String vehicleNumber;
  final String riderDriver;
  final bool isActive;

  Vehicle({
    required this.slNo,
    required this.vehicleType,
    required this.vehicleName,
    required this.vehicleNumber,
    required this.riderDriver,
    required this.isActive,
  });
}

// Main Vehicle Management Screen
class VehicleManagementScreen extends StatefulWidget {
  @override
  _VehicleManagementScreenState createState() =>
      _VehicleManagementScreenState();
}

class _VehicleManagementScreenState extends State<VehicleManagementScreen> {
  int entriesPerPage = 10;
  List<Vehicle> vehicles = [
    Vehicle(
      slNo: 1,
      vehicleType: 'Bike',
      vehicleName: 'Pulsar 150',
      vehicleNumber: 'AP 09 AB 1113',
      riderDriver: 'Kumar\nM Krish',
      isActive: true,
    ),
    Vehicle(
      slNo: 2,
      vehicleType: 'Auto',
      vehicleName: 'Auto\nTata Magic',
      vehicleNumber: 'AP 09 AB 1113',
      riderDriver: 'Kumar\nM Krish',
      isActive: true,
    ),
    Vehicle(
      slNo: 3,
      vehicleType: 'Taxi',
      vehicleName: 'Tata Magic\nExpresso',
      vehicleNumber: 'AP 09 AB 1113',
      riderDriver: 'Kumar\nM Krish',
      isActive: true,
    ),
    Vehicle(
      slNo: 4,
      vehicleType: 'Van',
      vehicleName: 'Bajaj Apo Xtra',
      vehicleNumber: 'AP 09 AB 1113',
      riderDriver: 'Kumar\nM Krish',
      isActive: true,
    ),
    Vehicle(
      slNo: 5,
      vehicleType: 'Bike',
      vehicleName: 'Pulsar 150',
      vehicleNumber: 'AP 09 AB 1113',
      riderDriver: 'Kumar\nM Krish',
      isActive: true,
    ),
  ];

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
              title: 'Manage Vehicle',
              icon: Icons.directions_car,
              additionalAction: _buildAddButton(),
            ),
            const SizedBox(height: 16),

            // Table Controls
            TableControlsWidget(
              entriesPerPage: entriesPerPage,
              onEntriesChanged: (value) {
                setState(() {
                  entriesPerPage = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Vehicle Table
            Expanded(child: _buildVehicleTable()),

            // Pagination
            PaginationWidget(
              canGoPrevious: true,
              canGoNext: true,
              onNext: () {},
              onPrevious: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(4),
      ),
      child: InkWell(
        onTap: () => _showAddVehicleDialog(),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, color: Colors.white, size: 16),
            SizedBox(width: 4),
            Text(
              'Add Vehicle',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleTable() {
    return Container(
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                Expanded(flex: 1, child: _buildHeaderCell('Sl No.')),
                Expanded(flex: 2, child: _buildHeaderCell('Vehicle Type')),
                Expanded(flex: 2, child: _buildHeaderCell('Vehicle Name')),
                Expanded(flex: 2, child: _buildHeaderCell('Vehicle Number')),
                Expanded(flex: 2, child: _buildHeaderCell('Ryder / Driver')),
                Expanded(flex: 1, child: _buildHeaderCell('Status')),
                Expanded(flex: 1, child: _buildHeaderCell('Actions')),
              ],
            ),
          ),

          // Table Body
          Expanded(
            child: ListView.builder(
              itemCount: vehicles.length,
              itemBuilder: (context, index) {
                final vehicle = vehicles[index];
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey[200]!, width: 1),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: _buildDataCell(vehicle.slNo.toString()),
                      ),
                      Expanded(
                        flex: 2,
                        child: _buildDataCell(vehicle.vehicleType),
                      ),
                      Expanded(
                        flex: 2,
                        child: _buildDataCell(vehicle.vehicleName),
                      ),
                      Expanded(
                        flex: 2,
                        child: _buildDataCell(vehicle.vehicleNumber),
                      ),
                      Expanded(
                        flex: 2,
                        child: ProfileAvatarWidget(
                          name: vehicle.riderDriver,
                          initial: 'K',
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: StatusWidget(isActive: vehicle.isActive),
                      ),
                      Expanded(
                        flex: 1,
                        child: ActionButtonsWidget(
                          onEdit: () => _showEditVehicleDialog(vehicle),
                          onDelete: () => _showDeleteDialog(vehicle),
                        ),
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

  Widget _buildHeaderCell(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Colors.grey[700],
      ),
    );
  }

  Widget _buildDataCell(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 12),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  void _showAddVehicleDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return VehicleDialog(
          title: 'Add Vehicle Details',
          isEdit: false,
          onSave: (vehicleData) {
            // Handle add vehicle logic
            setState(() {
              vehicles.add(
                Vehicle(
                  slNo: vehicles.length + 1,
                  vehicleType: vehicleData['vehicleType'],
                  vehicleName: vehicleData['vehicleName'],
                  vehicleNumber: vehicleData['vehicleNumber'],
                  riderDriver: vehicleData['riderDriver'],
                  isActive: true,
                ),
              );
            });
            Navigator.of(context).pop();

            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Vehicle added successfully!'),
                backgroundColor: Colors.green,
              ),
            );
          },
        );
      },
    );
  }

  void _showEditVehicleDialog(Vehicle vehicle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return VehicleDialog(
          title: 'Vehicle Edit Details',
          isEdit: true,
          initialData: vehicle,
          onSave: (vehicleData) {
            // Handle edit vehicle logic
            setState(() {
              int index = vehicles.indexWhere((v) => v.slNo == vehicle.slNo);
              if (index != -1) {
                vehicles[index] = Vehicle(
                  slNo: vehicle.slNo,
                  vehicleType: vehicleData['vehicleType'],
                  vehicleName: vehicleData['vehicleName'],
                  vehicleNumber: vehicleData['vehicleNumber'],
                  riderDriver: vehicleData['riderDriver'],
                  isActive: vehicle.isActive,
                );
              }
            });
            Navigator.of(context).pop();

            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Vehicle updated successfully!'),
                backgroundColor: Colors.green,
              ),
            );
          },
        );
      },
    );
  }

  void _showDeleteDialog(Vehicle vehicle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Row(
            children: [
              const Icon(Icons.warning, color: Colors.orange),
              const SizedBox(width: 8),
              const Text('Confirm Delete'),
            ],
          ),
          content: Text(
            'Are you sure you want to delete ${vehicle.vehicleName}?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle delete logic
                setState(() {
                  vehicles.removeWhere((v) => v.slNo == vehicle.slNo);
                });
                Navigator.of(context).pop();

                // Show success message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Vehicle deleted successfully!'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
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

// Vehicle Dialog Widget
class VehicleDialog extends StatefulWidget {
  final String title;
  final bool isEdit;
  final Vehicle? initialData;
  final Function(Map<String, dynamic>) onSave;

  const VehicleDialog({
    super.key,
    required this.title,
    required this.isEdit,
    this.initialData,
    required this.onSave,
  });

  @override
  _VehicleDialogState createState() => _VehicleDialogState();
}

class _VehicleDialogState extends State<VehicleDialog> {
  final _formKey = GlobalKey<FormState>();
  String? selectedVehicleType;
  final TextEditingController _vehicleNameController = TextEditingController();
  final TextEditingController _vehicleNumberController =
      TextEditingController();
  final TextEditingController _riderDriverController = TextEditingController();

  final List<String> vehicleTypes = ['Bike', 'Auto', 'Taxi', 'Van'];

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && widget.initialData != null) {
      selectedVehicleType = widget.initialData!.vehicleType;
      _vehicleNameController.text = widget.initialData!.vehicleName;
      _vehicleNumberController.text = widget.initialData!.vehicleNumber;
      _riderDriverController.text = widget.initialData!.riderDriver;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dialog Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Text(
                widget.isEdit ? 'Edit Vehicle' : 'Add Vehicle',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Vehicle Information',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),

              // Vehicle Type Dropdown
              _buildDropdownField(
                label: 'Vehicle Type',
                value: selectedVehicleType,
                items: vehicleTypes,
                onChanged: (value) {
                  setState(() {
                    selectedVehicleType = value;
                  });
                },
              ),
              const SizedBox(height: 12),

              // Vehicle Name Field
              _buildTextField(
                label: 'Vehicle Name',
                controller: _vehicleNameController,
                hintText: 'Enter the Vehicle Name',
              ),
              const SizedBox(height: 12),

              // Vehicle Number Field
              _buildTextField(
                label: 'Vehicle Number',
                controller: _vehicleNumberController,
                hintText: 'Enter the Vehicle Number',
              ),
              const SizedBox(height: 12),

              // Rider/Driver Field
              _buildTextField(
                label: 'Rider / Driver',
                controller: _riderDriverController,
                hintText: 'Enter the Ryder / Driver',
              ),
              const SizedBox(height: 24),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _handleSave,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        widget.isEdit ? 'Update' : 'Save',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.star, color: Colors.red, size: 8),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey[100],
          ),
          child: DropdownButton<String>(
            value: value,
            hint: Text(
              'Select $label',
              style: TextStyle(color: Colors.grey[500]),
            ),
            isExpanded: true,
            underline: const SizedBox(),
            items:
                items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.star, color: Colors.red, size: 8),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
        ),
      ],
    );
  }

  void _handleSave() {
    if (_formKey.currentState!.validate() && selectedVehicleType != null) {
      final vehicleData = {
        'vehicleType': selectedVehicleType,
        'vehicleName': _vehicleNameController.text,
        'vehicleNumber': _vehicleNumberController.text,
        'riderDriver': _riderDriverController.text,
      };
      widget.onSave(vehicleData);
    } else {
      // Show validation error if vehicle type is not selected
      if (selectedVehicleType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a vehicle type'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _vehicleNameController.dispose();
    _vehicleNumberController.dispose();
    _riderDriverController.dispose();
    super.dispose();
  }
}
