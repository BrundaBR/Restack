import 'package:flutter/material.dart';
import 'package:restack/global.dart';
import 'package:restack/service/product_service.dart';
import 'package:restack/signin.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _username;
  String _password;
  String _email;
  final _form = GlobalKey<FormState>();

  void _registernow() async {
    // var isvalid = _form.currentState.validate();
    // if (!isvalid) {
    //   return;
    // }
    _form.currentState.save();
    print(_username);
    print(_email);
    print(_password);
    // registerNow(_username, _password);
    // bool isRegister = await Provider.of<PostState>(context, listen: false)
    //     .registerNow(_username, _password);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _form,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.fromLTRB(120.0, 50.0, 0, 0),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        color: darkgreen,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 35, left: 20, right: 20),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'EMAIl',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: lightgreen,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: dark),
                            ),
                          ),
                          onSaved: (v) {
                            _email = v;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'USERNAME',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: lightgreen,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: dark),
                            ),
                          ),
                          onSaved: (v) {
                            _username = v;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: lightgreen,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: dark),
                            ),
                          ),
                          onSaved: (v) {
                            _password = v;
                          },
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 40,
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            shadowColor: darkgreen,
                            color: darkgreen,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                _registernow();
                              },
                              child: Center(
                                child: Text(
                                  "SIGNUP",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15, left: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()),
                              );
                            },
                            child: InkWell(
                              child: Text(
                                "Already have an account?",
                                style: TextStyle(
                                  color: lightestshade,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
