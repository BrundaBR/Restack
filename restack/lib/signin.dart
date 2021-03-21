import 'package:flutter/material.dart';
import 'package:restack/global.dart';
import 'package:restack/main.dart';
import 'package:restack/product_list.dart';
import 'package:restack/profile.dart';
import 'package:restack/signup.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        body: Padding(
          padding: EdgeInsets.all(12),
                  child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.fromLTRB(120.0, 50.0, 0, 0),
                child: Text(
                  "Sign In",
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
                    TextField(
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
                        // prefixIcon: Icon(
                        //   Icons.person,
                        //   color: lightgreen,
                        // ),
                        //validate the inputs
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    TextField(
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
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ), //inorder to create between continers
                    Container(
                      alignment: Alignment(1.0, 0),
                      padding: EdgeInsets.only(top: 15, left: 20),
                      child: InkWell(
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                            color: lightgreen,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    
                    SizedBox(
                      height: 20,
                    ),
                   Container(
   
                          height: 60,
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            shadowColor: darkgreen,
                            color: darkgreen,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                 Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=>ProductList()),
                                );

                              },
                              child: Center(
                                child: Text(
                                  "SIGNIN",
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
       
                   

                    Container(
                      padding: EdgeInsets.only(top: 15, left: 10),
                      child: GestureDetector(
                        onTap: () {                           Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>SignUp()),
                          );},
                        child: InkWell(
                          child: Text(
                            "New to Restack?",
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
    );
  }
}
