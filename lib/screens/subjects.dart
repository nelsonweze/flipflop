import 'package:flip_flop/screens/test.dart';
import 'package:flip_flop/services/models.dart';
import 'package:flip_flop/shared/shared.dart' as shared;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/shared.dart';

class SubjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Global.subjectsRef.getData(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          List<Subject> subjects = snap.data;
          return GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20.0),
            crossAxisSpacing: 10.0,
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            children: subjects
                .map((subject) => SubjectItem(subject: subject))
                .toList(),
          );
        } else {
          return LoadingScreen();
        }
      },
    );
  }
}

class SubjectItem extends StatelessWidget {
  final Subject subject;
  const SubjectItem({Key key, this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          // Hero(
          //   tag: subject.img,
          //   child:
          Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    SubjectScreen(subject: subject),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                subject?.img,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        subject?.name,
                        style:
                            TextStyle(height: 1.5, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.fade,
                        softWrap: false,
                      ),
                    ),
                  ),
                  // Text(Subject.description)
                ],
              ),
              // )
              // SubjectProgress(Subject: Subject),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}


class SubjectScreen extends StatelessWidget {
  final Subject subject;

  SubjectScreen({this.subject});

  @override
  Widget build(BuildContext context) {
    Report report = Provider.of<Report>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: shared.secondary,
      ),
      body: ListView(children: [
        // Hero(
        //   // tag: subject.img,
        //   child:
        Image.network(subject?.img, width: MediaQuery.of(context).size.width),
        // ),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            subject?.name,
            style:
                TextStyle(height: 2, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, top: 8),
          child: AppH6Text(
            text: subject?.description,
          ),
        ),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: !(report.subjects.isEmpty &&
                  report.subjects[subject.id] != null &&
                  report.subjects[subject.id]['hasCompleted'])
              ? CustomFlatButton(
                  text: 'Take a Test',
                  color: shared.dark,
                  onPressed: () => shared.route(
                      context,
                      QuizScreen(
                        quizId: subject.id,
                      )),
                )
              : Container(
                  child: Column(
                    children: <Widget>[

                    ],
                  ),
                ),
        )
        // QuizList(topic: topic)
      ]),
    );
  }
}
