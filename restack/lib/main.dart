import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:restack/global.dart';
import 'package:restack/product_list.dart';
import 'package:restack/service/product_service.dart';
import 'package:restack/signin.dart';
import 'package:restack/signup.dart';
import 'package:localstorage/localstorage.dart';

//All routes of the project
void setUpLocator() {
  GetIt.instance.registerLazySingleton(() => ProductService());
}

void main() {
  runApp(MyApp());
  setUpLocator();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Restack",
        home: LandingPage(),
      
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.fromLTRB(20, 100, 0, 0),
                child: Text(
                  "Restack",
                  style: TextStyle(
                    color: darkgreen,
                    fontFamily: 'Montserrat',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 300,
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
                        MaterialPageRoute(builder: (context) => SignIn()),
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
              SizedBox(
                height: 10,
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
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
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
            ],
          ),
        ),
      ),
    );
  }
}
