// class Medicine {
//   final int? medicineId;
//   final String medicineName;
//   final String dosageMG;
//   final String company;
//
//   Medicine({
//     this.medicineId,
//     required this.medicineName,
//     required this.dosageMG,
//     required this.company,
//   });
//
//   factory Medicine.fromMap(Map<String, dynamic> json) => Medicine(
//     medicineId: json["medicineId"],
//     medicineName: json["medicineName"],
//     dosageMG: json["dosageMG"],
//     company: json["company"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "medicineId": medicineId,
//     "medicineName": medicineName,
//     "dosageMG": dosageMG,
//     "company": company,
//   };
// }
class Medicine {
  final int? medicineId;
  final String medicineName;
  final String dosageMG;
  final String company;
  final String medicineType;
 // final String frequency;

  Medicine({
    this.medicineId,
    required this.medicineName,
    required this.dosageMG,
    required this.company,
    required this.medicineType,
    //required this.frequency,
  });

  factory Medicine.fromMap(Map<String, dynamic> json) => Medicine(
    medicineId: json["medicineId"],
    medicineName: json["medicineName"],
    dosageMG: json["dosageMG"],
    company: json["company"],
    medicineType: json["medicineType"],
   // frequency: json["frequency"],
  );

  Map<String, dynamic> toMap() => {
    "medicineId": medicineId,
    "medicineName": medicineName,
    "dosageMG": dosageMG,
    "company": company,
    "medicineType": medicineType,
    //"frequency": frequency,
  };
}
