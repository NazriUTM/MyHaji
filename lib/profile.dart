import 'package:flutter/material.dart';
import 'package:myhaji/login.dart';
import 'package:myhaji/models/mock_data.dart';
import 'package:myhaji/models/person.dart';
import 'package:myhaji/models/users.dart';
import 'package:myhaji/profile.dart';
import 'package:myhaji/services/data_services.dart';
import 'package:myhaji/setting.dart';
import 'package:myhaji/main.dart';
import 'package:myhaji/home.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  final User _user;

  ProfilePage(this._user);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isEnabledMail = false;
  bool _isEnabledPhone = false;

  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 120, 20, 1),
        title: Text("Profile Page"),
        centerTitle: true,
      ),
      body: new Stack(
        children: <Widget>[
          ClipPath(
            child: Container(color: Colors.teal[200].withOpacity(0.8)),
            clipper: getClipper(),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.vertical, child: _buildProfile()),
        ],
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.edit),
      ),*/
    );
  }

  Widget _buildProfile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  image: new AssetImage('assets/avatar.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(75.0)),
                boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.black)]),
          ),
        ),
        Card(
          margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: Center(
                        child: Text(
                      widget._user.group,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                        color: Colors.green[400]),
                    height: 60,
                    width: MediaQuery.of(context).size.width / 2 - 20,
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                          child: Text(
                        widget._user.hajID,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          color: Colors.lightGreen[400]),
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2 - 20,
                    ),
                  ),
                ],
              ),
              ListTile(
                title: new Center(child: Text(widget._user.name)),
                leading: Icon(Icons.account_box),
              ),
              Divider(color: Colors.black38),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Center(
                  child: Text(
                      // controller: emailController,
                      // enabled: _isEnabledMail,
                      // decoration: InputDecoration(
                      //   hintText: user.email,
                      // ),
                      widget._user.email),
                ),
              ),
              Divider(color: Colors.black38),
              ListTile(
                leading: Icon(Icons.contact_phone),
                title: Center(
                  child: TextField(
                    controller: phoneController,
                    enabled: _isEnabledPhone,
                    decoration: InputDecoration(
                      hintText: widget._user.phone,
                    ),
                  ),
                ),
                trailing: GestureDetector(
                  child: new Icon(
                    _isEnabledPhone ? Icons.save : Icons.edit,
                    color: Colors.black,
                  ),
                  onTap: () async {
                    if (_isEnabledPhone == true) {
                      setState(() {
                        widget._user.phone = phoneController.text;
                      });
                    }
                    await dataService.updateUser(widget._user);
                    setState(() {
                      _isEnabledPhone = !_isEnabledPhone;
                    });
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 50,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                        color: Colors.green[400],
                      ),
                      child: Text(
                        'Mutawwif Details',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              //Divider(color: Colors.black38),
              ListTile(
                title: new Center(child: Text(widget._user.mutaName)),
                leading: Icon(Icons.account_box),
              ),
              Divider(color: Colors.black38),
              ListTile(
                title: new Center(child: Text(widget._user.mutaPhone)),
                leading: Icon(Icons.contact_phone),
                trailing: IconButton(
                  icon: Icon(Icons.call, color: Colors.green),
                  onPressed: () => launch("tel:${widget._user.mutaPhone}"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 2.5);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
