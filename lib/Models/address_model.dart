class Address {
  int? id;
  String? number;
  String? street;
  String? postalCode;
  String city;
  String? country;

  Address({
    this.id,
    this.number,
    this.street,
    this.postalCode,
    required this.city,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      number: json['number'],
      street: json['street'],
      postalCode: json['postalCode'],
      city: json['city'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (id != null) data['id'] = id;
    if (number != null) data['number'] = number;
    if (street != null) data['street'] = street;
    if (postalCode != null) data['postalCode'] = postalCode;
    data['city'] = city;
    if (country != null) data['country'] = country;
    return data;
  }
}
