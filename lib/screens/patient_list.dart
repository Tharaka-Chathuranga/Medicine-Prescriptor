import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sqlite_flutter_crud/JsonModels/patient_model.dart';
import 'package:sqlite_flutter_crud/Authtentication/home.dart';
import 'package:sqlite_flutter_crud/SQLite/sqlite.dart';
import 'package:sqlite_flutter_crud/screens/userPrescriptionFormHistory.dart';

class PatientList extends StatelessWidget {
  const PatientList({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registered Patients',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white10),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Registered Patients'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Patient>> _futurePatients;
  List<Patient> _patients = [];
  List<Patient> _filteredPatients = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _futurePatients = _fetchPatients();
  }

  Future<List<Patient>> _fetchPatients() async {
    final db = DatabaseHelper();
    final patientList = await db.getPatients();
    setState(() {
      _patients = patientList;
      _filteredPatients = patientList;
    });
    return patientList;
  }

  void _filterPatients(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _filteredPatients = _patients.where((patient) {
        final nameLower = patient.name.toLowerCase();
        final nicLower = patient.nic.toLowerCase();
        return nameLower.contains(_searchQuery) || nicLower.contains(_searchQuery);
      }).toList();
    });
  }

  void _navigateToPrescriptionHistory(String nic, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserPrescriptionHistory(nic: nic, title: name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
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
          'Registered Patients',
          style: const TextStyle(
            color: Colors.white, // Set the text color to white
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Search by NIC or Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  _filterPatients(value);
                },
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Patient>>(
                future: _futurePatients,
                builder: (BuildContext context, AsyncSnapshot<List<Patient>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data'));
                  } else {
                    return ListView.builder(
                      itemCount: _filteredPatients.length,
                      itemBuilder: (context, index) {
                        return _buildPatientCard(_filteredPatients[index], index);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientCard(Patient patient, int index) {
    return GestureDetector(
      onTap: () {
        _navigateToPrescriptionHistory(patient.nic, patient.name);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.yellow.withOpacity(0.1),
            backgroundBlendMode: BlendMode.overlay,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=${index % 10 + 1}'),
                ),
                title: Text(
                  patient.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text('NIC: ${patient.nic}'),
                    Text('Email: ${patient.email}'),
                    Text('Phone: ${patient.telephone}'),
                    Text('Gender: ${patient.gender}'),
                    Text('Age: ${patient.age}'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
