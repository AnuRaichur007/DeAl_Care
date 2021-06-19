import 'package:deal_care/models/user.dart';
import 'package:deal_care/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

int choiceindex = 0;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in anon
  MyUser _userFromFirebase(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }
// auth change user stream

  Stream<MyUser> get user {
    return _auth.authStateChanges().map((User user) => _userFromFirebase(user));
  }

  // Future signInAnon() async {
  //   try {
  //     UserCredential result = await FirebaseAuth.instance.signInAnonymously();
  //     User user = result.user;
  //     return _userFromFirebase(user);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
  // sign in email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      //create a new document for the user with uid

      if (choiceindex == 0) {
        print(choiceindex);
        await DatabaseService(uid: user.uid)
            .updateCaregiverData(name, email, password);
      }
      if (choiceindex == 1) {
        print(choiceindex);
        await DatabaseService(uid: user.uid)
            .updatePatientData(name, email, password);
      }
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future feedbackForm(String name, String email, String content) async {
     User user = _auth.currentUser;
     if(_auth.currentUser.email== email){
       await DatabaseService(uid: user.uid).updateFeedbackDetails(name,email,content);
       // return _userFromFirebase(user);
     }

  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
