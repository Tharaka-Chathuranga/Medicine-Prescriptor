import 'package:flutter/material.dart';
// import 'package:your_project/database_helper.dart';
import 'package:sqlite_flutter_crud/Authtentication/home.dart';
import 'package:sqlite_flutter_crud/JsonModels/patient_model.dart';
import 'package:sqlite_flutter_crud/SQLite/sqlite.dart';

class PatientRegistrationForm extends StatefulWidget {
  const PatientRegistrationForm({super.key});

  @override
  State<PatientRegistrationForm> createState() => _PatientRegistrationForm();
}

class _PatientRegistrationForm extends State<PatientRegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _genderController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _nicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent[100],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) =>  const HomePage()));
          },
        ),
        title: const Text(''),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.person, size: 40),
                  ),
                  const SizedBox(height: 20),
                  buildInputField(_nameController, Icons.person, "Name"),
                  const SizedBox(height: 10),
                  buildInputField(_telephoneController, Icons.phone, "Telephone"),
                  const SizedBox(height: 10),
                  buildInputField(_genderController, Icons.person_outline, "Gender"),
                  const SizedBox(height: 10),
                  buildInputField(_ageController, Icons.calendar_today, "Age"),
                  const SizedBox(height: 10),
                  buildInputField(_emailController, Icons.email, "Email"),
                  const SizedBox(height: 10),
                  buildInputField(_nicController, Icons.credit_card, "NIC"),
                  const SizedBox(height: 20),
                  buildSubmitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputField(TextEditingController controller, IconData icon, String hintText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
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

  Widget buildSubmitButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            final db = DatabaseHelper();
            await db.createPatient(
              Patient(
                name: _nameController.text,
                telephone: _telephoneController.text,
                gender: _genderController.text,
                age: int.parse(_ageController.text),
                email: _emailController.text,
                nic: _nicController.text,
              ),
            ).whenComplete(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const HomePage(),
                ),
              );
            });

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Patient Registered Successfully')),
            );
            _formKey.currentState!.reset();
          }
        },
        child: const Text("Submit"),
      ),
    );
  }

}
