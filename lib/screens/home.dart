import 'package:flip_flop/screens/course.dart';
import 'package:flip_flop/screens/subjects.dart';
import 'package:flip_flop/services/models.dart';
import 'package:flip_flop/services/services.dart';
import 'package:flip_flop/shared/shared.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../shared/shared.dart';
import 'olympiad.dart';
import 'screens.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService auth = AuthService();
  int index;

  @override
  void initState() {
    auth.getUser().then(
      (user) {
        if (user == null) {
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
    );
    super.initState();
    index = 0;
  }

  List<Widget> pages = [MyHome(), SubjectsScreen(), Container()];

  List<Widget> titles = [
    SvgPicture.asset('assets/logo.svg'),
    Text('Explore'),
    Text('Inbox'),
  ];

  List<String> options = [
    'View Profile',
    'Subjects',
    'Mentors',
    'Courses',
    'Settings'
  ];

  @override
  Widget build(BuildContext context) {
    Student student = Provider.of<Student>(context);

    drawer(Student student) {
      return Drawer(
          child: Container(
        color: prefix0.dark,
        padding: EdgeInsets.only(top: 60, left: 16),
        child: student != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 16, bottom: 8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          student.photoUrl,
                          height: 50,
                          width: 50,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 2, left: 16, bottom: 10),
                    child: NormalText(
                      text: student.name,
                      color: prefix0.white,
                    ),
                  ),
                  Divider(color: prefix0.white),
                  ListTile(
                    leading: Icon(Icons.account_circle, color: prefix0.white),
                    title: NormalText(
                      text: 'Profile',
                      color: prefix0.white,
                      font: 16,
                    ),
                    onTap: () => prefix0.route(context, Profile()),
                  ),
                  ListTile(
                    leading: Icon(Icons.subject, color: prefix0.white),
                    title: NormalText(
                      text: 'Subject',
                      color: prefix0.white,
                      font: 16,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.people, color: prefix0.white),
                    title: NormalText(
                      text: 'Mentors',
                      color: prefix0.white,
                      font: 16,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.school, color: prefix0.white),
                    title: NormalText(
                      text: 'Courses',
                      color: prefix0.white,
                      font: 16,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: prefix0.white),
                    title: NormalText(
                      text: 'Settings',
                      color: prefix0.white,
                      font: 16,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      color: prefix0.white,
                    ),
                    title: NormalText(
                      text: 'Logout',
                      color: prefix0.white,
                      font: 16,
                    ),
                  )
                ],
              )
            : Container(),
      ));
    }

    return Scaffold(
        appBar: AppBar(
            backgroundColor: prefix0.dark,
            title: titles[index],
            actions: [
              IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () => showSearch(
                    context: context, delegate: CustomSearchDelegate()),
                // onPressed: showSearch(context: context, delegate: CustomSearchDelegate),
              ),
            ]),
        drawer: drawer(student),
        body: pages[index],
        backgroundColor: prefix0.lightGray,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 20), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.poll, size: 20), title: Text('Olympiads')),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail, size: 20), title: Text('Inbox')),
          ].toList(),
          fixedColor: prefix0.dark,
          elevation: 4,
          onTap: (int idx) {
            setState(() {
              index = idx;
            });
          },
        ));
  }
}

skeleton(dynamic item, BuildContext context, page) {
  return Container(
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => prefix0.route(context, page(item)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              item?.img,
              height: 80,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: AppH5Text(
                  text: item.name ?? item.title,
                  overflow: TextOverflow.fade,
                  // softWrap: false,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

mentorItem(Mentor mentor, BuildContext context) {
  return GestureDetector(
    onTap: () => prefix0.route(context, MentorPage(mentor: mentor)),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: EdgeInsets.only(top: 8),
        child: Column(
          children: <Widget>[
            ClipRRect(
              child: Image.network(
                mentor.img,
                height: 100,
                width: 100,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            Flexible(
              child: Container(
                child: AppH5Text(
                  text: mentor.name,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  prefix0.AppPText(
                    text: 'Rating : ',
                  ),
                  AppH5Text(
                    text: mentor.rating.toString(),
                    align: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 8),
              child: Row(
                children: <Widget>[
                  prefix0.AppPText(
                    text: 'Subjects : ',
                  ),
                  Flexible(
                      child: AppH5Text(
                    text: mentor.subjects.reduce((a, b) => '$a , $b'),
                    overflow: TextOverflow.ellipsis,
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

courseItem(Course course) {
  print(course.img);
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Container(
      padding: EdgeInsets.only(top: 4),
      child: Column(
        children: <Widget>[
          Image.network(course.img),
          Container(
            child: AppH5Text(
              text: course.name,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                prefix0.AppPText(
                  text: 'By : ',
                ),
                AppH5Text(
                  text: course.author,
                  align: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 8),
            child: Row(
              children: <Widget>[
                prefix0.AppPText(
                  text: 'Grades : ',
                ),
                Flexible(
                    child: AppH5Text(
                  text: course.grades.reduce((a, b) => '$a , $b'),
                  overflow: TextOverflow.ellipsis,
                )),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

rowList(List data, Widget widget) {
  return data != null
      ? Container(
          height: 150,
          margin: const EdgeInsets.only(bottom: 15.0, left: 16, right: 16),
          child: GridView.count(
              crossAxisCount: 1,
              mainAxisSpacing: 8,
              crossAxisSpacing: 4,
              scrollDirection: Axis.horizontal,
              // Generate 100 Widgets that display their index in the List
              children: List.generate(data.length, (index) {
                final item = data[index];
                return widget;
              })),
        )
      : Container();
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    List<Mentor> mentors = Provider.of<List<Mentor>>(context);
    List<Subject> subjects = Provider.of<List<Subject>>(context);
    List<Olympiad> olympiads = Provider.of<List<Olympiad>>(context);
    List<Course> courses = Provider.of<List<Course>>(context);

    mentors?.sort((a, b) => b.rating.toString().compareTo(a.rating.toString()));

    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: AppH4Text(
              text: 'Suggested Olympiads',
              color: prefix0.dark,
            ),
          ),
          Container(
            height: 180,
            margin: const EdgeInsets.only(bottom: 15.0, left: 16, right: 16),
            child: GridView.count(
                crossAxisCount: 1,
                mainAxisSpacing: 8,
                crossAxisSpacing: 4,
                scrollDirection: Axis.horizontal,
                // Generate 100 Widgets that display their index in the List
                children: List.generate(olympiads.length, (index) {
                  final item = olympiads[index];
                  return skeleton(
                      item,
                      context,
                      (val) => OlympiadScreen(
                            olympiad: val,
                          ));
                })),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: AppH4Text(
              text: 'Pick your favorite Subjects',
              color: prefix0.dark,
            ),
          ),
          Container(
            height: 180,
            margin: const EdgeInsets.only(bottom: 15.0, left: 16, right: 16),
            child: GridView.count(
                crossAxisCount: 1,
                mainAxisSpacing: 8,
                crossAxisSpacing: 4,
                scrollDirection: Axis.horizontal,
                // Generate 100 Widgets that display their index in the List
                children: List.generate(subjects.length, (index) {
                  final item = subjects[index];
                  return SubjectItem(
                    subject: item,
                  );
                })),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: AppH4Text(
              text: 'Mentors you might like',
              color: prefix0.dark,
            ),
          ),
          Container(
            height: 200,
            margin: const EdgeInsets.only(bottom: 15.0, left: 16, right: 16),
            child: GridView.count(
                crossAxisCount: 1,
                mainAxisSpacing: 8,
                crossAxisSpacing: 4,
                scrollDirection: Axis.horizontal,
                // Generate 100 Widgets that display their index in the List
                children: List.generate(mentors.length, (index) {
                  final item = mentors[index];
                  return mentorItem(item, context);
                })),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: AppH4Text(
              text: 'Suggested Courses',
              color: prefix0.dark,
            ),
          ),
          Container(
            height: 160,
            margin: const EdgeInsets.only(bottom: 15.0, left: 16, right: 16),
            child: GridView.count(
                crossAxisCount: 1,
                mainAxisSpacing: 8,
                crossAxisSpacing: 4,
                scrollDirection: Axis.horizontal,
                // Generate 100 Widgets that display their index in the List
                children: List.generate(courses.length, (index) {
                  final item = courses[index];
                  return skeleton(
                      item, context, (val) => CourseScreen(course: val));
                })),
          ),
        ],
      ),
    );
  }
}
