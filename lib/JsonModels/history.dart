class History {
  final int ?id;
  final String name;
  final int age;
  final String gender;
  final int nic;
  final String medicine;
  final int doctorname;
  final int date;
  final int note;

  History({
    this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.nic,
    required this.medicine,
    required this.doctorname,
    required this.date,
    required this.note,
  });

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      id: map['id'],
      name: map['name'],
      age: map['age'],
      gender: map['gender'],
      nic: map['nic'],
      medicine: map['medicine'],
      doctorname: map['doctorname'],
      date: map['date'],
      note: map['note'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'nic': nic,
      'medicine': medicine,
      'doctorname': doctorname,
      'date': date,
      'note': note,
    };
  }
}
