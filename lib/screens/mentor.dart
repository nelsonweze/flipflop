import 'package:flip_flop/services/models.dart';
import 'package:flip_flop/shared/shared.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/shared.dart';
import 'screens.dart';

class MentorPage extends StatefulWidget {
  final Mentor mentor;

  MentorPage({this.mentor});

  @override
  _MentorPageState createState() => _MentorPageState();
}

class _MentorPageState extends State<MentorPage> {
  Mentor mentor;

  @override
  void initState() {
    super.initState();
    mentor = widget.mentor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: prefix0.dark,
          title: Text('Mentor'),
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
                        mentor.img,
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
                      text: mentor?.name,
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
                      text: mentor?.email,
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
                        text: 'Location',
                      ),
                    ),
                    AppH4Text(
                      text: 'Moscow, Russia',
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
                        text: 'Rating',
                      ),
                    ),
                    AppH4Text(
                      text: mentor.rating.toString(),
                    ),
                  ],
                ),
              ),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(bottom: 5),
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 48, vertical: 5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            child: AppH6Text(
                              text: 'CALL',
                            ),
                            color: prefix0.dark,
                            textColor: prefix0.white,
                            onPressed: () {},
                          )),
                      Container(
                          padding: EdgeInsets.only(bottom: 5),
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 48, vertical: 5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            child: AppH6Text(
                              text: 'MESSAGE',
                            ),
                            color: prefix0.dark,
                            textColor: prefix0.white,
                            onPressed: () {},
                          )),
                    ],
                  )),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: AppH4Text(
                  text: 'Subjects',
                  color: dark,
                ),
              ),
              Container(
                child: ListView(
                    shrinkWrap: true,
                    children: List.generate(
                      mentor.subjects.length,
                      (index) {
                        final subject = mentor.subjects[index];
                        return ListTile(title: Text(subject));
                      },
                    )),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: AppH4Text(
                  text: 'Olympiads',
                  color: dark,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: ListView(
                    shrinkWrap: true,
                    children: List.generate(
                      mentor.olympiads.length,
                      (index) {
                        final subject = mentor.olympiads[index];
                        return ListTile(
                            leading: ClipRRect(
                              child: Container(
                                height: 100,
                                width: 100,
                                color: Colors.grey[400],
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Physics Olympiad'),
                                Row(
                                  children: <Widget>[
                                    AppPText(
                                      text: 'Grade ',
                                    ),
                                    prefix0.NormalText(
                                      text: '11',
                                    )
                                  ],
                                )
                              ],
                            ));
                      },
                    )),
              )
            ],
          ),
        ));
  }
}
