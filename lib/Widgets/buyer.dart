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
              itemBuilder:
                  (context, index) => _buildTableRow(index + 1, buyers[index]),
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
          Expanded(flex: 1, child: Text('Sl. No.', style: _headerStyle)),
          Expanded(flex: 2, child: Text('Name', style: _headerStyle)),
          Expanded(flex: 2, child: Text('Email ID', style: _headerStyle)),
          Expanded(flex: 2, child: Text('Contact No.', style: _headerStyle)),
          Expanded(flex: 1, child: Text('Type', style: _headerStyle)),
          Expanded(flex: 1, child: Text('Actions', style: _headerStyle)),
        ],
      ),
    );
  }

  Widget _buildTableRow(int index, Buyer buyer) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('$index', style: const TextStyle(fontSize: 13)),
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

const TextStyle _headerStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontSize: 14,
);

// Status Widget
class StatusWidget extends StatelessWidget {
  final bool isActive;

  const StatusWidget({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.only(right: 6),
          decoration: BoxDecoration(
            color: isActive ? Colors.green : Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
        Text(
          isActive ? 'Active' : 'Inactive',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isActive ? Colors.green : Colors.grey,
          ),
        ),
      ],
    );
  }
}
