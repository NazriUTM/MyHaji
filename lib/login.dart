import 'package:flutter/material.dart';
import 'package:myhaji/models/users.dart';
import 'package:myhaji/services/auth.dart';
import 'package:myhaji/services/data_services.dart';
import 'Animation/FadeAnimation.dart';
import 'home.dart';

String email;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.green[900],
            Colors.green[800],
            Colors.green[400],
          ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80),
            FadeAnimation(
              1.8,
              Padding(
                padding: EdgeInsets.all(0.5),
                child: Image.asset(
                  'assets/hajiIcon.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Welcome Back",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                // child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30),
                      FadeAnimation(
                        1.4,
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 255, 50, 0.3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200])),
                                ),
                                child: TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200])),
                                ),
                                child: TextField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      FadeAnimation(
                          1.5,
                          Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.grey),
                          )),
                      SizedBox(height: 20),
                      FadeAnimation(
                          1.6,
                          Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.green[900]),
                            child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              onPressed: () async {
                                try {
                                  //Self Auth
                                  // print("Success:");
                                  // print("Email is: " + emailController.text);
                                  // print("Password is: " +
                                  //     passwordController.text);
                                  // Future<User> getUser = dataService.getAllUser(
                                  //     emailController.text,
                                  //     passwordController.text);

                                  // print(getUser);

                                  // if (getUser != null) {
                                  //   Navigator.of(context).pop();
                                  //   Navigator.push(
                                  //       context,
                                  //       new MaterialPageRoute(
                                  //           builder: (BuildContext context) =>
                                  //               new HomePage()));
                                  // } else {
                                  //   Navigator.of(context).pop();
                                  //   Navigator.push(
                                  //       context,
                                  //       new MaterialPageRoute(
                                  //           builder: (BuildContext context) =>
                                  //               new Login()));
                                  // }
                                  email = emailController.text;
                                  //Firebase Auth
                                  dynamic result =
                                      await _auth.signInEmailPassword(
                                          email: emailController.text,
                                          password: passwordController.text);
                                } catch (e) {
                                  print("Error");
                                  print("Email is: $emailController");
                                  print("Password is: $passwordController");
                                }

                                // Navigator.of(context).pop();
                                // Navigator.push(
                                //     context,
                                //     new MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //             new HomePage()));
                              },
                              child: Text("Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          )),
                    ],
                  ),
                ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
