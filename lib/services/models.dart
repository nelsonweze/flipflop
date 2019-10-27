import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Student {
  double rating;
  String uid;
  String name;
  String email;
  String tel;
  String schoolId;
  String photoUrl;
  String grade;
  List olympiads;

  Student({this.uid, this.grade, this.olympiads, this.rating, this.schoolId});

  Student.fromMap(Map json)
      : uid = json["uid"] ?? '',
        email = json["email"] ?? '',
        name = json["name"] ?? '',
        photoUrl = json["photoUrl"] ??
            'https://firebasestorage.googleapis.com/v0/b/flipflop-61b96.appspot.com/o/subject.jpg?alt=media&token=fcec78b3-69e3-4da6-943d-5f9a79efe898',
        tel = json["tel"] ?? '',
        grade = json["grade"] ?? '',
        olympiads = json["olympiads"] ?? [],
        rating = json["rating"] ?? 0.0,
        schoolId = json["schoolId"] ?? '';

  toMap() {
    return {
      "uid": uid,
      "email": email,
      "name": name,
      "photoUrl": photoUrl,
      "grade": grade,
      "tel": tel,
      "olympiads": olympiads,
      "schoolId": schoolId,
      "rating": rating
    };
  }
}

class Mentor {
  String id;
  String bio;
  String email;
  String tel;
  dynamic rating;
  String name;
  String img;
  String school;
  List studentIds;
  List subjects;
  List olympiads;

  Mentor(
      {this.id,
      this.bio,
      this.email,
      this.tel,
      this.img,
      this.rating,
      this.school,
      this.name,
      this.studentIds,
      this.olympiads,
      this.subjects});

  Mentor.fromMap(Map json)
      : id = json["id"] ?? '',
        bio = json["bio"] ?? '',
        email = json["email"] ?? '',
        tel = json["tel"] ?? '',
        name = json["name"] ?? '',
        rating = json["rating"] ?? 0.0,
        img = json["img"] ??
            'https://firebasestorage.googleapis.com/v0/b/flipflop-61b96.appspot.com/o/subject.jpg?alt=media&token=fcec78b3-69e3-4da6-943d-5f9a79efe898',
        school = json["school"] ?? '',
        studentIds = json["studentIds"] ?? [],
        olympiads = json["olympiads"] ?? [],
        subjects = json["subjects"] ?? [];

  toMap() {
    return {
      "id": id,
      "email": email,
      "bio": bio,
      "studentIds": studentIds,
      "subjects": subjects,
      "rating": rating,
      "tel": tel,
      "name": name,
      "img": img,
      "school": school,
      "olympiads": olympiads
    };
  }
}

class Course {
  String id;
  String name;
  String description;
  List grades;
  String author;
  String img;
  int reward;
  String difficulty;

  Course(
      {this.author,
      this.name,
      this.description,
      this.difficulty,
      this.grades,
      this.id,
      this.img,
      this.reward});

  toMap() {
    return {
      "author": author,
      "id": id,
      "name": name,
      "description": description,
      "grades": grades,
      "img": img,
      "reward": reward
    };
  }

  Course.fromMap(Map data)
      : id = data['id'],
        name = data['name'],
        description = data['description'],
        img =  
            'https://firebasestorage.googleapis.com/v0/b/flipflop-61b96.appspot.com/o/subject.jpg?alt=media&token=fcec78b3-69e3-4da6-943d-5f9a79efe898',
        grades = data['grades'],
        reward = data['rewards'],
        author = data['author'];
}

class Olympiad {
  String name;
  String description;
  String img;
  String id;
  int value;

  Olympiad.fromMap(Map json)
      : name = json["name"] ?? '',
        description = json["description"] ?? '',
        img = 
            'https://firebasestorage.googleapis.com/v0/b/flipflop-61b96.appspot.com/o/subject.jpg?alt=media&token=fcec78b3-69e3-4da6-943d-5f9a79efe898',
        id = json["id"] ?? '',
        value = json["value"] ?? 0;
}

class Subject {
  String id;
  String name;
  String img;
  String description;
  List olympiads;

  Subject({this.olympiads, this.id, this.img, this.name});

  Subject.fromMap(Map json)
      : olympiads = json["olympiads"] ?? [],
        img = json["img"] ??
            'https://firebasestorage.googleapis.com/v0/b/flipflop-61b96.appspot.com/o/subject.jpg?alt=media&token=fcec78b3-69e3-4da6-943d-5f9a79efe898',
        name = json["name"] ?? '',
        description = json["description"] ?? '',
        id = json["id"] ?? '';

  toMap() {
    return {
      "olympiads": olympiads,
      "subjectId": id,
      "img": img,
      "description": description,
      "name": name
    };
  }
}

class Report {
  String uid;
  int total;
  Map subjects;

  Report({this.uid, this.subjects, this.total});

  factory Report.fromMap(Map data) {
    return Report(
      uid: data['uid'],
      total: data['total'] ?? 0,
      subjects: data['subjects'] ?? {},
    );
  }

  toMap() {
    return {"uid": uid, "total": total ?? 0, "subjects": subjects ?? {}};
  }
}

class Test {
  String id;
  String title;
  String description;
  // String video;
  List<Question> questions;

  Test({
    this.title,
    this.questions,
    this.description,
    this.id,
  });

  factory Test.fromMap(Map data) {
    return Test(
        id: data['id'] ?? '',
        title: data['title'] ?? '',
        // topic: data['topic'] ?? '',
        description: data['description'] ?? '',
        // video: data['video'] ?? '',
        questions: (data['questions'] as List ?? [])
            .map((v) => Question.fromMap(v))
            .toList());
  }
}

class Option {
  String value;
  String detail;
  bool correct;

  Option({this.correct, this.value, this.detail});
  Option.fromMap(Map data) {
    value = data['value'];
    detail = data['detail'] ?? '';
    correct = data['correct'];
  }
}

class Question {
  String text;
  List<Option> options;
  Question({this.options, this.text});

  Question.fromMap(Map data) {
    text = data['text'] ?? '';
    options =
        (data['options'] as List ?? []).map((v) => Option.fromMap(v)).toList();
  }
}

class UserData<T> {
  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String collection;

  UserData({this.collection});

  Stream<T> get documentStream {
    return Observable(_auth.onAuthStateChanged).switchMap((user) {
      if (user != null) {
        Document<T> doc = Document<T>(path: '$collection/${user.uid}');
        return doc.streamData();
      } else {
        return Observable<T>.just(null);
      }
    }); //.shareReplay(maxSize: 1).doOnData((d) => print('777 $d'));// as Stream<T>;
  }

  Future<T> getDocument() async {
    FirebaseUser user = await _auth.currentUser();

    if (user != null) {
      Document doc = Document<T>(path: '$collection/${user.uid}');
      return doc.getData();
    } else {
      return null;
    }
  }

  Future<void> upsert(Map data) async {
    FirebaseUser user = await _auth.currentUser();
    Document<T> ref = Document(path: '$collection/${user.uid}');
    return ref.upsert(data);
  }
}

class Document<T> {
  final Firestore _db = Firestore.instance;
  final String path;
  DocumentReference ref;

  Document({this.path}) {
    ref = _db.document(path);
  }

  Future<T> getData() {
    return ref.get().then((v) => Global.models[T](v.data) as T);
  }

  Stream<T> streamData() {
    return ref
        .snapshots()
        .map((v) => v.exists ? Global.models[T](v.data) as T : null);
  }

  Future<void> upsert(Map data) {
    return ref.setData(Map<String, dynamic>.from(data), merge: true);
  }
}

class Collection<T> {
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;

  Collection({
    this.path,
  }) {
    ref = _db.collection(path);
  }

  Future<List<T>> getData() async {
    var snapshots = await ref.getDocuments();
    return snapshots.documents
        .map((doc) => Global.models[T](doc.data) as T)
        .toList();
  }

  Stream<List<T>> streamData() {
    return ref.snapshots().map((list) {
      return list.documents
          .map((doc) => Global.models[T](doc.data) as T)
          .toList();
    });
  }
}

class CollectionGroup<T> {
  final Firestore _db = Firestore.instance;
  final String path;
  Query ref;

  CollectionGroup({this.path}) {
    ref = _db.collectionGroup(path);
  }

  Future<List<T>> getData() async {
    var snapshots = await ref.getDocuments();
    return snapshots.documents
        .map((doc) => Global.models[T](doc.data) as T)
        .toList();
  }

  Stream<List<T>> streamData() {
    return ref.snapshots().map((list) => list.documents.map((doc) {
          print(doc);
          return Global.models[T](doc.data) as T;
        }).toList());
  }
}

class Global {
  // App Data
  static final String title = 'Fireship';

  // Services
  static final FirebaseAnalytics analytics = FirebaseAnalytics();

  // Data Models
  static final Map models = {
    Student: (data) => Student.fromMap(data),
    Subject: (data) => Subject.fromMap(data),
    Report: (data) => Report.fromMap(data),
    Test: (data) => Test.fromMap(data),
    Report: (data) => Report.fromMap(data),
    Olympiad: (data) => Olympiad.fromMap(data),
    Mentor: (data) => Mentor.fromMap(data),
    Course: (data) => Course.fromMap(data)
  };

  // Firestore References for Writes
  static final Collection<Subject> subjectsRef =
      Collection<Subject>(path: 'subjects');
  static final UserData<Report> reportRef =
      UserData<Report>(collection: 'reports');
  static final Document<Olympiad> olympiadRef =
      Document<Olympiad>(path: 'olympiads/9m46cG9X16qLFywoSyyT');
  static final Document<Course> courseRef =
      Document<Course>(path: 'courses/9m46cG9X16qLFywoSyyT');
  static final Document<Mentor> mentorRef =
      Document<Mentor>(path: 'mentors/Lm5zeBoX8SPY7XllcCsH');
  static final Collection<Mentor> mentorsRef =
      Collection<Mentor>(path: 'mentors');
  static final Collection<Olympiad> olympiadsRef =
      Collection<Olympiad>(path: 'olympiads');
  static final CollectionGroup<Course> coursesRef = CollectionGroup<Course>(
    path: 'courses',
  );
}
