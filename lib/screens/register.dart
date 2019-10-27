import 'package:flip_flop/services/services.dart';
import 'package:flip_flop/shared/shared.dart';
import 'package:flip_flop/shared/shared.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'screens.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthService auth = AuthService();
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();
  TextEditingController _email;
  TextEditingController _name;
  TextEditingController _school;
  TextEditingController _password;

  @override
  void initState() {
    _email = new TextEditingController();
    _password = new TextEditingController();
    _name = new TextEditingController();
    _school = new TextEditingController();

    super.initState();
    // auth.getUser.then(
    //   (user) {
    //     if (user != null) {
    //       Navigator.pushReplacementNamed(context, '/topics');
    //     }
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _registerKey,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 SvgPicture.asset(
                    'assets/logo.svg',
                    height: 60,
                    width: 100,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      controller: _name,
                       style: TextStyle(color: prefix0.text),
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ), // icon is 48px widget.
                        ), // icon is 48px widget.
                        hintText: 'Name',
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        controller: _school,
                         style: TextStyle(color: prefix0.text),
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ), // icon is 48px widget.
                          ), // icon is 48px widget.
                          hintText: 'School',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autofocus: false,
                        controller: _email,
                         style: TextStyle(color: prefix0.text),
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ), // icon is 48px widget.
                          ), // icon is 48px widget.
                          hintText: 'Email Address',
                          
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        )),
                  ),
                  Container(
                       padding: EdgeInsets.only(top: 8, bottom: 24),
                      child: TextFormField(
                        autofocus: false,
                        obscureText: true,
                        controller: _password,
                         style: TextStyle(color: prefix0.text),
                        // validator: Validator.validatePassword,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ), // icon is 48px widget.
                          ), // icon is 48px widget.
                          hintText: 'Password',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: CustomFlatButton(
                        text: 'REGISTER',
                        color: prefix0.primary,
                        onPressed: () async {
                          if (_registerKey.currentState.validate()) {
                            var user = await auth.signUp(_email.text, _password.text,
                                _name.text, _school.text);
                            if (user != null) {
                              Navigator.pushReplacementNamed(
                                  context, '/subjects');
                            }
                          }
                        }),
                  ),
                  CustomFlatButton(
                      text: 'LOGIN',
                      color: prefix0.white,
                      onPressed: () => routeReplace(context, LoginScreen()))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
