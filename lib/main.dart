import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flip_flop/services/auth.dart';
import 'package:flip_flop/services/models.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'screens/screens.dart';
import 'screens/subjects.dart';
import 'services/models.dart';
import 'shared/shared.dart' as shared;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // AuthService().signOut();
    return MultiProvider(
      providers: [
        StreamProvider<Report>.value(value: Global.reportRef.documentStream),
        StreamProvider<Student>.value(value: AuthService().getCurrentUser()),
        StreamProvider<List<Mentor>>.value(value: 
        Global.mentorsRef.streamData()
      
        ,),
        StreamProvider<List<Course>>.value(value: Global.coursesRef.streamData(),),
        StreamProvider<List<prefix0.Subject>>.value(value: Global.subjectsRef.streamData(),),
         StreamProvider<List<prefix0.Olympiad>>.value(value: Global.olympiadsRef.streamData(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Home(),
          '/subjects': (context) => SubjectsScreen(),
          '/explore': (context) => ExplorePage(),
          '/login': (context) => LoginScreen()
          // '/profile': (context) => ProfileScreen(),
          // '/about': (context) => AboutScreen(),
        },
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
        ],
        theme: ThemeData(
          fontFamily: 'Nunito',
          bottomAppBarTheme: BottomAppBarTheme(
            color: shared.secondary,
          ),
          // brightness: Brightness.dark,
          backgroundColor: shared.dark,
          textTheme: TextTheme(
            body1: TextStyle(fontSize: 18),
            body2: TextStyle(fontSize: 16),
            button: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.bold),
            headline: TextStyle(fontWeight: FontWeight.bold),
            // subhead: TextStyle(color: Colors.grey),
          ),
          buttonTheme: ButtonThemeData(),
        ),
      ),
    );
  }
}
