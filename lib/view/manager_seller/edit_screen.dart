import 'package:flutter/material.dart';
import 'package:foodapp_admin/Models/seller_models.dart';
import 'package:foodapp_admin/Widgets/comman.dart';

class EditSellerScreen extends StatefulWidget {
  final SellerData? seller;

  const EditSellerScreen({Key? key, this.seller}) : super(key: key);

  @override
  _EditSellerScreenState createState() => _EditSellerScreenState();
}

class _EditSellerScreenState extends State<EditSellerScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _cityController;
  late TextEditingController _stateController;
  late TextEditingController _pinCodeController;
  late TextEditingController _businessNameController;
  late TextEditingController _panCardController;
  late TextEditingController _aadharCardController;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _firstNameController = TextEditingController(
      text: widget.seller?.name.split(' ').first ?? '',
    );
    _lastNameController = TextEditingController(
      text: widget.seller?.name.split(' ').last ?? '',
    );
    _emailController = TextEditingController(text: widget.seller?.email ?? '');
    _phoneController = TextEditingController(
      text: widget.seller?.contact ?? '',
    );
    _addressController = TextEditingController();
    _cityController = TextEditingController();
    _stateController = TextEditingController();
    _pinCodeController = TextEditingController();
    _businessNameController = TextEditingController();
    _panCardController = TextEditingController();
    _aadharCardController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _pinCodeController.dispose();
    _businessNameController.dispose();
    _panCardController.dispose();
    _aadharCardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Header
            CommonHeader(title: 'Edit Seller', icon: Icons.edit),
            SizedBox(height: 20),

            // Form Content
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Edit Seller Details',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        SizedBox(height: 30),

                        // General Information Section
                        Text(
                          'General Information',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 15),

                        Row(
                          children: [
                            Expanded(
                              child: _buildFormField(
                                label: 'First Name',
                                controller: _firstNameController,
                                icon: Icons.person,
                                isRequired: true,
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: _buildFormField(
                                label: 'Last Name',
                                controller: _lastNameController,
                                icon: Icons.person_outline,
                                isRequired: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),

                        Row(
                          children: [
                            Expanded(
                              child: _buildFormField(
                                label: 'Email ID',
                                controller: _emailController,
                                icon: Icons.email,
                                isRequired: true,
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: _buildFormField(
                                label: 'Contact Number',
                                controller: _phoneController,
                                icon: Icons.phone,
                                isRequired: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),

                        _buildFormField(
                          label: 'Office Number',
                          controller: TextEditingController(),
                          icon: Icons.phone_in_talk,
                        ),
                        SizedBox(height: 25),

                        // Address Section
                        Text(
                          'Address',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 15),

                        _buildFormField(
                          label: 'Door No./House No.',
                          controller: _addressController,
                          icon: Icons.home,
                        ),
                        SizedBox(height: 15),

                        Row(
                          children: [
                            Expanded(
                              child: _buildFormField(
                                label: 'Street/Area',
                                controller: TextEditingController(),
                                icon: Icons.location_on,
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: _buildFormField(
                                label: 'Select Locality',
                                controller: TextEditingController(),
                                icon: Icons.location_city,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),

                        Row(
                          children: [
                            Expanded(
                              child: _buildDropdownField(
                                label: 'Select City',
                                icon: Icons.location_city,
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: _buildDropdownField(
                                label: 'Select City',
                                icon: Icons.location_city,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),

                        _buildFormField(
                          label: 'Pin Code',
                          controller: _pinCodeController,
                          icon: Icons.pin_drop,
                        ),
                        SizedBox(height: 25),

                        // Business Information Section
                        Text(
                          'Business Information',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 15),

                        Row(
                          children: [
                            Expanded(
                              child: _buildFormField(
                                label: 'Business Detail/Image',
                                controller: _businessNameController,
                                icon: Icons.business,
                                hasAttachment: true,
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: _buildFormField(
                                label: 'Aadhar Card',
                                controller: _aadharCardController,
                                icon: Icons.credit_card,
                                hasAttachment: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),

                        _buildFormField(
                          label: 'PAN Card',
                          controller: _panCardController,
                          icon: Icons.credit_card_outlined,
                          hasAttachment: true,
                        ),
                        SizedBox(height: 40),

                        // Action Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 120,
                              child: OutlinedButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  side: BorderSide(color: Colors.grey[300]!),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              width: 120,
                              child: ElevatedButton(
                                onPressed: _saveChanges,
                                child: Text('Update'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool isRequired = false,
    bool hasAttachment = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 8),
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: 40,
                      right: hasAttachment ? 40 : 12,
                      top: 12,
                      bottom: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Colors.grey[50],
                  ),
                  validator:
                      isRequired
                          ? (value) {
                            if (value == null || value.isEmpty) {
                              return '$label is required';
                            }
                            return null;
                          }
                          : null,
                ),
              ),
              // Label with icon positioned at top left
              Positioned(
                left: 8,
                top: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  color: Colors.white,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon, size: 16, color: Colors.grey[600]),
                      SizedBox(width: 4),
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Attachment icon if needed
              if (hasAttachment)
                Positioned(
                  right: 8,
                  top: 16,
                  child: Icon(
                    Icons.attach_file,
                    size: 16,
                    color: Colors.grey[500],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({required String label, required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 8),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: 40,
                      right: 12,
                      top: 12,
                      bottom: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Colors.grey[50],
                  ),
                  items: [
                    DropdownMenuItem(value: 'option1', child: Text('Option 1')),
                    DropdownMenuItem(value: 'option2', child: Text('Option 2')),
                  ],
                  onChanged: (value) {},
                ),
              ),
              // Label with icon positioned at top left
              Positioned(
                left: 8,
                top: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  color: Colors.white,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon, size: 16, color: Colors.grey[600]),
                      SizedBox(width: 4),
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Seller updated successfully!')));
      Navigator.pop(context);
    }
  }
}
