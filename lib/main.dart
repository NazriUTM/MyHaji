import 'package:flutter/material.dart';
import 'package:myhaji/models/users.dart';
import 'package:myhaji/services/auth.dart';
import 'package:myhaji/wrapper.dart';
import 'package:provider/provider.dart';
import 'Animation/FadeAnimation.dart';
import 'package:myhaji/home.dart';

// void main() => runApp(MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Login(),
//     ));

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          home: Wrapper(),
        ));
  }
}
