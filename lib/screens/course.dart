import 'package:flip_flop/services/models.dart';
import 'package:flip_flop/shared/list_item.dart';
import 'package:flip_flop/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/shared.dart' as shared;

class CourseScreen extends StatefulWidget {
  final Course course;

  CourseScreen({this.course});

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  bool showRoadMap;
  Course course;

  @override
  void initState() {
    super.initState();
    showRoadMap = false;
    course = widget.course;
  }

  @override
  Widget build(BuildContext context) {
    Report report = Provider.of<Report>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: shared.secondary,
        ),
        body: ListView(children: [
          Image.network(course.img, width: MediaQuery.of(context).size.width),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              course.name,
              style: TextStyle(
                  height: 2, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 8),
            child: AppH6Text(
              text: course.description,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10),
                child: shared.AppH4Text(
                  text: 'Related Courses',
                ),
              ),
              // ListItem()
            ],
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: CustomFlatButton(
                  text: 'Show Road Map',
                  color: shared.dark,
                  textColor: shared.white,
                  onPressed: () {
                    setState(() {
                      showRoadMap = true;
                    });
                  }
                  // => shared.route(
                  //     context,
                  //     QuizScreen(
                  //       quizId: widget.course.id,
                  //     )),
                  )
              //  Container(
              //     child: Column(
              //       children: <Widget>[],
              //     ),
              //   ),
              ),

          // QuizList(topic: topic)
        ]));
  }
}
