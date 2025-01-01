import 'dart:convert';

class Prescription {
  final int? prescriptionid;
  final String patientName;
  final String patientNIC;
  final String patientAge; // Changed type to String
  final String gender;
  final String doctorName;
  final DateTime date;
  final String doctorNotes;
  final String medicine; // Changed type to String

  Prescription({
    this.prescriptionid,
    required this.patientName,
    required this.patientNIC,
    required this.patientAge,
    required this.gender,
    required this.doctorName,
    required this.date,
    required this.doctorNotes,
    required this.medicine,
  });

  Map<String, dynamic> toMap() {
    return {
      'prescriptionid': prescriptionid,
      'patientName': patientName,
      'patientNIC': patientNIC,
      'patientAge': patientAge,
      'gender': gender,
      'doctorName': doctorName,
      'date': date.toIso8601String(),
      'doctorNotes': doctorNotes,
      'medicine': medicine,  // No need to encode since it's already a string
    };
  }

  factory Prescription.fromMap(Map<String, dynamic> map) {
    return Prescription(
      prescriptionid: map['prescriptionid'],
      patientName: map['patientName'],
      patientNIC: map['patientNIC'],
      patientAge: map['patientAge'],
      gender: map['gender'],
      doctorName: map['doctorName'],
      date: DateTime.parse(map['date']),
      doctorNotes: map['doctorNotes'],
      medicine: map['medicine'],  // No need to decode since it's already a string
    );
  }

  String toJson() => json.encode(toMap());

  factory Prescription.fromJson(String source) => Prescription.fromMap(json.decode(source));
}
