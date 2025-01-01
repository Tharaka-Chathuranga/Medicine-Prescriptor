// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// //
// // class Home extends StatefulWidget {
// //   const Home({Key? key}) : super(key: key);
// //
// //   @override
// //   State<Home> createState() => _HomeState();
// // }
// //
// // class _HomeState extends State<Home> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Login App',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: LoginPage(),
// //     );
// //   }
// // }
// //
// // class LoginPage extends StatefulWidget {
// //   @override
// //   _LoginPageState createState() => _LoginPageState();
// // }
// //
// // class _LoginPageState extends State<LoginPage> {
// //   final TextEditingController _usernameController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Login'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             TextField(
// //               controller: _usernameController,
// //               decoration: InputDecoration(
// //                 labelText: 'Username',
// //                 border: const OutlineInputBorder(),
// //                 filled: true,
// //                 fillColor: Colors.green[50], // Light green color
// //               ),
// //             ),
// //             const SizedBox(height: 20.0),
// //             TextField(
// //               controller: _passwordController,
// //               obscureText: true,
// //               decoration: InputDecoration(
// //                 labelText: 'Password',
// //                 border: const OutlineInputBorder(),
// //                 filled: true,
// //                 fillColor: Colors.green[50], // Light green color
// //               ),
// //             ),
// //             const SizedBox(height: 20.0),
// //             ElevatedButton(
// //               onPressed: () {
// //                 String username = _usernameController.text;
// //                 String password = _passwordController.text;
// //                 // Perform login logic here (e.g., validate credentials)
// //                 // For demo purposes, just print the username and password
// //                 print('Username: $username');
// //                 print('Password: $password');
// //               },
// //               style: ElevatedButton.styleFrom(),
// //               child: const Text('Login'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class Login extends StatelessWidget {
// //   const Login({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: Container(
// //         padding: const EdgeInsets.symmetric(vertical: 30),
// //         width: double.infinity,
// //         decoration: const BoxDecoration(
// //           gradient: LinearGradient(
// //             begin: Alignment.topCenter,
// //             colors: [Colors.white, Colors.blueAccent, Colors.lightBlueAccent],
// //           ),
// //         ),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: <Widget>[
// //             const SizedBox(height: 20),
// //             const Padding(
// //               padding: EdgeInsets.all(20),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: <Widget>[
// //                   Text(
// //                     "Login",
// //                     style: TextStyle(color: Colors.white, fontSize: 40),
// //                   ),
// //                   SizedBox(height: 10),
// //                   Text(
// //                     "Welcom Back",
// //                     style: TextStyle(color: Colors.white, fontSize: 18),
// //                   ),
// //                   SizedBox(height: 10),
// //                   Text(
// //                     "Sign into your account",
// //                     style: TextStyle(color: Colors.black),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             const SizedBox(height: 10),
// //             Expanded(
// //               child: Container(
// //                 decoration: const BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.only(
// //                     topLeft: Radius.circular(60),
// //                     topRight: Radius.circular(60),
// //                   ),
// //                 ),
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(30),
// //                   child: Column(
// //                     children: <Widget>[
// //                       const SizedBox(height: 40),
// //                       Container(
// //                         padding: const EdgeInsets.all(20),
// //                         decoration: BoxDecoration(
// //                           color: Colors.white,
// //                           borderRadius: BorderRadius.circular(10),
// //                           boxShadow: [
// //                             const BoxShadow(
// //                               color: Colors.blue,
// //                               blurRadius: 20,
// //                               offset: Offset(0, 10),
// //                             ),
// //                           ],
// //                         ),
// //                         child: Column(
// //                           children: <Widget>[
// //                             Container(
// //                               padding: const EdgeInsets.all(10),
// //                               decoration: const BoxDecoration(
// //                                 border: Border(
// //                                   bottom: BorderSide(color: Colors.blueGrey),
// //                                 ),
// //                               ),
// //                               child: const TextField(
// //                                 decoration: InputDecoration(
// //                                   hintText: "Email or Phone Number",
// //                                   hintStyle: TextStyle(color: Colors.grey),
// //                                   border: InputBorder.none,
// //                                 ),
// //                               ),
// //                             ),
// //                             Container(
// //                               padding: const EdgeInsets.all(10),
// //                               decoration: const BoxDecoration(
// //                                 border: Border(
// //                                   bottom: BorderSide(color: Colors.blueGrey),
// //                                 ),
// //                               ),
// //                               child: const TextField(
// //                                 decoration: InputDecoration(
// //                                   hintText: "Password",
// //                                   hintStyle: TextStyle(color: Colors.grey),
// //                                   border: InputBorder.none,
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       const SizedBox(height: 20),
// //                       const Text(
// //                         "Forgot Password?",
// //                         style: TextStyle(color: Colors.grey),
// //                       ),
// //                       const SizedBox(height: 20),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         children: <Widget>[
// //                           ElevatedButton(
// //                             onPressed: () {
// //                               Navigator.pushNamed(context, '/third');
// //                             },
// //                             style: ElevatedButton.styleFrom(
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(80.0),
// //                               ),
// //                             ),
// //                             child: Ink(
// //                               decoration: BoxDecoration(
// //                                 borderRadius: BorderRadius.circular(80.0),
// //                               ),
// //                               child: Container(
// //                                 alignment: Alignment.center,
// //                                 constraints: const BoxConstraints(
// //                                   maxWidth: 150.0,
// //                                   minHeight: 50.0,
// //                                 ),
// //                                 child: const Text(
// //                                   'Login',
// //                                   style: TextStyle(
// //                                     color: Colors.white,
// //                                     fontWeight: FontWeight.bold,
// //                                     fontSize: 20.0,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                           ElevatedButton(
// //                             onPressed: () {
// //                               Navigator.pushNamed(context, '/thrid');
// //                             },
// //                             style: ElevatedButton.styleFrom(
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(80.0),
// //                               ),
// //                             ),
// //                             child: Ink(
// //                               decoration: BoxDecoration(
// //                                 borderRadius: BorderRadius.circular(80.0),
// //                               ),
// //                               child: Container(
// //                                 alignment: Alignment.center,
// //                                 constraints: const BoxConstraints(
// //                                   maxWidth: 150.0,
// //                                   minHeight: 50.0,
// //                                 ),
// //                                 child: const Text(
// //                                   'Sign Up',
// //                                   style: TextStyle(
// //                                     color: Colors.white,
// //                                     fontWeight: FontWeight.bold,
// //                                     fontSize: 20.0,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:newapp/reusable_widget/reusable_widget.dart';
// // // import 'package:newapp/utils/color_utils.dart';
// // // import 'package:flutter/material.dart';
// //
// // // class SignUpScreen extends StatefulWidget {
// // //   const SignUpScreen({Key? key}) : super(key: key);
// //
// // //   @override
// // //   _SignUpScreenState createState() => _SignUpScreenState();
// // // }
// //
// // // class _SignUpScreenState extends State<SignUpScreen> {
// // //   TextEditingController _passwordTextController = TextEditingController();
// // //   TextEditingController _emailTextController = TextEditingController();
// // //   TextEditingController _userNameTextController = TextEditingController();
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       extendBodyBehindAppBar: true,
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.transparent,
// // //         elevation: 0,
// // //         title: const Text(
// // //           "Sign Up",
// // //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// // //         ),
// // //       ),
// // //       body: Container(
// // //           width: MediaQuery.of(context).size.width,
// // //           height: MediaQuery.of(context).size.height,
// // //           decoration: BoxDecoration(
// // //               gradient: LinearGradient(colors: [
// // //             hexStringToColor("CB2B93"),
// // //             hexStringToColor("9546C4"),
// // //             hexStringToColor("5E61F4")
// // //           ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
// // //           child: SingleChildScrollView(
// // //               child: Padding(
// // //             padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
// // //             child: Column(
// // //               children: <Widget>[
// // //                 const SizedBox(
// // //                   height: 20,
// // //                 ),
// // //                 reusableTextField("Enter UserName", Icons.person_outline, false,
// // //                     _userNameTextController),
// // //                 const SizedBox(
// // //                   height: 20,
// // //                 ),
// // //                 reusableTextField("Enter Email Id", Icons.person_outline, false,
// // //                     _emailTextController),
// // //                 const SizedBox(
// // //                   height: 20,
// // //                 ),
// // //                 reusableTextField("Enter Password", Icons.lock_outlined, true,
// // //                     _passwordTextController),
// // //                 const SizedBox(
// // //                   height: 20,
// // //                 ),
// // //                 firebaseUIButton(context, "Sign Up", () {
// // //                   FirebaseAuth.instance
// // //                       .createUserWithEmailAndPassword(
// // //                           email: _emailTextController.text,
// // //                           password: _passwordTextController.text)
// // //                       .then((value) {
// // //                     print("Created New Account");
// // //                     Navigator.pushNamed(context, '/thrid');
// // //                   }).onError((error, stackTrace) {
// // //                     print("Error ${error.toString()}");
// // //                   });
// // //                 })
// // //               ],
// // //             ),
// // //           ))),
// // //     );
// // //   }
// // // }
// //
//  import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:sqlite_flutter_crud/Authtentication/home.dart';
// import 'package:sqlite_flutter_crud/JsonModels/medicine_model.dart';
// import 'package:sqlite_flutter_crud/JsonModels/prescription_form_model.dart';
// import 'package:sqlite_flutter_crud/SQLite/sqlite.dart';
//
// class PrescriptionForm extends StatefulWidget {
//   const PrescriptionForm({super.key});
//
//   @override
//   _PrescriptionFormState createState() => _PrescriptionFormState();
// }
//
// class _PrescriptionFormState extends State<PrescriptionForm> {
//   late Future<List<Medicine>> _medicines;
//   final List<Medicine> _selectedMedicines = [];
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
//
//   void _selectMedicine(Medicine selectedMedicine) {
//     setState(() {
//       _searchMedicineController.text = '';
//       _selectedMedicines.add(selectedMedicine);
//     });
//   }
//
//   // Function to remove a selected medicine
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
//   final TextEditingController _doctorNameController = TextEditingController();
//   final TextEditingController _patientNICController = TextEditingController();
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
//       backgroundColor: Colors.teal[50],
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         backgroundColor: Colors.teal[400],
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => const HomePage()),
//             );
//           },
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Center(
//                   child: Text(
//                     'Prescription',
//                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black87),
//                   ),
//                 ),
//
//
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _patientNameController,
//                   decoration: const InputDecoration(
//                     labelText: 'Patient Name',
//                     labelStyle: TextStyle(color: Colors.black87),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the patient name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _patientNICController,
//                   decoration: const InputDecoration(
//                     labelText: 'Patient NIC',
//                     labelStyle: TextStyle(color: Colors.black87),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the patient NIC';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _patientAgeController,
//                   decoration: const InputDecoration(
//                     labelText: 'Patient Age',
//                     labelStyle: TextStyle(color: Colors.black87),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter the patient age';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 Row(
//                   children: [
//                     const Text('Gender: ', style: TextStyle(color: Colors.black87)),
//                     Expanded(
//                       child: ListTile(
//                         title: const Text('Male', style: TextStyle(color: Colors.black87,fontSize: 13)),
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
//
//                         title: const Text('Female', style: TextStyle(color: Colors.black87,fontSize: 13)),
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
//                 const SizedBox(height: 16.0),
//                 const Text(
//                   'Medicine',
//                   style: TextStyle(fontSize: 16, color: Colors.black87),
//                 ),
//                 TextField(
//                   controller: _searchMedicineController,
//                   decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.search),
//                     labelStyle: TextStyle(color: Colors.black87),
//                   ),
//                   maxLines: 1,
//                   onChanged: (value) {
//                     setState(() {
//                       _medicines = _fetchMedicines().then((medicinesList) => medicinesList
//                           .where((medicine) =>
//                           medicine.medicineName.toLowerCase().contains(value.toLowerCase()))
//                           .toList());
//                     });
//                   },
//                 ),
//                 // Display the list of filtered medicines
//                 FutureBuilder<List<Medicine>>(
//                   future: _medicines,
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const CircularProgressIndicator();
//                     } else if (snapshot.hasError) {
//                       return Text('Error: ${snapshot.error}');
//                     } else {
//                       List<Medicine> medicinesList = snapshot.data!;
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Available Medicines:',
//                             style: TextStyle(fontSize: 16, color: Colors.black87),
//                           ),
//                           ListView(
//                             shrinkWrap: true,
//                             children: [
//                               SizedBox(
//                                 height: 150,
//                                 child: ListView.builder(
//                                   itemCount: medicinesList.length > 2 ? 2 : medicinesList.length,
//                                   itemBuilder: (context, index) {
//                                     return ListTile(
//                                       title: Text(medicinesList[index].medicineName),
//                                       // subtitle: Text(
//                                       //     ' ${medicinesList[index].frequency}'),
//                                       onTap: () => _selectMedicine(medicinesList[index]),
//                                     );
//                                   },
//                                 ),
//                               ),
//                               if (medicinesList.length > 2)
//                                 const ListTile(
//                                   title: Text('Search to view more...', style: TextStyle(fontSize: 16, color: Colors.deepPurpleAccent)),
//                                 ),
//                             ],
//                           ),
//
//
//                         ],
//                       );
//                     }
//                   },
//                 ),
//                 // Display the selected medicines
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Selected Medicines:',
//                       style: TextStyle(fontSize: 16, color: Colors.black87),
//                     ),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: _selectedMedicines.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           title: Text(_selectedMedicines[index].medicineName,),
//                           //subtitle: Text('${_selectedMedicines[index].frequency}'),
//                           trailing: IconButton(
//                             icon: const Icon(Icons.close),
//                             onPressed: () => _removeSelectedMedicine(index),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _doctorNotesController,
//                   decoration: const InputDecoration(
//                     labelText: 'Note',
//                     border: OutlineInputBorder(),
//                     labelStyle: TextStyle(color: Colors.black87),
//                   ),
//                   maxLines: 3,
//                 ),
//                 const SizedBox(height: 16.0),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         controller: _doctorNameController,
//                         decoration: const InputDecoration(
//                           labelText: 'Doctor Details',
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
//                 const SizedBox(height: 16.0),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       if (_formKey.currentState!.validate()) {
//                         final prescription = Prescription(
//                           patientName: _patientNameController.text,
//                           patientNIC: _patientNICController.text,
//                           patientAge: int.parse(_patientAgeController.text),
//                           gender: _selectedGender,
//                           doctorName: _doctorNameController.text,
//                           date: _selectedDate,
//                           doctorNotes: _doctorNotesController.text,
//                           medicine: _searchMedicineController.text,
//                         );
//
//                         final db = DatabaseHelper();
//                         await db.createPrescription(prescription).whenComplete(() {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const HomePage()),
//                           );
//                         });
//
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Prescription Added Successfully')),
//                         );
//                       }
//                     },
//                     child: const Text('Submit'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
// }