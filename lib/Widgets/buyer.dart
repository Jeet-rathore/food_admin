import 'package:flutter/material.dart';
import 'package:foodapp_admin/Models/buyer_model.dart';
import 'package:foodapp_admin/Widgets/comman.dart';

// Buyer Data Table Widget
class BuyerDataTable extends StatelessWidget {
  final List<Buyer> buyers;
  final Function(Buyer) onEdit;
  final Function(Buyer) onDelete;

  const BuyerDataTable({
    super.key,
    required this.buyers,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          _buildTableHeader(),
          Expanded(
            child: ListView.builder(
              itemCount: buyers.length,
              itemBuilder: (context, index) => _buildTableRow(buyers[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      color: Colors.grey[800],
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: const Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'Sl. No.',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Name',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Email ID',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Contact No.',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Type',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Actions',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(Buyer buyer) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('${buyer.id}', style: const TextStyle(fontSize: 13)),
          ),
          Expanded(flex: 2, child: ProfileAvatarWidget(name: buyer.name)),
          Expanded(
            flex: 2,
            child: Text(
              buyer.email,
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              buyer.contact,
              style: const TextStyle(fontSize: 13),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(flex: 1, child: StatusWidget(isActive: buyer.isActive)),
          Expanded(
            flex: 1,
            child: ActionButtonsWidget(
              onEdit: () => onEdit(buyer),
              onDelete: () => onDelete(buyer),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Text Field Widget for Buyer Form
class BuyerFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final IconData icon;
  final Color? iconColor;

  const BuyerFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 14, color: iconColor ?? Colors.grey[600]),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
          ),
        ),
      ],
    );
  }
}

// City Dropdown Widget for Buyer Form
class CityDropdownWidget extends StatelessWidget {
  final String selectedCity;
  final Function(String?) onChanged;

  const CityDropdownWidget({
    super.key,
    required this.selectedCity,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.location_city, size: 14, color: Colors.grey[600]),
            const SizedBox(width: 4),
            Text(
              'City / Town',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey[600],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCity,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              dropdownColor: Colors.grey[700],
              items: const [
                DropdownMenuItem(
                  value: 'Select City',
                  child: Text('Select City'),
                ),
                DropdownMenuItem(value: 'Mumbai', child: Text('Mumbai')),
                DropdownMenuItem(value: 'Delhi', child: Text('Delhi')),
                DropdownMenuItem(value: 'Bangalore', child: Text('Bangalore')),
                DropdownMenuItem(value: 'Chennai', child: Text('Chennai')),
              ],
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

// Form Action Buttons Widget for Buyer Form
class FormActionButtons extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final String saveText;

  const FormActionButtons({
    super.key,
    required this.onCancel,
    required this.onSave,
    this.saveText = 'Save',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 40,
          child: ElevatedButton(
            onPressed: onCancel,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
              foregroundColor: Colors.grey[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          width: 100,
          height: 40,
          child: ElevatedButton(
            onPressed: onSave,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
            ),
            child: Text(
              saveText,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
