import 'package:flip_flop/services/models.dart';
import 'package:flip_flop/shared/list_item.dart';
import 'package:flip_flop/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/shared.dart' as shared;

class OlympiadScreen extends StatefulWidget {
  final Olympiad olympiad;

  OlympiadScreen({this.olympiad});

  @override
  _OlympiadScreenState createState() => _OlympiadScreenState();
}

class _OlympiadScreenState extends State<OlympiadScreen> {
  bool showRoadMap;
  Olympiad olympiad;

  @override
  void initState() {
    super.initState();
    showRoadMap = false;
    olympiad = widget.olympiad;
  }

  @override
  Widget build(BuildContext context) {
    Report report = Provider.of<Report>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: shared.secondary,
        ),
        body: ListView(children: [
          Image.network(olympiad.img, width: MediaQuery.of(context).size.width),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              olympiad.name,
              style: TextStyle(
                  height: 2, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 8),
            child: AppH6Text(
              text: olympiad.description,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20),
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
                  //       quizId: widget.olympiad.id,
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
