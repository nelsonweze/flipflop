import 'package:flip_flop/shared/shared.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../shared/shared.dart';
import '../services/services.dart';
import 'screens.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  AuthService auth = AuthService();
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _loginKey,
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top:30, left: 30, right: 30),
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/logo.svg',
                    height: 60,
                    width: 100,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
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
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 16),
                    child: TextFormField(
                      autofocus: false,
                       style: TextStyle(color: prefix0.text),
                      obscureText: true,
                      controller: _password,
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
                    ),
                  ),
                   Container(
                      padding: EdgeInsets.only(top: 20),
                      child: CustomFlatButton(
                        text: 'LOGIN',
                        // icon: FontAwesomeIcons.google,
                        color: prefix0.primary,
                        onPressed: () => _login(),
                      )),
                  CustomFlatButton(
                      text: 'REGISTER',
                      color: prefix0.white,
                      onPressed: () => routeReplace(context, Register()))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    if (_loginKey.currentState.validate()) {
      await auth.signIn(_email.text, _password.text);
      routeReplace(context, Home());
    }
  }
}
