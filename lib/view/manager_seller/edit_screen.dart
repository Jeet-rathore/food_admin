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
  late TextEditingController _pinCodeController;
  late TextEditingController _businessNameController;
  late TextEditingController _businessTypeController;

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
    _pinCodeController = TextEditingController();
    _businessNameController = TextEditingController();
    _businessTypeController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _pinCodeController.dispose();
    _businessNameController.dispose();
    _businessTypeController.dispose();
    super.dispose();
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
              title: widget.seller == null ? 'Add Seller' : 'Edit Seller',
              icon: Icons.edit,
            ),
            SizedBox(height: 24),

            // Form Content
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Edit Seller Details',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 24),

                        // General Information Section
                        _buildSectionHeader('General Information'),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildFormField(
                                label: 'First Name',
                                controller: _firstNameController,
                                isRequired: true,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: _buildFormField(
                                label: 'Last Name',
                                controller: _lastNameController,
                                isRequired: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildFormField(
                                label: 'Email',
                                controller: _emailController,
                                isRequired: true,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: _buildFormField(
                                label: 'Phone Number',
                                controller: _phoneController,
                                isRequired: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32),

                        // Address Section
                        _buildSectionHeader('Address'),
                        SizedBox(height: 16),
                        _buildFormField(
                          label: 'Street Address',
                          controller: _addressController,
                          maxLines: 2,
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildFormField(
                                label: 'City',
                                controller: _cityController,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: _buildFormField(
                                label: 'Pin Code',
                                controller: _pinCodeController,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32),

                        // Business Information Section
                        _buildSectionHeader('Business Information'),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildFormField(
                                label: 'Business Name',
                                controller: _businessNameController,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: _buildFormField(
                                label: 'Business Type',
                                controller: _businessTypeController,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32),

                        // Action Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancel'),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            ElevatedButton(
                              onPressed: _saveChanges,
                              child: Text('Update'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
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

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.grey[700],
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    bool isRequired = false,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            children: [
              if (isRequired)
                TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
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
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
      ],
    );
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      // Save logic here
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Seller updated successfully!')));
      Navigator.pop(context);
    }
  }
}
