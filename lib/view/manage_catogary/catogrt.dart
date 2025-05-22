import 'package:flutter/material.dart';
import 'package:foodapp_admin/Widgets/comman.dart';

// Include all your common widgets here (CommonHeader, UserProfileWidget, etc.)
// ... (paste your common widgets code here)

// Main Category Management Screen
class CategoryManagementScreen extends StatefulWidget {
  const CategoryManagementScreen({super.key});

  @override
  State<CategoryManagementScreen> createState() =>
      _CategoryManagementScreenState();
}

class _CategoryManagementScreenState extends State<CategoryManagementScreen> {
  int _entriesPerPage = 10;

  // Sample data
  final List<CategoryData> _categories = [
    CategoryData(1, 'Skin Less Chicken', 'assets/chicken1.jpg', 'Type', true),
    CategoryData(2, 'Skin Less Chicken', 'assets/chicken2.jpg', 'Type', true),
    CategoryData(3, 'Skin Less Chicken', 'assets/chicken3.jpg', 'Type', true),
    CategoryData(4, 'Skin Less Chicken', 'assets/chicken4.jpg', 'Type', true),
    CategoryData(5, 'Fresh Fish', 'assets/fish1.jpg', 'Type', true),
    CategoryData(6, 'Fresh Fish', 'assets/fish2.jpg', 'Type', true),
    CategoryData(7, 'Fresh Fish', 'assets/fish3.jpg', 'Type', true),
    CategoryData(8, 'Fresh Mutton', 'assets/mutton1.jpg', 'Type', true),
    CategoryData(9, 'Fresh Mutton', 'assets/mutton2.jpg', 'Type', true),
    CategoryData(10, 'Fresh Mutton', 'assets/mutton3.jpg', 'Type', true),
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
              title: 'Manage Category',
              icon: Icons.category,
              additionalAction: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: InkWell(
                  onTap: () => _showAddCategoryDialog(),
                  child: const Text(
                    'Add Category',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Table Controls
            TableControlsWidget(
              entriesPerPage: _entriesPerPage,
              onEntriesChanged: (value) {
                setState(() {
                  _entriesPerPage = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Data Table
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Table Header
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 60,
                            child: Text(
                              'Sl No.',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Category Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Category Image',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Type',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              'Actions',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Table Body
                    Expanded(
                      child: ListView.builder(
                        itemCount: _categories.length,
                        itemBuilder: (context, index) {
                          final category = _categories[index];
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey[200]!),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 60,
                                  child: Text(category.slNo.toString()),
                                ),
                                Expanded(flex: 2, child: Text(category.name)),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.grey[200],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.network(
                                        'https://picsum.photos/40/40?random=${category.slNo}',
                                        fit: BoxFit.cover,
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return Icon(
                                            Icons.image,
                                            color: Colors.grey[400],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: StatusWidget(
                                    isActive: category.isActive,
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                  child: ActionButtonsWidget(
                                    onEdit:
                                        () => _showEditCategoryDialog(category),
                                    onDelete:
                                        () => _showDeleteConfirmation(category),
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
              ),
            ),
            const SizedBox(height: 16),

            // Pagination
            PaginationWidget(
              onPrevious: () {
                // Handle previous page
              },
              onNext: () {
                // Handle next page
              },
              canGoPrevious: true,
              canGoNext: true,
            ),
          ],
        ),
      ),
    );
  }

  void _showAddCategoryDialog() {
    showDialog(
      context: context,
      builder:
          (context) =>
              const CategoryDialog(title: 'Add Category', isEdit: false),
    );
  }

  void _showEditCategoryDialog(CategoryData category) {
    showDialog(
      context: context,
      builder:
          (context) => CategoryDialog(
            title: 'Edit Category Details',
            isEdit: true,
            category: category,
          ),
    );
  }

  void _showDeleteConfirmation(CategoryData category) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirm Delete'),
            content: Text('Are you sure you want to delete ${category.name}?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Handle delete
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
}

// Category Dialog for Add/Edit
class CategoryDialog extends StatefulWidget {
  final String title;
  final bool isEdit;
  final CategoryData? category;

  const CategoryDialog({
    super.key,
    required this.title,
    required this.isEdit,
    this.category,
  });

  @override
  State<CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  final TextEditingController _nameController = TextEditingController();
  bool _isActive = true;

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && widget.category != null) {
      _nameController.text = widget.category!.name;
      _isActive = widget.category!.isActive;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Category Information Section
            const Text(
              'Category Information',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 12),

            // Category Name Field
            const Text(
              'Category Name',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter Category Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Status Toggle
            Row(
              children: [
                const Text(
                  'Status: ',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Switch(
                  value: _isActive,
                  onChanged: (value) {
                    setState(() {
                      _isActive = value;
                    });
                  },
                  activeColor: Colors.green,
                ),
                Text(
                  _isActive ? 'Active' : 'Inactive',
                  style: TextStyle(
                    fontSize: 14,
                    color: _isActive ? Colors.green : Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Image Upload Section
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300]!,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[50],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_upload, size: 32, color: Colors.grey[400]),
                  const SizedBox(height: 8),
                  const Text(
                    'Upload Details',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    // Handle save/update
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    widget.isEdit ? 'Update' : 'Update',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}

// Data Model
class CategoryData {
  final int slNo;
  final String name;
  final String imagePath;
  final String type;
  final bool isActive;

  CategoryData(this.slNo, this.name, this.imagePath, this.type, this.isActive);
}

// Common Header Widget (from your provided code)
