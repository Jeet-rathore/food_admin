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
      appBar: AppBar(
        title: const Text('Category Management'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Added Navigator.pop for back navigation
          },
        ),
      ),
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
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.grey[200],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.network(
                                        'https://picsum.photos/50/50?random=${category.slNo}',
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return Icon(
                                            Icons.image,
                                            color: Colors.grey[400],
                                            size: 24,
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

  void _showAddCategoryDialog() async {
    final result = await showDialog<bool>(
      context: context,
      builder:
          (context) =>
              const CategoryDialog(title: 'Add Category', isEdit: false),
    );

    // Handle the result if needed
    if (result == true) {
      // Refresh the category list or show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Category added successfully!')),
      );
    }
  }

  void _showEditCategoryDialog(CategoryData category) async {
    final result = await showDialog<bool>(
      context: context,
      builder:
          (context) => CategoryDialog(
            title: 'Edit Category Details',
            isEdit: true,
            category: category,
          ),
    );

    // Handle the result if needed
    if (result == true) {
      // Refresh the category list or show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Category updated successfully!')),
      );
    }
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
                onPressed: () => Navigator.pop(context, false), // Return false
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Handle delete logic here
                  setState(() {
                    _categories.removeWhere((cat) => cat.slNo == category.slNo);
                  });
                  Navigator.pop(context, true); // Return true after deletion

                  // Show success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${category.name} deleted successfully!'),
                    ),
                  );
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
                  onPressed:
                      () => Navigator.pop(
                        context,
                        false,
                      ), // Return false when closing
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
                Transform.scale(
                  scale: 0.8, // Makes the switch smaller
                  child: Switch(
                    value: _isActive,
                    onChanged: (value) {
                      setState(() {
                        _isActive = value;
                      });
                    },
                    activeColor: Colors.white,
                    activeTrackColor: Colors.green,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey[400],
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color:
                        _isActive
                            ? Colors.green.withOpacity(0.1)
                            : Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _isActive ? Colors.green : Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    _isActive ? 'Active' : 'Inactive',
                    style: TextStyle(
                      fontSize: 12,
                      color: _isActive ? Colors.green : Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Image Upload Section
            InkWell(
              onTap: () {
                // Handle image selection
                _selectImage();
              },
              child: Container(
                width: double.infinity,
                height: 140,
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
                      'Upload Image',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Drag and drop or click to browse',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed:
                      () => Navigator.pop(
                        context,
                        false,
                      ), // Return false for cancel
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
                    // Validate form
                    if (_nameController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a category name'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    // Handle save/update logic here
                    _saveCategory();

                    // Close dialog and return true for success
                    Navigator.pop(context, true);
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
                    elevation: 2,
                  ),
                  child: Text(
                    widget.isEdit ? 'Update' : 'Save',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _selectImage() {
    // Implement image selection logic
    print('Image selection triggered');
    // You can integrate with image_picker package here
  }

  void _saveCategory() {
    // Implement save/update logic
    final categoryData = {
      'name': _nameController.text.trim(),
      'isActive': _isActive,
      'isEdit': widget.isEdit,
    };

    print('Saving category: $categoryData');
    // Add your save logic here (API calls, database operations, etc.)
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
