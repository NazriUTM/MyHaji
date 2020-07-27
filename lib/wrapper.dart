import 'package:flutter/material.dart';
import 'package:myhaji/home.dart';
import 'package:myhaji/login.dart';
import 'package:myhaji/models/users.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Login();
    } else {
      return HomePage();
    }
  }
}
