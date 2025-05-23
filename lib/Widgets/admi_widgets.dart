import 'package:flutter/material.dart';
import 'package:foodapp_admin/Models/admin_model.dart';
import 'package:foodapp_admin/Widgets/comman.dart';

// Custom Form Field Widget for Admin
class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String label;
  final String hintText;
  final bool isPassword;
  final MaterialColor themeColor;

  const CustomFormField({
    super.key,
    required this.controller,
    required this.icon,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.themeColor = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: themeColor.shade200),
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade500),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ),
        Positioned(
          top: -2,
          left: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFBEB),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 16, color: Colors.black),
                const SizedBox(width: 4),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDropdownField extends StatelessWidget {
  final String value;
  final List<String> items;
  final Function(String?) onChanged;
  final IconData icon;
  final String label;
  final MaterialColor themeColor;

  const CustomDropdownField({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.icon,
    required this.label,
    this.themeColor = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: themeColor.shade200),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
            icon: const Icon(Icons.keyboard_arrow_down),
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
        Positioned(
          top: -2,
          left: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFBEB),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 16, color: Colors.black),
                const SizedBox(width: 4),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Updated Admin Data Table Widget with fixed alignment
class AdminDataTable extends StatelessWidget {
  final List<Admin> admins;
  final int startIndex;
  final Function(Admin) onEdit;
  final Function(Admin) onDelete;

  const AdminDataTable({
    super.key,
    required this.admins,
    required this.startIndex,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5),
        ],
      ),
      child: Column(
        children: [
          // Header Row
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: const Row(
              children: [
                Expanded(flex: 1, child: _TableHeader('SL No.')),
                Expanded(flex: 3, child: _TableHeader('Name')),
                Expanded(flex: 3, child: _TableHeader('Email ID')),
                Expanded(flex: 2, child: _TableHeader('Role')),
                Expanded(flex: 2, child: _TableHeader('Status')),
                Expanded(flex: 2, child: _TableHeader('Actions')),
              ],
            ),
          ),
          // Data Rows
          Expanded(
            child: ListView.builder(
              itemCount: admins.length,
              itemBuilder: (context, index) {
                final admin = admins[index];
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Serial Number
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          child: Text(
                            '${startIndex + index + 1}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // Name with Avatar - Fixed alignment
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 40,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.orange.shade100,
                                child: Text(
                                  admin.name.isNotEmpty
                                      ? admin.name[0].toUpperCase()
                                      : 'A',
                                  style: TextStyle(
                                    color: Colors.orange.shade700,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  admin.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Email - Fixed alignment
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 40,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            admin.email,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      // Role
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          child: Text(
                            admin.role,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      // Status
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  admin.isActive
                                      ? Colors.green.shade100
                                      : Colors.red.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              admin.isActive ? 'Active' : 'Inactive',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color:
                                    admin.isActive
                                        ? Colors.green.shade700
                                        : Colors.red.shade700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Actions
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () => onEdit(admin),
                                icon: const Icon(Icons.edit_outlined),
                                color: Colors.blue,
                                iconSize: 20,
                                constraints: const BoxConstraints(
                                  minWidth: 32,
                                  minHeight: 32,
                                ),
                                padding: EdgeInsets.zero,
                                tooltip: 'Edit',
                              ),
                              const SizedBox(width: 4),
                              IconButton(
                                onPressed: () => onDelete(admin),
                                icon: const Icon(Icons.delete_outline),
                                color: Colors.red,
                                iconSize: 20,
                                constraints: const BoxConstraints(
                                  minWidth: 32,
                                  minHeight: 32,
                                ),
                                padding: EdgeInsets.zero,
                                tooltip: 'Delete',
                              ),
                            ],
                          ),
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
}

class _TableHeader extends StatelessWidget {
  final String text;

  const _TableHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }
}

// Admin Form Modal Widget
class AdminFormModal extends StatefulWidget {
  final bool isEditing;
  final Admin? admin;
  final Function(String, String, String, bool) onSave;
  final VoidCallback onClose;

  const AdminFormModal({
    super.key,
    required this.isEditing,
    this.admin,
    required this.onSave,
    required this.onClose,
  });

  @override
  State<AdminFormModal> createState() => _AdminFormModalState();
}

class _AdminFormModalState extends State<AdminFormModal> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  String selectedRole = 'Ops Admin';

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(
      text: widget.isEditing && widget.admin != null ? widget.admin!.name : '',
    );
    emailController = TextEditingController(
      text: widget.isEditing && widget.admin != null ? widget.admin!.email : '',
    );
    passwordController = TextEditingController();

    if (widget.isEditing && widget.admin != null) {
      selectedRole = widget.admin!.role;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      alignment: Alignment.center,
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with title and close button
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.isEditing ? 'Edit Admin' : 'Add Admin',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onClose,
                    child: const Icon(Icons.close, size: 20),
                  ),
                ],
              ),
            ),

            // Form content
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFormField(
                    controller: nameController,
                    icon: Icons.person_outline,
                    label: 'Name *',
                    hintText: 'Enter Name',
                  ),
                  const SizedBox(height: 16),
                  CustomFormField(
                    controller: emailController,
                    icon: Icons.email_outlined,
                    label: 'Email Id *',
                    hintText: 'Enter Mail ID',
                  ),
                  const SizedBox(height: 16),
                  CustomDropdownField(
                    value: selectedRole,
                    items: const [
                      'Ops Admin',
                      'Super Admin',
                      'Manager',
                      'Editor',
                      'Viewer',
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedRole = value!;
                      });
                    },
                    icon: Icons.work_outline,
                    label: 'Type *',
                  ),
                  const SizedBox(height: 16),
                  CustomFormField(
                    controller: passwordController,
                    icon: Icons.lock_outline,
                    label: 'Password *',
                    hintText: 'Enter Password',
                    isPassword: true,
                  ),
                  const SizedBox(height: 24),

                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: widget.onClose,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber.shade50,
                            foregroundColor: Colors.amber.shade800,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            widget.onSave(
                              nameController.text,
                              emailController.text,
                              selectedRole,
                              true,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(widget.isEditing ? 'Update' : 'Save'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
