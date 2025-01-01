class Patient {
  final int ?id;
  final String name;
  final String nic;
  final String email;
  final String telephone;
  final String gender;
  final int age;

  Patient({
     this.id,
    required this.name,
    required this.nic,
    required this.email,
    required this.telephone,
    required this.gender,
    required this.age,
  });

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      id: map['id'],
      name: map['name'],
      nic: map['nic'],
      email: map['email'],
      telephone: map['telephone'],
      gender: map['gender'],
      age: map['age'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nic': nic,
      'email': email,
      'telephone': telephone,
      'gender': gender,
      'age': age,
    };
  }
}
