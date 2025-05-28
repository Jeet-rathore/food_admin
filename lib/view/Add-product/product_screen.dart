import 'package:flutter/material.dart';
import 'package:foodapp_admin/Widgets/comman.dart';

// Your common widgets (assuming they're imported from the paste.txt file)
// CommonHeader, UserProfileWidget, PaginationWidget, TableControlsWidget,
// StatusWidget, ActionButtonsWidget, ProfileAvatarWidget

class ProductManagementScreen extends StatefulWidget {
  const ProductManagementScreen({super.key});

  @override
  State<ProductManagementScreen> createState() =>
      _ProductManagementScreenState();
}

class _ProductManagementScreenState extends State<ProductManagementScreen> {
  int _entriesPerPage = 10;
  List<ProductData> _products = [
    ProductData(
      1,
      'LJ Mt Chicken Center',
      'Skin Less Chicken',
      'InStock',
      true,
    ),
    ProductData(
      2,
      'LJ Mt Chicken Center',
      'Skin Less Chicken',
      'InStock',
      true,
    ),
    ProductData(
      3,
      'LJ Mt Chicken Center',
      'Skin Less Chicken',
      'InStock',
      true,
    ),
    ProductData(
      4,
      'LJ Mt Chicken Center',
      'Skin Less Chicken',
      'InStock',
      true,
    ),
    ProductData(
      5,
      'LJ Mt Chicken Center',
      'Skin Less Chicken',
      'InStock',
      true,
    ),
    ProductData(
      6,
      'LJ Mt Chicken Center',
      'Skin Less Chicken',
      'InStock',
      true,
    ),
    ProductData(
      7,
      'LJ Mt Chicken Center',
      'Skin Less Chicken',
      'InStock',
      true,
    ),
    ProductData(
      8,
      'LJ Mt Chicken Center',
      'Skin Less Chicken',
      'InStock',
      true,
    ),
    ProductData(
      9,
      'LJ Mt Chicken Center',
      'Skin Less Chicken',
      'InStock',
      true,
    ),
    ProductData(
      10,
      'LJ Mt Chicken Center',
      'Skin Less Chicken',
      'InStock',
      true,
    ),
    ProductData(
      11,
      'LJ Mt Chicken Center',
      'Skin Less Chicken',
      'InStock',
      true,
    ),
    ProductData(
      12,
      'LJ Mt Chicken Center',
      'Skin Less Chicken',
      'InStock',
      true,
    ),
    ProductData(
      13,
      'LJ Mt Chicken Center',
      'Skin Less Chicken',
      'InStock',
      true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header using CommonHeader widget
            CommonHeader(
              title: 'Manage Products',
              icon: Icons.inventory_2_outlined,
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
                  onTap: () => _showAddProductDialog(),
                  child: const Text(
                    'Add Product',
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
                      offset: const Offset(0, 1),
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
                        color: Colors.grey[100],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 50,
                            child: Text(
                              'SL No.',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Text(
                              'Seller Name',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Text(
                              'Product Name',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: Text(
                              'In/Out Stock',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 80,
                            child: Text(
                              'Status',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 80,
                            child: Text(
                              'Actions',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Table Body
                    Expanded(
                      child: ListView.builder(
                        itemCount: _products.length,
                        itemBuilder: (context, index) {
                          final product = _products[index];
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
                                  width: 50,
                                  child: Text(
                                    product.slNo.toString(),
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ProfileAvatarWidget(
                                    name: product.sellerName,
                                    initial: 'L',
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    product.productName,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    product.stockStatus,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                  child: StatusWidget(
                                    isActive: product.isActive,
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                  child: ActionButtonsWidget(
                                    onEdit:
                                        () => _showEditProductDialog(product),
                                    onDelete:
                                        () => _showDeleteConfirmation(product),
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

  void _showAddProductDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddProductDialog(
          onProductAdded: (ProductData newProduct) {
            setState(() {
              _products.add(newProduct);
            });
            Navigator.of(context).pop(); // Added Navigator.pop()
          },
        );
      },
    );
  }

  void _showEditProductDialog(ProductData product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditProductDialog(
          product: product,
          onProductUpdated: (ProductData updatedProduct) {
            setState(() {
              int index = _products.indexWhere((p) => p.slNo == product.slNo);
              if (index != -1) {
                _products[index] = updatedProduct;
              }
            });
            Navigator.of(context).pop(); // Added Navigator.pop()
          },
        );
      },
    );
  }

  void _showDeleteConfirmation(ProductData product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Product'),
          content: Text(
            'Are you sure you want to delete ${product.productName}?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _products.remove(product);
                });
                Navigator.of(context).pop(); // Already has Navigator.pop()
                // Show success message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${product.productName} deleted successfully',
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}

// Add Product Dialog
class AddProductDialog extends StatefulWidget {
  final Function(ProductData) onProductAdded;

  const AddProductDialog({super.key, required this.onProductAdded});

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  final _formKey = GlobalKey<FormState>();
  final _sellerNameController = TextEditingController();
  final _sellerIdController = TextEditingController();
  final _productTitleController = TextEditingController();
  final _productDescController = TextEditingController();
  final _productPriceController = TextEditingController();
  final _priceUnitController = TextEditingController();
  final _quantityController = TextEditingController();
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 600,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Add Product Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 24),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextFieldWithController(
                          controller: _sellerNameController,
                          hint: 'Enter Seller Name',
                          label: 'Seller Name',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTextFieldWithController(
                          controller: _sellerIdController,
                          hint: 'Enter Seller ID',
                          label: 'Seller ID',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTextFieldWithController(
                          controller: _productTitleController,
                          hint: 'Enter Product Title',
                          label: 'Product Title',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Category Name',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]!),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButtonFormField<String>(
                                value: _selectedCategory,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                hint: const Text('Select Category'),
                                items:
                                    ['Electronics', 'Food', 'Clothing', 'Books']
                                        .map(
                                          (category) => DropdownMenuItem(
                                            value: category,
                                            child: Text(category),
                                          ),
                                        )
                                        .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedCategory = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select a category';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTextFieldWithController(
                          controller: _productDescController,
                          hint: 'Enter Product Description',
                          label: 'Product Description',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTextFieldWithController(
                          controller: _productPriceController,
                          hint: 'Enter Product Price',
                          label: 'Product Price',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: _buildTextFieldWithController(
                          controller: _priceUnitController,
                          hint: 'Enter Price Unit',
                          label: 'Price Unit',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTextFieldWithController(
                          controller: _quantityController,
                          hint: 'Enter Quantity',
                          label: 'Quantity',
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: SizedBox(),
                      ), // Empty space for alignment
                    ],
                  ),
                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Create new product
                            final newProduct = ProductData(
                              DateTime.now()
                                  .millisecondsSinceEpoch, // Generate unique ID
                              _sellerNameController.text,
                              _productTitleController.text,
                              'InStock', // Default status
                              true, // Default active status
                            );

                            // Call the callback to add product
                            widget.onProductAdded(newProduct);

                            // Show success message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Product added successfully'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Save'),
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

  Widget _buildTextFieldWithController({
    required TextEditingController controller,
    required String hint,
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
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
              vertical: 8,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _sellerNameController.dispose();
    _sellerIdController.dispose();
    _productTitleController.dispose();
    _productDescController.dispose();
    _productPriceController.dispose();
    _priceUnitController.dispose();
    _quantityController.dispose();
    super.dispose();
  }
}

// Edit Product Dialog
class EditProductDialog extends StatefulWidget {
  final ProductData product;
  final Function(ProductData) onProductUpdated;

  const EditProductDialog({
    super.key,
    required this.product,
    required this.onProductUpdated,
  });

  @override
  State<EditProductDialog> createState() => _EditProductDialogState();
}

class _EditProductDialogState extends State<EditProductDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _sellerNameController;
  late TextEditingController _productNameController;
  late TextEditingController _sellerIdController;
  late TextEditingController _productDescController;
  late TextEditingController _productPriceController;
  late TextEditingController _priceUnitController;
  late TextEditingController _quantityController;
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _sellerNameController = TextEditingController(
      text: widget.product.sellerName,
    );
    _productNameController = TextEditingController(
      text: widget.product.productName,
    );
    _sellerIdController = TextEditingController();
    _productDescController = TextEditingController();
    _productPriceController = TextEditingController();
    _priceUnitController = TextEditingController();
    _quantityController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 600,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Edit Product Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 24),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextFieldWithController(
                          controller: _sellerNameController,
                          hint: 'Enter Seller Name',
                          label: 'Seller Name',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTextFieldWithController(
                          controller: _sellerIdController,
                          hint: 'Enter Seller ID',
                          label: 'Seller ID',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTextFieldWithController(
                          controller: _productNameController,
                          hint: 'Enter Product Title',
                          label: 'Product Title',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Category Name',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]!),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButtonFormField<String>(
                                value: _selectedCategory,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                hint: const Text('Select Category'),
                                items:
                                    ['Electronics', 'Food', 'Clothing', 'Books']
                                        .map(
                                          (category) => DropdownMenuItem(
                                            value: category,
                                            child: Text(category),
                                          ),
                                        )
                                        .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedCategory = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTextFieldWithController(
                          controller: _productDescController,
                          hint: 'Enter Product Description',
                          label: 'Product Description',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTextFieldWithController(
                          controller: _productPriceController,
                          hint: 'Enter Product Price',
                          label: 'Product Price',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: _buildTextFieldWithController(
                          controller: _priceUnitController,
                          hint: 'Enter Price Unit',
                          label: 'Price Unit',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTextFieldWithController(
                          controller: _quantityController,
                          hint: 'Enter Quantity',
                          label: 'Quantity',
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: SizedBox(),
                      ), // Empty space for alignment
                    ],
                  ),
                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Create updated product
                            final updatedProduct = ProductData(
                              widget.product.slNo,
                              _sellerNameController.text,
                              _productNameController.text,
                              widget
                                  .product
                                  .stockStatus, // Keep existing status
                              widget
                                  .product
                                  .isActive, // Keep existing active status
                            );

                            // Call the callback to update product
                            widget.onProductUpdated(updatedProduct);

                            // Show success message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Product updated successfully'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Update'),
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

  Widget _buildTextFieldWithController({
    required TextEditingController controller,
    required String hint,
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
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
              vertical: 8,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _sellerNameController.dispose();
    _productNameController.dispose();
    _sellerIdController.dispose();
    _productDescController.dispose();
    _productPriceController.dispose();
    _priceUnitController.dispose();
    _quantityController.dispose();
    super.dispose();
  }
}

// Product Data Model
class ProductData {
  final int slNo;
  final String sellerName;
  final String productName;
  final String stockStatus;
  final bool isActive;

  ProductData(
    this.slNo,
    this.sellerName,
    this.productName,
    this.stockStatus,
    this.isActive,
  );
}
