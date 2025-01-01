import 'package:flutter/material.dart';
import 'package:sqlite_flutter_crud/Authtentication/home.dart';
import 'package:sqlite_flutter_crud/SQLite/sqlite.dart';
import 'package:sqlite_flutter_crud/JsonModels/medicine_model.dart';

class MedicineAddingPage extends StatefulWidget {
  const MedicineAddingPage({super.key});

  @override
  State<MedicineAddingPage> createState() => _MedicineAddingPageState();
}

class _MedicineAddingPageState extends State<MedicineAddingPage> {
  final TextEditingController _medicineNameController = TextEditingController();
  final TextEditingController _dosageMGController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();

  // final TextEditingController _frequencyController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String _selectedMedicineType = 'Tablet';
  final List<String> _medicineTypes = ['Tablet', 'Syrup', 'Spray', 'Injection'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff04ab90),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        title: const Text(''),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ListTile(
                    title: Text(
                      "Add New Medicine",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  buildInputField(_medicineNameController, Icons.medication,
                      "Medicine Name"),
                  buildInputField(
                      _dosageMGController, Icons.numbers, "Dosage(mg)"),
                  buildInputField(
                      _companyController, Icons.business, "Company"),
                  buildDropdownField(),
                  // buildInputField(_frequencyController, Icons.schedule, "Frequency (e.g., twice a day)"),
                  const SizedBox(height: 16.0),
                  Container(
                    height: 50,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(
                        color: const Color(0xFF004d40).withOpacity(0.8),
                        width: 2.0,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          final db = DatabaseHelper();
                          await db.createMedicine(
                            Medicine(
                              medicineName: _medicineNameController.text,
                              dosageMG: _dosageMGController.text,
                              company: _companyController.text,
                              medicineType: _selectedMedicineType,
                              // frequency: _frequencyController.text,
                            ),
                          ).whenComplete(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Medicine Added Successfully')),
                          );
                        }
                      },
                      child: const Text(
                        "Add Medicine",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputField(TextEditingController controller, IconData icon,
      String hintText) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.indigo.shade900.withOpacity(.2),
      ),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return "$hintText is required";
          }
          return null;
        },
        decoration: InputDecoration(
          icon: Icon(icon),
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }

  Widget buildDropdownField() {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.indigo.shade900.withOpacity(.2),
      ),
      child: DropdownButtonFormField<String>(
        value: _selectedMedicineType,
        items: _medicineTypes.map((String type) {
          return DropdownMenuItem<String>(
            value: type,
            child: Text(type),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            _selectedMedicineType = newValue!;
          });
        },
        decoration: const InputDecoration(
          icon: Icon(Icons.category),
          border: InputBorder.none,
          hintText: "Medicine Type",
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Medicine Type is required";
          }
          return null;
        },
      ),
    );
  }
}
