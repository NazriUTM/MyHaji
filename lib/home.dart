import 'package:flutter/material.dart';
import 'package:myhaji/BouncyPageRoute.dart';
import 'package:myhaji/guide.dart';
import 'package:myhaji/location.dart';
import 'package:myhaji/login.dart';
import 'package:myhaji/models/mock_data.dart';
import 'package:myhaji/models/users.dart';
import 'package:myhaji/profile.dart';
import 'package:myhaji/report_page.dart';
import 'package:myhaji/schedule.dart';
import 'package:myhaji/services/auth.dart';
import 'package:myhaji/services/data_services.dart';
import 'package:myhaji/setting.dart';
import 'package:myhaji/todos.dart';

//global testing
//String userID = "2JPsXErv8lFiJjWrfAFA";

User user;

class HomePage extends StatefulWidget {
  //final User userGet;

  //Homepage(this.userGet);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color.fromRGBO(0, 112, 74, 1);

    return FutureBuilder(
        future: dataService.getAllUser(email),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            user = snapshot.data;
            return Scaffold(
              // appBar: AppBar(
              //   backgroundColor: Color.fromRGBO(0, 112, 74, 1),
              //   title: Text(
              //     "Welcome to MyHaji",
              //     style: TextStyle(fontSize: 24),
              //   ),
              //   centerTitle: true,
              //   elevation: 0.0,
              // ),
              backgroundColor: Color.fromRGBO(244, 244, 244, 1),
              body: SingleChildScrollView(
                child: Stack(children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            border: Border.all(color: primaryColor)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 10,
                              right: 15.0,
                              left: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          ClipPath(
                            clipper: CustomShapeClipper(),
                            child: Container(
                              height: 400.0,
                              decoration: BoxDecoration(color: primaryColor),
                            ),
                          ),
                          _buildProfile(),
                          _buildMenu(),
                        ],
                      ),
                    ],
                  ),
                  _buildTitle(),
                ]),
              ),
              floatingActionButton: FloatingActionButton.extended(
                backgroundColor: Color.fromRGBO(0, 120, 20, 1),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Logout'),
                          content: Text('Do you really want to logout?'),
                          actions: <Widget>[
                            FlatButton(
                                child: Text('No'),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            FlatButton(
                                child: Text('Yes'),
                                onPressed: () async {
                                  await _auth.signOut();
                                  Navigator.pop(context);
                                }),
                          ],
                        );
                      });
                },
                label: Text('Log Out'),
                icon: Icon(Icons.exit_to_app),
              ),
            );
          } else {
            return Container();
          }
        });
  }

  Widget _buildTitle() {
    return Positioned(
      top: MediaQuery.of(context).size.height / 20,
      right: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            'Welcome to',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'MyHaji',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfile() {
    return Positioned(
      top: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.black, //Optional
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/avatar.jpg'),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      user.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Material(
                  elevation: 1.0,
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.white,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new ProfilePage(user)));
                    },
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                    child: Text(
                      'Show Profile',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18.0,
                          color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu() {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 4, right: 25.0, left: 25.0),
      child: Container(
        width: double.infinity,
        height: 370.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0.0, 3.0),
                  blurRadius: 15.0)
            ]),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.purple.withOpacity(0.1),
                        child: IconButton(
                            padding: EdgeInsets.all(15.0),
                            icon: Icon(Icons.book),
                            color: Colors.purple,
                            iconSize: 30.0,
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     new MaterialPageRoute(
                              //         builder: (BuildContext
                              //                 context) =>
                              //             new GuidePage()));

                              Navigator.of(context).push(_guideRoute());

                              // Navigator.push(context,
                              //     BouncyPageRoute(GuidePage()));
                            }),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Guide',
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.blue.withOpacity(0.1),
                        child: IconButton(
                            padding: EdgeInsets.all(15.0),
                            icon: Icon(Icons.calendar_today),
                            color: Colors.blue,
                            iconSize: 30.0,
                            onPressed: () {
                              Navigator.of(context).push(_scheduleRoute());
                            }),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Schedule',
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.orange.withOpacity(0.1),
                        child: IconButton(
                            padding: EdgeInsets.all(15.0),
                            icon: Icon(Icons.location_on),
                            color: Colors.orange,
                            iconSize: 30.0,
                            onPressed: () {
                              Navigator.of(context).push(_locationRoute());
                            }),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Location',
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.pink.withOpacity(0.1),
                        child: IconButton(
                            padding: EdgeInsets.all(15.0),
                            icon: Icon(Icons.collections_bookmark),
                            color: Colors.pink,
                            iconSize: 30.0,
                            onPressed: () {
                              Navigator.of(context).push(_todosRoute());
                            }),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Todos',
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.purpleAccent.withOpacity(0.1),
                        child: IconButton(
                            padding: EdgeInsets.all(15.0),
                            icon: Icon(Icons.report),
                            color: Colors.purpleAccent,
                            iconSize: 30.0,
                            onPressed: () {
                              Navigator.of(context).push(_reportRoute());
                            }),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Report',
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.deepPurple.withOpacity(0.1),
                        child: IconButton(
                            padding: EdgeInsets.all(15.0),
                            icon: Icon(Icons.settings_applications),
                            color: Colors.deepPurple,
                            iconSize: 30.0,
                            onPressed: () {
                              Navigator.of(context).push(_settingRoute());
                            }),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Setting',
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Divider(),
            SizedBox(height: 15.0),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Assalamualaikum',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 40.0),
                    Material(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Colors.blueAccent.withOpacity(0.1),
                      child: IconButton(
                          icon: Icon(Icons.info),
                          color: Colors.blueAccent,
                          onPressed: () {
                            showDialog(
                                context: context,
                                child: new AlertDialog(
                                  title: new Text("Waalaikumussalam"),
                                  content:
                                      new Text("Semoga mendapati Haji Mabrur"),
                                ));
                          }),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 390.0 - 200);
    path.quadraticBezierTo(size.width / 2, 280, size.width, 390.0 - 200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

Route _guideRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => GuidePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _reportRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ReportPage(user),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _scheduleRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SchedulePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _locationRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LocationPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _todosRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => TodosPage(user),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _settingRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SettingPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
