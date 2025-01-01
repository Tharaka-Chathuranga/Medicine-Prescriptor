import 'package:flutter/material.dart';
import 'package:sqlite_flutter_crud/Authtentication/home.dart';
import 'package:sqlite_flutter_crud/JsonModels/prescription_form_model.dart';
import 'package:sqlite_flutter_crud/SQLite/sqlite.dart';

class History extends StatelessWidget {
  const History({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search History',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PrescriptionHistory(title: 'Search History'),
    );
  }
}

class PrescriptionHistory extends StatefulWidget {
  final String title;

  const PrescriptionHistory({Key? key, required this.title});

  @override
  State<PrescriptionHistory> createState() => _PrescriptionHistoryState();
}

class _PrescriptionHistoryState extends State<PrescriptionHistory> {
  late Future<List<Prescription>> _history;

  @override
  void initState() {
    super.initState();
    _history = _fetchPrescriptionHistory();
  }

  Future<List<Prescription>> _fetchPrescriptionHistory() async {
    final db = DatabaseHelper();
    final prescriptionList = await db.getPrescriptions();
    return prescriptionList;
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
              MaterialPageRoute(builder: (context) => const HomePage()),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search by NIC or Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _history = _fetchPrescriptionHistory().then((prescriptionList) {
                    return prescriptionList.where((prescription) {
                      final patientNameLower = prescription.patientName.toLowerCase();
                      final patientNicLower = prescription.patientNIC.toLowerCase();
                      return patientNameLower.contains(value.toLowerCase()) || patientNicLower.contains(value.toLowerCase());
                    }).toList();
                  });
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Prescription>>(
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
          ),
        ],
      ),
    );
  }
}
