import 'package:flip_flop/services/models.dart';
import 'package:flip_flop/shared/shared.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/shared.dart';
import 'screens.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Student student = Provider.of<Student>(context);
    Report report = Provider.of<Report>(context);

    List data = ['English', 'Literature', 'Economics'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: prefix0.dark,
        title: Text('Profile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 34),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      student.photoUrl,
                      height: 100,
                      width: 100,
                    )),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: AppPText(
                      text: 'Name',
                    ),
                  ),
                  AppH4Text(
                    text: student.name,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: AppPText(
                      text: 'Email',
                    ),
                  ),
                  AppH4Text(
                    text: student.email,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: AppPText(
                      text: 'Total Points',
                    ),
                  ),
                  AppH4Text(
                    text: report.total.toString(),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: AppPText(
                      text: 'School',
                    ),
                  ),
                  AppH4Text(
                    text: student.schoolId.toString(),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: AppPText(
                      text: 'Grade',
                    ),
                  ),
                  AppH4Text(
                    text: student.grade,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: AppH4Text(
                      text: 'Completed Courses',
                      color: dark,
                    ),
                  ),
                  Container(
                    height: 80,
                    margin: const EdgeInsets.only(
                        bottom: 15.0, left: 16, right: 16),
                    child: GridView.count(
                        crossAxisCount: 1,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 4,
                        scrollDirection: Axis.horizontal,
                        // Generate 100 Widgets that display their index in the List
                        children: List.generate(data.length, (index) {
                          // final post = data[index];
                          return GestureDetector(
                            child: ClipRRect(
                              child: Container(
                                height: 100,
                                width: 100,
                                color: Colors.grey[400],
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onTap: () => () {},
                          );
                        })),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: AppH4Text(
                      text: 'Interested Olympiads',
                      color: dark,
                    ),
                  ),
                  Container(
                    height: 80,
                    margin: const EdgeInsets.only(
                        bottom: 15.0, left: 16, right: 16),
                    child: GridView.count(
                        crossAxisCount: 1,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 4,
                        scrollDirection: Axis.horizontal,
                        // Generate 100 Widgets that display their index in the List
                        children: List.generate(data.length, (index) {
                          // final post = data[index];
                          return GestureDetector(
                            child: ClipRRect(
                              child: Container(
                                height: 100,
                                width: 100,
                                color: Colors.grey[400],
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            onTap: () => () {},
                          );
                        })),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
