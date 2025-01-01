// import 'package:flutter/material.dart';

// void main() {
//   runApp(RegistrationApp());
// }

// class RegistrationApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Registration Form',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
   
//     );
//   }
// }

// class RegistrationPage extends StatefulWidget {
//   @override
//   _RegistrationPageState createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   TextEditingController _firstNameController = TextEditingController();
//   TextEditingController _lastNameController = TextEditingController();
//   TextEditingController _dobController = TextEditingController();
//   TextEditingController _nicController = TextEditingController();
//   String _selectedGender = 'Male';

//   @override 
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 84, 176, 226),
//           shadowColor: Color.fromRGBO(237, 241, 239, 1),
//         title: Text('Registration Form' ,style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 25.0),
//           ) ,

          
//       ),

//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'First Name',
//               style: TextStyle(fontSize: 16.0),
//             ),
//             TextFormField(
//               controller: _firstNameController,
//               decoration: InputDecoration(
//                 hintText: 'Enter your first name',
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Text(
//               'Last Name',
//               style: TextStyle(fontSize: 16.0),
//             ),
//             TextFormField(
//               controller: _lastNameController,
//               decoration: InputDecoration(
//                 hintText: 'Enter your last name',
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Text(
//               'Speciality',
//               style: TextStyle(fontSize: 16.0),
//             ),
//             TextFormField(
//               controller: _dobController,
//               decoration: InputDecoration(
//                 hintText: 'Enter your Speciality',
//               ),
//             ),

//             SizedBox(height: 20.0),
//             Text(
//               'Current workplace',
//               style: TextStyle(fontSize: 16.0),
//             ),
//             TextFormField(
//               controller: _dobController,
//               decoration: InputDecoration(
//                 hintText: 'Enter your current workplace',
//               ),
//             ),

//             SizedBox(height: 20.0),
//             Text(
//               'Email address',
//               style: TextStyle(fontSize: 16.0),
//             ),
//             TextFormField(
//               controller: _nicController,
//               decoration: InputDecoration(
//                 hintText: 'Enter your Email address',
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Text(
//               'Gender',
//               style: TextStyle(fontSize: 16.0),
//             ),
//             DropdownButton<String>(
//               value: _selectedGender,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedGender = newValue!;
//                 });
//               },
//               items: <String>['Male', 'Female', 'Other']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 String firstName = _firstNameController.text;
//                 String lastName = _lastNameController.text;
//                 String dob = _dobController.text;
//                 String nic = _nicController.text;
//                 String gender = _selectedGender;
//                 // Perform registration logic here
//                 // For demo purposes, just print the entered values
//                 print('First Name: $firstName');
//                 print('Last Name: $lastName');
//                 print('Date of Birth: $dob');
//                 print('NIC: $nic');
//                 print('Gender: $gender');
//               },
              
//               child: Text('Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
/*import 'package:flutter/material.dart';
import 'package:newapp/model/user.dart';
import 'package:newapp/services/database_helper.dart' ;// Import the User model

void main() {
  runApp(RegistrationApp());
}

class RegistrationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.white, Colors.blueAccent, Colors.lightBlueAccent])),),);
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();

  late DatabaseHelper _databaseHelper; // Declare DatabaseHelper instance

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper(); // Initialize DatabaseHelper instance
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Name',
              style: TextStyle(fontSize: 16.0),
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter your name',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Username',
              style: TextStyle(fontSize: 16.0),
            ),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Enter your username',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Birth Date',
              style: TextStyle(fontSize: 16.0),
            ),
            TextFormField(
              controller: _birthDateController,
              decoration: InputDecoration(
                hintText: 'Enter your birth date',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Password',
              style: TextStyle(fontSize: 16.0),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true, // Hide the password text
              decoration: InputDecoration(
                hintText: 'Enter your password',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _registerUser,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to save user data to the database
  void _registerUser() async {
    print('object');
    String name = _nameController.text;
    String username = _usernameController.text;
    String birthDate = _birthDateController.text;
    String password = _passwordController.text;

    // Create a User object with the entered data
    User user = User(name, username, birthDate, password);

    // Insert the user into the database
    int result = await _databaseHelper.insertUser(user);

    // Check if the user was inserted successfully
    if (result != 0) {
      // User inserted successfully
      print('User registered successfully');
      // Clear the text input fields after registration
      _nameController.clear();
      _usernameController.clear();
      _birthDateController.clear();
      _passwordController.clear();
    } else {
      // Error inserting user
      print('Error registering user');
    }
  }
}*/





/*import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
      const Registration({super.key});

      @override 
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.white, Colors.blueAccent, Colors.lightBlueAccent])),
          
          child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding:EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Registration",
                            style: TextStyle(color: Colors.white,fontSize: 40),
                          ),
                      ),
                         ),
                        ],
                  
          
          
          
          ));
      }}*/

import 'package:flutter/material.dart';


class RegistrationApp extends StatelessWidget {
  const RegistrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _doctorNameController = TextEditingController();
  final TextEditingController _specialtyController = TextEditingController();
  final TextEditingController _licenseDateController = TextEditingController();
  final TextEditingController _licenseLocationController = TextEditingController();
  final TextEditingController _workplaceController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final String _selectedGender = 'Male';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _licenseDateController) {
      setState(() {
        _licenseDateController.text = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: Text(
                'Registration Form',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Name',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            TextFormField(
              controller: _doctorNameController,
              decoration: const InputDecoration(
                hintText: 'Enter your doctor name',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Specialty',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            TextFormField(
              controller: _specialtyController,
              decoration: const InputDecoration(
                hintText: 'Enter your specialty',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Date of Obtaining License',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _licenseDateController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: const InputDecoration(
                      hintText: 'Select date',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Location & Country of License',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            TextFormField(
              controller: _licenseLocationController,
              decoration: const InputDecoration(
                hintText: 'Enter location & country of license',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Current Workplace',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            TextFormField(
              controller: _workplaceController,
              decoration: const InputDecoration(
                hintText: 'Enter your current workplace',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Phone Number',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            TextFormField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'Enter your phone number',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Email Address',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Enter your email address',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Perform registration logic here
                // For demo purposes, just print the entered values
                print('Name: ${_doctorNameController.text}');
                print('Specialty: ${_specialtyController.text}');
                print('Date of Obtaining License: ${_licenseDateController.text}');
                print('Location & Country of License: ${_licenseLocationController.text}');
                print('Current Workplace: ${_workplaceController.text}');
                print('Phone Number: ${_phoneNumberController.text}');
                print('Email Address: ${_emailController.text}');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: const Text('Submit Form'),
            ),
          ],
        ),
      ),
    );
  }
}
