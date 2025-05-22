import 'package:flutter/material.dart';
import 'package:foodapp_admin/Models/admin_model.dart';
import 'package:foodapp_admin/Widgets/admi_widgets.dart';
import 'package:foodapp_admin/Widgets/comman.dart';

class AdminManagementScreen extends StatefulWidget {
  const AdminManagementScreen({super.key});

  @override
  State<AdminManagementScreen> createState() => _AdminManagementScreenState();
}

class _AdminManagementScreenState extends State<AdminManagementScreen> {
  final List<Admin> _admins = List.generate(
    10,
    (index) => Admin(
      id: index + 1,
      name: 'Raj Joshith',
      email: 'Raj@gmail.com',
      role:
          index % 3 == 1
              ? 'Manager'
              : index % 3 == 2
              ? 'Editor'
              : 'Super Admin',
      isActive: index % 2 == 0,
    ),
  );

  int _entriesPerPage = 10;
  int _currentPage = 0;
  bool _isAddingAdmin = false;
  bool _isEditingAdmin = false;
  Admin? _selectedAdmin;

  void _openAddAdminForm() {
    setState(() {
      _isAddingAdmin = true;
      _isEditingAdmin = false;
      _selectedAdmin = null;
    });
  }

  void _closeForm() {
    setState(() {
      _isAddingAdmin = false;
      _isEditingAdmin = false;
      _selectedAdmin = null;
    });
  }

  void _openEditAdminForm(Admin admin) {
    setState(() {
      _isEditingAdmin = true;
      _isAddingAdmin = false;
      _selectedAdmin = admin;
    });
  }

  void _deleteAdmin(Admin admin) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Delete Admin'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileAvatarWidget(name: admin.name, initial: admin.name[0]),
                const SizedBox(height: 16),
                StatusWidget(isActive: admin.isActive),
                const SizedBox(height: 16),
                Text('Are you sure you want to delete ${admin.name}?'),
              ],
            ),
            actions: [
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        foregroundColor: Colors.black,
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _admins.removeWhere(
                            (element) => element.id == admin.id,
                          );
                        });
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Delete'),
                    ),
                  ),
                ],
              ),
            ],
          ),
    );
  }

  void _saveAdmin(String name, String email, String role, bool isActive) {
    setState(() {
      if (_isEditingAdmin && _selectedAdmin != null) {
        // Update existing admin
        final index = _admins.indexWhere(
          (admin) => admin.id == _selectedAdmin!.id,
        );
        if (index != -1) {
          _admins[index] = Admin(
            id: _selectedAdmin!.id,
            name: name,
            email: email,
            role: role,
            isActive: isActive,
          );
        }
      } else {
        // Add new admin
        _admins.add(
          Admin(
            id:
                _admins.isNotEmpty
                    ? _admins.map((e) => e.id).reduce((a, b) => a > b ? a : b) +
                        1
                    : 1,
            name: name,
            email: email,
            role: role,
            isActive: isActive,
          ),
        );
      }
      _closeForm();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonHeader(
                  title: 'Manage Admin',
                  icon: Icons.admin_panel_settings,
                  additionalAction: ElevatedButton.icon(
                    onPressed: _openAddAdminForm,
                    icon: const Icon(Icons.add),
                    label: const Text('Add Admin'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TableControlsWidget(
                  entriesPerPage: _entriesPerPage,
                  onEntriesChanged: (value) {
                    setState(() {
                      _entriesPerPage = value;
                      _currentPage = 0;
                    });
                  },
                  additionalControls: PaginationWidget(
                    onPrevious: _currentPage > 0 ? _previousPage : null,
                    onNext: _canGoNext() ? _nextPage : null,
                    canGoPrevious: _currentPage > 0,
                    canGoNext: _canGoNext(),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: AdminDataTable(
                    admins: _getCurrentPageAdmins(),
                    startIndex: _currentPage * _entriesPerPage,
                    onEdit: _openEditAdminForm,
                    onDelete: _deleteAdmin,
                  ),
                ),
              ],
            ),
          ),
          if (_isAddingAdmin || _isEditingAdmin)
            AdminFormModal(
              isEditing: _isEditingAdmin,
              admin: _selectedAdmin,
              onSave: _saveAdmin,
              onClose: _closeForm,
            ),
        ],
      ),
    );
  }

  List<Admin> _getCurrentPageAdmins() {
    final startIndex = _currentPage * _entriesPerPage;
    final endIndex = startIndex + _entriesPerPage;
    return _admins.sublist(
      startIndex,
      endIndex > _admins.length ? _admins.length : endIndex,
    );
  }

  bool _canGoNext() {
    return (_currentPage + 1) * _entriesPerPage < _admins.length;
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
}
