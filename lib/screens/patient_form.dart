// //
//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:sqlite_flutter_crud/Authtentication/home.dart';
// import 'package:sqlite_flutter_crud/JsonModels/medicine_model.dart';
// import 'package:sqlite_flutter_crud/JsonModels/prescription_form_model.dart';
// import 'package:sqlite_flutter_crud/SQLite/sqlite.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'package:screenshot/screenshot.dart';
//
// class PrescriptionForm extends StatefulWidget {
//
//   const PrescriptionForm({Key? key}) : super(key: key);
//
//   @override
//   _PrescriptionFormState createState() => _PrescriptionFormState();
// }
//
// class _PrescriptionFormState extends State<PrescriptionForm> {
//
//
//   final ScreenshotController screenshotController = ScreenshotController();
//   late Future<List<Medicine>> _medicines;
//   List<Medicine> _selectedMedicines = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _medicines = _fetchMedicines();
//   }
//
//   Future<List<Medicine>> _fetchMedicines() async {
//     final db = DatabaseHelper();
//     return db.getMedicines();
//   }
//
//   void _selectMedicine(Medicine selectedMedicine) {
//     setState(() {
//       _searchMedicineController.text = '';
//       _selectedMedicines.add(selectedMedicine);
//     });
//   }
//
//   void _removeSelectedMedicine(int index) {
//     setState(() {
//       _selectedMedicines.removeAt(index);
//     });
//   }
//
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _patientNameController = TextEditingController();
//   final TextEditingController _patientAgeController = TextEditingController();
//   final TextEditingController _doctorNotesController = TextEditingController();
//   final TextEditingController _searchMedicineController = TextEditingController();
//   final TextEditingController _doctorDetailsController = TextEditingController();
//   final TextEditingController _patientNICController = TextEditingController();
//   final TextEditingController _doctorNameController = TextEditingController();
//   String _selectedGender = 'Male';
//   DateTime _selectedDate = DateTime.now();
//   final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
//
//   void _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.teal[100],
//       appBar: AppBar(
//         backgroundColor: Colors.teal[400],
//         title: const Text(''),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => HomePage()),
//             );
//           },
//         ),
//       ),
//       body: SafeArea(
//        // backgroundColor: Colors.teal[400],
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 16.0),
//                 Center(
//                 child: const Text(
//                   'Prescription',
//                   style: TextStyle(fontSize: 25,  fontWeight: FontWeight.bold, color: Colors.black87),
//                 ),
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _patientNameController,
//                   decoration: const InputDecoration(
//                     labelText: 'Patient Name',
//                     border: OutlineInputBorder(),
//                     labelStyle: TextStyle(color: Colors.black87),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _patientNICController,
//                   decoration: const InputDecoration(
//                     labelText: 'Patient Age',
//                     border: OutlineInputBorder(),
//                     labelStyle: TextStyle(color: Colors.black87),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the age';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _patientAgeController,
//                   decoration: const InputDecoration(
//                     labelText: 'Patient NIC',
//                     border: OutlineInputBorder(),
//                     labelStyle: TextStyle(color: Colors.black87),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the nic';
//                     }
//                     return null;
//                   },
//                 ),
//
//                 const SizedBox(height: 16.0),
//                 Row(
//                   children: [
//                     const Text(
//                       'Gender: ',
//                       style: TextStyle(color: Colors.black87, fontSize: 16),
//                     ),
//                     Expanded(
//                       child: ListTile(
//                         title: const Text('Male', style: TextStyle(color: Colors.black87, fontSize: 16)),
//                         leading: Radio<String>(
//                           value: 'Male',
//                           groupValue: _selectedGender,
//                           onChanged: (value) {
//                             setState(() {
//                               _selectedGender = value!;
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: ListTile(
//                         title: const Text('Female', style: TextStyle(color: Colors.black87, fontSize: 16)),
//                         leading: Radio<String>(
//                           value: 'Female',
//                           groupValue: _selectedGender,
//                           onChanged: (value) {
//                             setState(() {
//                               _selectedGender = value!;
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//
//
//
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _doctorNotesController,
//                   decoration: const InputDecoration(
//                     //prefixIcon: Icon(Icons.search),
//                     labelText: 'Medicine',
//                     prefixIcon: Icon(Icons.search),
//                     border: OutlineInputBorder(),
//                     labelStyle: TextStyle(color: Colors.black87),
//                   ),
//                   maxLines: 1,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the medicine';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _searchMedicineController,
//                   decoration: const InputDecoration(
//                     labelText: 'Note',
//                     border: OutlineInputBorder(),
//                     labelStyle: TextStyle(color: Colors.black87),
//                   ),
//                   maxLines: 3,
//                 ),
//
//                 const SizedBox(height: 16.0),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         controller: _doctorNameController,
//                         decoration: const InputDecoration(
//                           labelText: 'Doctor Details',
//                           border: OutlineInputBorder(),
//                           labelStyle: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
//                         ),
//                         style: const TextStyle(color: Colors.black87),
//                       ),
//                     ),
//                     Text(
//                       'Date: ${_dateFormat.format(_selectedDate)}',
//                       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
//                     ),
//                   ],
//                 ),
//
//
//                 const SizedBox(height: 16.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (context) => HomePage()),
//                         );
//                       },
//                       child: const Text('Cancel'),
//                       style: ElevatedButton.styleFrom(
//                        // primary: Colors.grey,
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text('Submitting form')),
//                           );
//                         }
//                       },
//                       child: const Text('Submit'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqlite_flutter_crud/Authtentication/home.dart';
import 'package:sqlite_flutter_crud/JsonModels/medicine_model.dart';
import 'package:sqlite_flutter_crud/JsonModels/prescription_form_model.dart';
import 'package:sqlite_flutter_crud/SQLite/sqlite.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';

class PrescriptionForm extends StatefulWidget {
  const PrescriptionForm({super.key});

  @override
  _PrescriptionFormState createState() => _PrescriptionFormState();
}

class _PrescriptionFormState extends State<PrescriptionForm> {
  final ScreenshotController screenshotController = ScreenshotController();
  late Future<List<Medicine>> _medicines;
  List<Medicine> _searchResults = [];
  final List<Medicine> _selectedMedicines = [];

  @override
  void initState() {
    super.initState();
    _medicines = _fetchMedicines();
  }

  Future<List<Medicine>> _fetchMedicines() async {
    final db = DatabaseHelper();
    return db.getMedicines();
  }

  void _selectMedicine(Medicine selectedMedicine) {
    setState(() {
      _searchMedicineController.text = '';
      _selectedMedicines.add(selectedMedicine);
    });
  }

  void _removeSelectedMedicine(int index) {
    setState(() {
      _selectedMedicines.removeAt(index);
    });
  }

  void _searchMedicine(String query) {
    _medicines.then((medicines) {
      setState(() {
        _searchResults = medicines
            .where((medicine) => medicine.medicineName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    });
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _patientAgeController = TextEditingController();
  final TextEditingController _doctorNotesController = TextEditingController();
  final TextEditingController _searchMedicineController = TextEditingController();
  final TextEditingController _doctorDetailsController = TextEditingController();
  final TextEditingController _patientNICController = TextEditingController();
  final TextEditingController _doctorNameController = TextEditingController();
  String _selectedGender = 'Male';
  DateTime _selectedDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _createPdf() async {
    final Uint8List imageBytes = await screenshotController.captureFromWidget(
      Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Prescription',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 16.0),
            _buildDetailRow('Patient Name', _patientNameController.text),
            _buildDetailRow('Patient Age', _patientAgeController.text),
            _buildDetailRow('Patient NIC', _patientNICController.text),
            _buildDetailRow('Gender', _selectedGender),
            _buildDetailRow('Date', _dateFormat.format(_selectedDate)),
            const SizedBox(height: 16.0),
            const Text('Selected Medicines:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
            ..._selectedMedicines.map((medicine) => Text(medicine.medicineName, style: const TextStyle(color: Colors.black87))),
            const SizedBox(height: 16.0),
            _buildDetailRow('Doctor Details', _doctorNameController.text),
          ],
        ),
      ),
    );

    final pdf = pw.Document();
    final image = pw.MemoryImage(imageBytes);

    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Image(image),
        );
      },
    ));

    // Save the PDF file to the device
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/prescription_form.pdf');
    await file.writeAsBytes(await pdf.save());

    // Share the PDF file
    await Printing.sharePdf(bytes: await pdf.save(), filename: 'prescription_form.pdf');
    _patientNameController.clear();
    _patientNICController.clear();
    _patientAgeController.clear();
    _doctorNameController.clear();
    _doctorNotesController.clear();
    _searchMedicineController.clear();
    setState(() {
      _selectedMedicines.clear();
      _searchResults.clear();});
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          Text(value, style: const TextStyle(color: Colors.black87)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[90],
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: const Text(''),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0),
                const Center(
                  child: Text(
                    'Prescription',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _patientNameController,
                  decoration: const InputDecoration(
                    labelText: 'Patient Name',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.black87),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _patientAgeController,
                  decoration: const InputDecoration(
                    labelText: 'Patient Age',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.black87),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the age';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller:_patientNICController,
                  decoration: const InputDecoration(
                    labelText: 'Patient NIC',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.black87),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the NIC';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const Text(
                      'Gender: ',
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('Male', style: TextStyle(color: Colors.black87, fontSize: 16)),
                        leading: Radio<String>(
                          value: 'Male',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('Female', style: TextStyle(color: Colors.black87, fontSize: 16)),
                        leading: Radio<String>(
                          value: 'Female',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _doctorNotesController,
                  decoration: const InputDecoration(
                    labelText: 'Doctor Notes',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.black87),
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the doctor notes';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _searchMedicineController,
                  decoration: const InputDecoration(
                    labelText: 'Search Medicine',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.black87),
                  ),
                  onChanged: (value) {
                    _searchMedicine(value);
                  },
                ),
                const SizedBox(height: 8.0),
                if (_searchResults.isNotEmpty)
                  Container(
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_searchResults[index].medicineName, style: const TextStyle(color: Colors.black87)),
                          onTap: () => _selectMedicine(_searchResults[index]),
                        );
                      },
                    ),
                  ),
                const SizedBox(height: 16.0),
                const Text(
                  'Selected Medicines:',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                ..._selectedMedicines.map((medicine) => ListTile(
                  title: Text(medicine.medicineName, style: const TextStyle(color: Colors.black87)),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle, color: Colors.red),
                    onPressed: () => _removeSelectedMedicine(_selectedMedicines.indexOf(medicine)),
                  ),
                )),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _doctorNameController,
                  decoration: const InputDecoration(
                    labelText: 'Doctor Details',
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.black87),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the doctor name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const Text(
                      'Select Date:',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      _dateFormat.format(_selectedDate),
                      style: const TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    IconButton(
                      icon: const Icon(Icons.calendar_today, color: Colors.black87),
                      onPressed: () => _selectDate(context),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: ()async {
                      if (_formKey.currentState!.validate()) {

                        final db = DatabaseHelper();
                        await db.createPrescription(
                          Prescription(
                            patientName: _patientNameController.text,
                            patientNIC: _patientNICController.text,
                            patientAge: _patientAgeController.text, // Convert text to string
                            gender: _selectedGender,
                            doctorName: _doctorNameController.text,
                            date: _selectedDate,
                            doctorNotes: _doctorNotesController.text,
                            medicine: _selectedMedicines.map((e) => e.medicineName).join(', '), // Convert list of Medicine to list of names
                          ),
                        ).whenComplete(() => print('Prescription form added to the database'));
                        final prescriptionList = await db.getPrescriptions();
                        print(prescriptionList[0].patientName);
                        _createPdf();

                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                      backgroundColor: Colors.teal[400],
                    ),
                    child: const Text(
                      'Create Prescription PDF',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
