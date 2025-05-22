import 'package:flutter/material.dart';
import 'package:foodapp_admin/Models/buyer_model.dart';
import 'package:foodapp_admin/Widgets/buyer.dart';
import 'package:foodapp_admin/Widgets/comman.dart';

class EditBuyerScreen extends StatefulWidget {
  final Buyer buyer;

  const EditBuyerScreen({super.key, required this.buyer});

  @override
  State<EditBuyerScreen> createState() => _EditBuyerScreenState();
}

class _EditBuyerScreenState extends State<EditBuyerScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _panIdController;
  late TextEditingController _contactController;
  late TextEditingController _officeController;
  late TextEditingController _streetController;
  late TextEditingController _areaController;
  late TextEditingController _pinCodeController;
  String _selectedCity = 'Select City';

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(
      text: widget.buyer.firstName ?? '',
    );
    _lastNameController = TextEditingController(
      text: widget.buyer.lastName ?? '',
    );
    _panIdController = TextEditingController(text: widget.buyer.panId ?? '');
    _contactController = TextEditingController(
      text: widget.buyer.contactNumber ?? '',
    );
    _officeController = TextEditingController(
      text: widget.buyer.officeNumber ?? '',
    );
    _streetController = TextEditingController(
      text: widget.buyer.streetArea ?? '',
    );
    _areaController = TextEditingController(
      text: widget.buyer.areaLocality ?? '',
    );
    _pinCodeController = TextEditingController(
      text: widget.buyer.pinCode ?? '',
    );
    _selectedCity = widget.buyer.city ?? 'Select City';
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _panIdController.dispose();
    _contactController.dispose();
    _officeController.dispose();
    _streetController.dispose();
    _areaController.dispose();
    _pinCodeController.dispose();
    super.dispose();
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
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              const CommonHeader(title: 'Edit Buyer', icon: Icons.edit),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Edit Buyer Details',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(height: 24),
                        _buildGeneralInformationSection(),
                        const SizedBox(height: 24),
                        _buildAddressSection(),
                        const SizedBox(height: 32),
                        FormActionButtons(
                          onCancel: () => Navigator.pop(context),
                          onSave: _saveBuyer,
                          saveText: 'Update',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGeneralInformationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'General Information',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: BuyerFormField(
                controller: _firstNameController,
                label: 'First Name',
                hintText: 'Enter Your First Name',
                icon: Icons.person_outline,
                iconColor: Colors.orange,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: BuyerFormField(
                controller: _lastNameController,
                label: 'Last Name',
                hintText: 'Enter Your Last Name',
                icon: Icons.person_outline,
                iconColor: Colors.orange,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: BuyerFormField(
                controller: _panIdController,
                label: 'Pan Id',
                hintText: 'Enter Pan ID',
                icon: Icons.credit_card,
                iconColor: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: BuyerFormField(
                controller: _contactController,
                label: 'Contact Number',
                hintText: 'Enter Your Contact Number',
                icon: Icons.phone,
                iconColor: Colors.orange,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Expanded(child: SizedBox()),
            const SizedBox(width: 16),
            Expanded(
              child: BuyerFormField(
                controller: _officeController,
                label: 'Office Number',
                hintText: 'Enter Your Office Contact Number',
                icon: Icons.phone,
                iconColor: Colors.orange,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAddressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: BuyerFormField(
                controller: _streetController,
                label: 'Street Area',
                hintText: 'Enter Your Street Area',
                icon: Icons.location_on_outlined,
                iconColor: Colors.orange,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: BuyerFormField(
                controller: _areaController,
                label: 'Area Locality',
                hintText: 'Enter Your Area / Locality',
                icon: Icons.location_on_outlined,
                iconColor: Colors.orange,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CityDropdownWidget(
                selectedCity: _selectedCity,
                onChanged: (value) {
                  setState(() {
                    _selectedCity = value!;
                  });
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: BuyerFormField(
                controller: _pinCodeController,
                label: 'Pin Code',
                hintText: 'Enter Your Pin Code',
                icon: Icons.location_on_outlined,
                iconColor: Colors.orange,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _saveBuyer() {
    if (_formKey.currentState!.validate()) {
      // Here you would typically save the buyer data
      // For now, we'll just navigate back
      Navigator.pop(context);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Buyer updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
}
