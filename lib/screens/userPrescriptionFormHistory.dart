import 'package:flutter/material.dart';
import 'package:sqlite_flutter_crud/Authtentication/home.dart';
import 'package:sqlite_flutter_crud/JsonModels/prescription_form_model.dart';
import 'package:sqlite_flutter_crud/SQLite/sqlite.dart';
import 'package:sqlite_flutter_crud/screens/patient_list.dart';

class UserPrescriptionHistory extends StatefulWidget {
  final String title;
  final String nic;

  const UserPrescriptionHistory({Key? key, required this.title, required this.nic});

  @override
  State<UserPrescriptionHistory> createState() => _UserPrescriptionHistoryState();
}

class _UserPrescriptionHistoryState extends State<UserPrescriptionHistory> {
  late Future<List<Prescription>> _history;

  @override
  void initState() {
    super.initState();
    _history = _fetchAndFilterPrescriptionHistory(widget.nic);
  }

  Future<List<Prescription>> _fetchAndFilterPrescriptionHistory(String nic) async {
    final db = DatabaseHelper();
    final prescriptionList = await db.getPrescriptions();
    final filteredList = prescriptionList.where((prescription) => prescription.patientNIC == nic).toList();
    return filteredList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        backgroundColor: const Color(0xff077028),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const PatientList()),
            );
          },
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder<List<Prescription>>(
        future: _history,
        builder: (BuildContext context, AsyncSnapshot<List<Prescription>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data'));
          } else {
            final history = snapshot.data!;
            return ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=${index % 10 + 1}'),
                    ),
                    title: Text('Patient NIC: ${history[index].patientNIC}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Patient Name: ${history[index].patientName}'),
                        Text('Age: ${history[index].patientAge}'),
                        Text('Gender: ${history[index].gender}'),
                        Text('Doctor Name: ${history[index].doctorName}'),
                        Text('Date: ${history[index].date.month},${history[index].date.day},${history[index].date.year}'),
                        Text('Doctor Notes: ${history[index].doctorNotes}'),
                        Text('Medicine: ${history[index].medicine}'), // Display medicine
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
