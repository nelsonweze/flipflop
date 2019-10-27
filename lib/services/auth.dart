import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

import 'models.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  // Future<FirebaseUser> get getUser => _auth.currentUser();

  Stream<FirebaseUser> get user => _auth.onAuthStateChanged;

  Future<String> signIn(String email, String password) async {
    final FirebaseUser user = (await _auth
        .signInWithEmailAndPassword(email: email, password: password)).user;
    return user.uid;
  }

  Future<Student> getUser() async {
    var user = await _auth.currentUser();
    if (user != null) {
      var snap = await _db.document('students/${user.uid}').get();
      return Student.fromMap(snap.data);
    }
    return null;
  }

  Future<void> updateUserData(FirebaseUser user) {
    DocumentReference reportRef = _db.collection('reports').document(user.uid);

    return reportRef.setData({'uid': user.uid, 'lastActivity': DateTime.now()},
        merge: true);
  }

  Stream<Student> getCurrentUser() {
    return Observable(_auth.onAuthStateChanged).switchMap((user) {
      if (user != null) {
        Document<Student> doc = Document<Student>(path: 'students/${user.uid}');
        return doc.streamData();
      } else
        return Observable<Student>.just(Student());
    });
  }

  Future<FirebaseUser> signUp(
      String email, String password, String name, String school) async {
    FirebaseUser user = (await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)).user;
    await user.sendEmailVerification();
    await setUserData(user, email, name, school);
    await updateReport();
    
    print('Logged in ' + user.displayName);
    return user;

    // return toaster('Email verification link sent');
  }

  setUserData(
      FirebaseUser user, String email, String name, String school) async {
    Student _user = new Student();
    _user.uid = user.uid;
    _user.name = user.displayName ?? name;
    _user.email = user.email ?? email;
    _user.schoolId = school;
    _user.photoUrl = user.photoUrl ??
        'https://firebasestorage.googleapis.com/v0/b/campuskonekt.appspot.com/o/defaults%2Fdefault_avatar.png?alt=media&token=809dda79-4dc5-459e-beb0-7ef7b84c0b81';
    await _db.document('students/${user.uid}').setData(_user.toMap());
  }

  Future<void> updateReport() async {
    var user = await _auth.currentUser();
    return Global.reportRef.upsert(Report(uid: user.uid).toMap());
  }

  Future<void> signOut() {
    return _auth.signOut();
  }
}

// keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore
