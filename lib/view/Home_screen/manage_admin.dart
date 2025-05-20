import 'package:flutter/material.dart';


class Admin {
  final int id;
  final String name;
  final String email;
  final String role;
  bool isActive;

  Admin({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.isActive,
  });
}

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
            content: Text('Are you sure you want to delete ${admin.name}?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _admins.removeWhere((element) => element.id == admin.id);
                  });
                  Navigator.pop(context);
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
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
                _buildHeader(),
                const SizedBox(height: 16),
                _buildTableControls(),
                const SizedBox(height: 8),
                Expanded(child: _buildAdminTable()),
              ],
            ),
          ),
          if (_isAddingAdmin || _isEditingAdmin) _buildAdminForm(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              'Manage Admin',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: _openAddAdminForm,
              icon: const Icon(Icons.add),
              label: const Text('Add Admin'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            const SizedBox(width: 16),
            IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Pavan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Manager',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.blue.shade800,
              child: const Text('P', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTableControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text('Show'),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButton<int>(
                value: _entriesPerPage,
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
                  setState(() {
                    _entriesPerPage = newValue!;
                  });
                },
              ),
            ),
            const SizedBox(width: 8),
            const Text('Records'),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed:
                  _currentPage > 0
                      ? () {
                        setState(() {
                          _currentPage--;
                        });
                      }
                      : null,
              icon: const Icon(Icons.chevron_left),
            ),
            const Text('Previous'),
            const SizedBox(width: 16),
            const Text('Next'),
            IconButton(
              onPressed:
                  (_currentPage + 1) * _entriesPerPage < _admins.length
                      ? () {
                        setState(() {
                          _currentPage++;
                        });
                      }
                      : null,
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAdminTable() {
    final startIndex = _currentPage * _entriesPerPage;
    final endIndex =
        (_currentPage + 1) * _entriesPerPage > _admins.length
            ? _admins.length
            : (_currentPage + 1) * _entriesPerPage;

    final currentPageAdmins = _admins.sublist(startIndex, endIndex);

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
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                _buildTableHeader('SL No.', 1),
                _buildTableHeader('Name', 2),
                _buildTableHeader('Email ID', 2),
                _buildTableHeader('List of Admin', 2),
                _buildTableHeader('Type', 2),
                _buildTableHeader('Actions', 1),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currentPageAdmins.length,
              itemBuilder: (context, index) {
                final admin = currentPageAdmins[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                  ),
                  child: Row(
                    children: [
                      _buildTableCell(
                        '${startIndex + index + 1}',
                        1,
                        alignment: Alignment.center,
                      ),
                      _buildTableCell(
                        admin.name,
                        2,
                        leading: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.blue.shade800,
                          child: const Text(
                            'R',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                      _buildTableCell(admin.email, 2),
                      _buildTableCell(admin.role, 2),
                      _buildTableCell(
                        '',
                        2,
                        content: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    admin.isActive ? Colors.green : Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              admin.isActive ? 'Active' : 'Inactive',
                              style: TextStyle(
                                color:
                                    admin.isActive ? Colors.green : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildTableCell(
                        '',
                        1,
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () => _openEditAdminForm(admin),
                              icon: Icon(
                                Icons.edit,
                                color: Colors.blue.shade700,
                                size: 18,
                              ),
                            ),
                            IconButton(
                              onPressed: () => _deleteAdmin(admin),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 18,
                              ),
                            ),
                          ],
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

  Widget _buildTableHeader(String text, int flex) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTableCell(
    String text,
    int flex, {
    Widget? leading,
    Widget? content,
    Alignment alignment = Alignment.centerLeft,
  }) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        alignment: alignment,
        child:
            content ??
            Row(
              children: [
                if (leading != null) ...[leading, const SizedBox(width: 8)],
                Text(text),
              ],
            ),
      ),
    );
  }

  Widget _buildAdminForm() {
    final _nameController = TextEditingController(
      text:
          _isEditingAdmin && _selectedAdmin != null ? _selectedAdmin!.name : '',
    );
    final _emailController = TextEditingController(
      text:
          _isEditingAdmin && _selectedAdmin != null
              ? _selectedAdmin!.email
              : '',
    );
    final _passwordController = TextEditingController();

    String _selectedRole =
        _isEditingAdmin && _selectedAdmin != null
            ? _selectedAdmin!.role
            : 'Ops Admin';

    return Container(
      color: Colors.black.withOpacity(0.5),
      alignment: Alignment.center,
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: StatefulBuilder(
          builder: (context, setModalState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header with title and close button
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _isAddingAdmin ? 'Add Admin' : 'Edit Admin',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: _closeForm,
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
                      // Name Field
                      _buildFormLabel('Name *'),
                      _buildTextField(_nameController, 'Enter Name'),
                      const SizedBox(height: 16),

                      // Email Field
                      _buildFormLabel('Email Id *'),
                      _buildTextField(_emailController, 'Enter Mail ID'),
                      const SizedBox(height: 16),

                      // Type Field
                      _buildFormLabel('Type *'),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.amber.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.amber.shade200),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: _selectedRole,
                          decoration: const InputDecoration(
                            hintText: 'Select Role',
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            border: InputBorder.none,
                          ),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: const [
                            DropdownMenuItem(
                              value: 'Ops Admin',
                              child: Text('Ops Admin'),
                            ),
                            DropdownMenuItem(
                              value: 'Super Admin',
                              child: Text('Super Admin'),
                            ),
                            DropdownMenuItem(
                              value: 'Manager',
                              child: Text('Manager'),
                            ),
                            DropdownMenuItem(
                              value: 'Editor',
                              child: Text('Editor'),
                            ),
                            DropdownMenuItem(
                              value: 'Viewer',
                              child: Text('Viewer'),
                            ),
                          ],
                          onChanged: (value) {
                            setModalState(() {
                              _selectedRole = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Password Field
                      _buildFormLabel('Password *'),
                      _buildTextField(
                        _passwordController,
                        'Enter Password',
                        isPassword: true,
                      ),
                      const SizedBox(height: 24),

                      // Buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _closeForm,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber.shade50,
                                foregroundColor: Colors.amber.shade800,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('Cancel'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                _saveAdmin(
                                  _nameController.text,
                                  _emailController.text,
                                  _selectedRole,
                                  true,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(_isAddingAdmin ? 'Save' : 'Update'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildFormLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            text.contains('Name')
                ? Icons.person_outline
                : text.contains('Email')
                ? Icons.email_outlined
                : text.contains('Type')
                ? Icons.work_outline
                : Icons.lock_outline,
            size: 16,
            color: Colors.amber.shade800,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.amber.shade800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hint, {
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber.shade200),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
