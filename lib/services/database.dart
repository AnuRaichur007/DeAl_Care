import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {
  // collection reference
  final String uid;

  DatabaseService({this.uid});


  final CollectionReference caregiverCollections = FirebaseFirestore.instance
      .collection('Caregivers');
  final CollectionReference patientCollections = FirebaseFirestore.instance
      .collection('Patients');
  final CollectionReference feedbackCollections = FirebaseFirestore.instance
      .collection('Feedback');
  final CollectionReference schedularCollections = FirebaseFirestore.instance
      .collection('Schedular');

// Division between patient users and caregiver users
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


//Collection created for storing Quiz questions!!
  Future<void> addData(userData) async {
    FirebaseFirestore.instance.collection("users").add(userData).catchError((
        e) {
      print(e);
    });
  }

  getData() async {
    return await FirebaseFirestore.instance.collection("users").snapshots();
  }

  Future<void> addQuizData(Map quizData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .set(quizData)
        .catchError((e) {
      print(e);
    });
  }

  Future<void> addQuestionData(quizData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .add(quizData)
        .catchError((e) {
      print(e);
    });
  }

  getQuizData() async {
    return await FirebaseFirestore.instance.collection("Quiz").snapshots();
  }

  getQuestionData(String quizId) async {
    return await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .get();
  }

// Collection for Feedback submitted by users!
  Future updateFeedbackDetails(String name, String email,
      String content) async {
    return await feedbackCollections.doc(uid).set({
      'Name': name,
      'Email': email,
      'Content': content
    });
  }
}
//Collection for TO-DO created by users!!

//Sorting priorities! Divide work for patients and cargiver separately


// location tracking and sending to caregiver!
