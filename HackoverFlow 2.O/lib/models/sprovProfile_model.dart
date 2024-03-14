class ContactInformation {
  String email;
  String phone;

  ContactInformation({required this.email, required this.phone});

  factory ContactInformation.fromJson(Map<String, dynamic> json) {
    return ContactInformation(
      email: json['email'],
      phone: json['phone'],
    );
  }
}

class Person {
  String id;
  String name;
  String address;
  ContactInformation contactInformation;

  Person({
    required this.id,
    required this.name,
    required this.address,
    required this.contactInformation,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['_id'],
      name: json['name'],
      address: json['address'],
      contactInformation: ContactInformation.fromJson(json['contact_information']),
    );
  }
}
