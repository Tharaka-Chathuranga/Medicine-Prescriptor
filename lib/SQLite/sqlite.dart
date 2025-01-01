import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_flutter_crud/JsonModels/login_model.dart';
import 'package:sqlite_flutter_crud/JsonModels/medicine_model.dart';
import 'package:sqlite_flutter_crud/JsonModels/note_model.dart';
import 'package:sqlite_flutter_crud/JsonModels/patient_model.dart';
import 'package:sqlite_flutter_crud/JsonModels/prescription_form_model.dart';
import 'package:sqlite_flutter_crud/JsonModels/users.dart';

class DatabaseHelper {
  final databaseName = "notes.db";

  // Tables creation SQL queries
  String noteTable =
      "CREATE TABLE notes (noteId INTEGER PRIMARY KEY AUTOINCREMENT, noteTitle TEXT NOT NULL, noteContent TEXT NOT NULL, createdAt TEXT DEFAULT CURRENT_TIMESTAMP)";

  String usersTable =
      "CREATE TABLE users (usrId INTEGER PRIMARY KEY AUTOINCREMENT, usrName TEXT UNIQUE, specility TEXT, university TEXT, usrPassword TEXT, usrEmail TEXT, usrCurrentworkplace TEXT)";

  String patientTable =
  '''
      CREATE TABLE patients(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        nic TEXT,
        email TEXT,
        telephone TEXT,
        gender TEXT,
        age INTEGER
      )
      ''';

  String medicineTable = '''
  CREATE TABLE medicines(
    medicineId INTEGER PRIMARY KEY AUTOINCREMENT, 
    medicineName TEXT, 
    dosageMG TEXT, 
    company TEXT, 
    medicineType TEXT
  )
''';



  String prescriptionTable =
  '''CREATE TABLE prescriptions (
          prescriptionid INTEGER PRIMARY KEY AUTOINCREMENT,
          patientName TEXT,
          patientNIC TEXT,
          patientAge TEXT,
          gender TEXT,
          doctorName TEXT,
          date TEXT,
          doctorNotes TEXT,
          medicine TEXT
        )''';

  // Initialize database
  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(noteTable);
      await db.execute(usersTable);
      await db.execute(patientTable);
      await db.execute(medicineTable);
      await db.execute(prescriptionTable);
    });
  }

  // Create a new prescription
  Future<int> createPrescription(Prescription prescription) async {
    final db = await initDB();
    return db.insert('prescriptions', prescription.toMap());
  }

  // Get all prescriptions
  Future<List<Prescription>> getPrescriptions() async {
    final db = await initDB();
    final List<Map<String, dynamic>> result = await db.query('prescriptions');
    return result.map((e) => Prescription.fromMap(e)).toList();
  }

  // Get a single prescription by ID
  Future<Prescription?> getPrescription(int id) async {
    final db = await initDB();
    final List<Map<String, dynamic>> result = await db.query(
      'prescriptions',
      where: 'prescriptionid = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return Prescription.fromMap(result.first);
    } else {
      return null;
    }
  }
  Future<List<Prescription>> getPrescriptionsByNIC(String nic) async {
    final db = await initDB();
    final List<Map<String, dynamic>> result = await db.query(
      'prescriptions',
      where: 'patientNIC = ?',
      whereArgs: [nic],
    );

    if (result.isEmpty) {
      return [];
    }

    return result.map((e) => Prescription.fromMap(e)).toList();
  }


  // Update a prescription
  Future<int> updatePrescription(Prescription prescription) async {
    final db = await initDB();
    return db.update(
      'prescriptions',
      prescription.toMap(),
      where: 'prescriptionid = ?',
      whereArgs: [prescription.prescriptionid],
    );
  }

  // Delete a prescription
  Future<int> deletePrescription(int id) async {
    final db = await initDB();
    return db.delete('prescriptions', where: 'prescriptionid = ?', whereArgs: [id]);
  }

  // CRUD operations for Medicine

  Future<int> createMedicine(Medicine medicine) async {
    final db = await initDB();
    return db.insert('medicines', medicine.toMap());
  }

  Future<List<Medicine>> getMedicines() async {
    final db = await initDB();
    final List<Map<String, dynamic>> result = await db.query('medicines');
    return result.map((e) => Medicine.fromMap(e)).toList();
  }

  Future<int> updateMedicine(Medicine medicine) async {
    final db = await initDB();
    return db.update(
      'medicines',
      medicine.toMap(),
      where: 'medicineId = ?',
      whereArgs: [medicine.medicineId],
    );
  }

  Future<int> deleteMedicine(int id) async {
    final db = await initDB();
    return db.delete('medicines', where: 'medicineId = ?', whereArgs: [id]);
  }

  // CRUD operations for Patient

  Future<int> createPatient(Patient patient) async {
    final Database db = await initDB();
    return db.insert('patients', patient.toMap());
  }

  Future<List<Patient>> getPatients() async {
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query('patients');
    return result.map((e) => Patient.fromMap(e)).toList();
  }

  Future<int> deletePatient(int id) async {
    final Database db = await initDB();
    return db.delete('patients', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updatePatient(
      String name, String telephone, String gender, int age, String email, String nic, int id) async {
    final Database db = await initDB();
    return db.rawUpdate(
      'UPDATE patients SET name = ?, telephone = ?, gender = ?, age = ?, email = ?, nic = ? WHERE id = ?',
      [name, telephone, gender, age, email, nic, id],
    );
  }

  // Other methods

  Future<bool> login(LoginModel user) async {
    final Database db = await initDB();
    var result = await db.rawQuery(
        "select * from users where usrEmail = '${user.usrEmail}' AND usrPassword = '${user.usrPassword}'");
    return result.isNotEmpty;
  }

  Future<int> signup(Users user) async {
    final Database db = await initDB();
    return db.insert('users', user.toMap());
  }

  Future<List<NoteModel>> searchNotes(String keyword) async {
    final Database db = await initDB();
    List<Map<String, Object?>> searchResult = await db.rawQuery(
        "select * from notes where noteTitle LIKE ?", ["%$keyword%"]);
    return searchResult.map((e) => NoteModel.fromMap(e)).toList();
  }

  Future<int> createNote(NoteModel note) async {
    final Database db = await initDB();
    return db.insert('notes', note.toMap());
  }

  Future<List<NoteModel>> getNotes() async {
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query('notes');
    return result.map((e) => NoteModel.fromMap(e)).toList();
  }

  Future<int> deleteNote(int id) async {
    final Database db = await initDB();
    return db.delete('notes', where: 'noteId = ?', whereArgs: [id]);
  }

  Future<int> updateNote(String title, String content, int noteId) async {
    final Database db = await initDB();
    return db.rawUpdate(
        'UPDATE notes SET noteTitle = ?, noteContent = ? WHERE noteId = ?',
        [title, content, noteId]);
  }
}
