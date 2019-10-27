import 'package:flip_flop/services/models.dart';
import 'package:flip_flop/shared/progress_bar.dart';
import 'package:flip_flop/shared/shared.dart' as prefix0;
import 'package:flutter/material.dart';
import '../shared/shared.dart';
import '../services/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

// Shared Data
class QuizState with ChangeNotifier {
  double _progress = 0;
  Option _selected;
  int correctCount = 0;

  final PageController controller = PageController();

  get progress => _progress;
  get selected => _selected;

  set progress(double newValue) {
    _progress = newValue;
    notifyListeners();
  }

  set selected(Option newValue) {
    _selected = newValue;
    if (_selected.correct) {
      correctCount = correctCount + 1;
    }
    notifyListeners();
  }

  void nextPage() async {
    await controller.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
}

class QuizScreen extends StatelessWidget {
  QuizScreen({this.quizId});
  final String quizId;

  @override
  Widget build(BuildContext context) {
    Student student = Provider.of<Student>(context);

    return ChangeNotifierProvider(
      builder: (_) => QuizState(),
      child: FutureBuilder(
        future: Collection<Test>(path: 'tests/$quizId/${student.grade}').getData(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          var state = Provider.of<QuizState>(context);

          if (!snap.hasData || snap.hasError) {
            print(snap.toString());
            return LoadingScreen();
          } else {
            Test quiz = snap.data[0];
            return Scaffold(
              appBar: AppBar(
                title: AnimatedProgressbar(value: state.progress),
                leading: IconButton(
                  icon: Icon(FontAwesomeIcons.times),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              body: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                controller: state.controller,
                onPageChanged: (int idx) =>
                    state.progress = (idx / (quiz.questions.length + 1)),
                itemBuilder: (BuildContext context, int idx) {
                  if (idx == 0) {
                    return StartPage(quiz: quiz);
                  } else if (idx == quiz.questions.length + 1) {
                    return CongratsPage(
                        quiz: quiz, correctCount: state.correctCount);
                  } else {
                    return QuestionPage(question: quiz.questions[idx - 1]);
                  }
                },
              ),
            );
          }
        },
      ),
    );
  }
}

class StartPage extends StatelessWidget {
  final Test quiz;
  final PageController controller;
  StartPage({this.quiz, this.controller});

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context);

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(quiz.title, style: Theme.of(context).textTheme.headline),
          Divider(),
          Expanded(child: Text(quiz.description)),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                onPressed: state.nextPage,
                label: Text('Start Quiz!'),
                icon: Icon(Icons.poll),
                color: Colors.green,
              )
            ],
          )
        ],
      ),
    );
  }
}

class CongratsPage extends StatelessWidget {
  final Test quiz;
  final int correctCount;
  CongratsPage({this.quiz, this.correctCount});

  

  @override
  Widget build(BuildContext context) {
 
  int rating = correctCount;

    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NormalText(
            text: 'Congrats! You completed the ${quiz.title} assessement test. \nYou got $correctCount out of 5 questions correctly.',
            align: TextAlign.center,
            height: 1.33,
            font: 16,
            weight: FontWeight.normal,
            color: prefix0.white,
          ),
          Divider(),
          Image.asset('assets/congrats.gif'),
          Divider(),
          FlatButton.icon(
            color:  rating > 3.5 ? Colors.green: Colors.orange,
            icon: Icon( rating > 3.5 ?  FontAwesomeIcons.check: Icons.sentiment_satisfied),
            label: Text(' Your current rating is $rating!'),
            onPressed: () {
              // _updateUserReport(quiz);
              // Navigator.pushNamedAndRemoveUntil(
              //   context,
              //   '/topics',
              //   (route) => false,
              // );
            },
          )
        ],
      ),
    );
  }

  /// Database write to update report doc when complete
  Future<void> _updateUserReport(Test quiz) {
    return Global.reportRef.upsert(
      ({
        'total': FieldValue.increment(1),
        'subjects.${quiz.id}': {"hasCompleted": true}
      }),
    );
  }
}

class QuestionPage extends StatelessWidget {
  final Question question;
  QuestionPage({this.question});

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Text(question.text),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: question.options.map((opt) {
              return Container(
                height: 90,
                margin: EdgeInsets.only(bottom: 10),
                color: Colors.black26,
                child: InkWell(
                  onTap: () {
                    state.selected = opt;
                    if (opt.correct) {}
                    state.nextPage();
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                            state.selected == opt
                                ? FontAwesomeIcons.checkCircle
                                : FontAwesomeIcons.circle,
                            size: 30),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 16),
                            child: Text(
                              opt.value,
                              style: Theme.of(context).textTheme.body2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
