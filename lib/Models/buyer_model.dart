class Buyer {
  final int id;
  final String name;
  final String email;
  final String contact;
  final bool isActive;
  String? firstName;
  String? lastName;
  String? panId;
  String? contactNumber;
  String? officeNumber;
  String? streetArea;
  String? areaLocality;
  String? city;
  String? pinCode;

  Buyer({
    required this.id,
    required this.name,
    required this.email,
    required this.contact,
    required this.isActive,
    this.firstName,
    this.lastName,
    this.panId,
    this.contactNumber,
    this.officeNumber,
    this.streetArea,
    this.areaLocality,
    this.city,
    this.pinCode,
  });

  Buyer copyWith({
    int? id,
    String? name,
    String? email,
    String? contact,
    bool? isActive,
    String? firstName,
    String? lastName,
    String? panId,
    String? contactNumber,
    String? officeNumber,
    String? streetArea,
    String? areaLocality,
    String? city,
    String? pinCode,
  }) {
    return Buyer(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      contact: contact ?? this.contact,
      isActive: isActive ?? this.isActive,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      panId: panId ?? this.panId,
      contactNumber: contactNumber ?? this.contactNumber,
      officeNumber: officeNumber ?? this.officeNumber,
      streetArea: streetArea ?? this.streetArea,
      areaLocality: areaLocality ?? this.areaLocality,
      city: city ?? this.city,
      pinCode: pinCode ?? this.pinCode,
    );
  }
}
