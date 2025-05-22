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

  Admin copyWith({
    int? id,
    String? name,
    String? email,
    String? role,
    bool? isActive,
  }) {
    return Admin(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
    );
  }
}
