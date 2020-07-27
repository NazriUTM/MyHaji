import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 120, 20, 1),
        title: Text("Setting"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Card(
            elevation: 4.0,
            margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 8.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                  ),
                  title: Text('Change Password'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                Divider(color: Colors.black38),
                ListTile(
                  leading: Icon(
                    Icons.language,
                    color: Colors.black,
                  ),
                  title: Text('Change Language'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            "Notifications Settings",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          SwitchListTile(
            activeColor: Colors.green[300],
            contentPadding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            value: true,
            title: Text("Receive Notification"),
            onChanged: (val) {},
          ),
          SwitchListTile(
            activeColor: Colors.green[300],
            contentPadding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            value: true,
            title: Text("Receive App Updates"),
            onChanged: (val) {},
          ),
          SwitchListTile(
            activeColor: Colors.green[300],
            contentPadding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            value: true,
            title: Text("Data Saving Mode"),
            onChanged: (val) {},
          ),
          SwitchListTile(
            activeColor: Colors.green[300],
            contentPadding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            value: false,
            title: Text("Haji Mode"),
            onChanged: (val) {},
          ),
        ]),
      ),
    );
  }
}
