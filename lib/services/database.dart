import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {
  // collection reference
  final String uid;

  DatabaseService({this.uid});


  final CollectionReference caregiverCollections = FirebaseFirestore.instance
      .collection('Caregivers');
  final CollectionReference patientCollections = FirebaseFirestore.instance
      .collection('Patients');

  Future updatePatientData(String name, String email, String password) async {
    return await patientCollections.doc(uid).set({
      'Name': name,
      'Email': email,
      'Password': password,
    });
  }

  Future updateCaregiverData(String name, String email, String password) async {
    return await caregiverCollections.doc(uid).set({
      'Name': name,
      'Email': email,
      'Password': password,
    });
  }
}
