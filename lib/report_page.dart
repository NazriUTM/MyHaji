import 'package:flutter/material.dart';
import 'package:myhaji/add_report.dart';
import 'package:myhaji/home.dart';
import 'package:myhaji/models/report.dart';
import 'package:myhaji/models/users.dart';
import 'package:myhaji/services/data_services.dart';
import 'package:percent_indicator/percent_indicator.dart';

//import 'models/todo.dart';

//test userID

class ReportPage extends StatefulWidget {
  final User _user;
  ReportPage(this._user);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  List<Report> _reports;

  double getPercentage() {
    int total = _reports.length;
    int completed = 0;
    _reports.forEach((report) {
      if (report.status == 'Completed') {
        completed++;
      }
    });

    return total > 0 ? completed / total : 0;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Report>>(
        future: dataService.getUserReportList(widget._user.reportID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _reports = snapshot.data;
            return _builtReportScreen();
          } else {
            return _buildFetchingDataScreen();
          }
        });
  }

  Scaffold _builtReportScreen() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 120, 20, 1),
        title: Text("Report Page"),
        centerTitle: true,
      ),
      body:
          _reports.length > 0 ? _buildListViewContent() : _buildEmptyContent(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromRGBO(0, 120, 20, 1),
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (BuildContext context) => new AddReportPage(),
            ),
          );
        },
        label: Text('New Report'),
        icon: Icon(Icons.add),
      ),
    );
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching todo... Please wait'),
          ],
        ),
      ),
    );
  }

  Widget _buildListViewContent() {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.grey[300],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 150,
                child: CircularPercentIndicator(
                  radius: 120.0,
                  lineWidth: 10.0,
                  animation: true,
                  animationDuration: 1200,
                  percent: getPercentage(),
                  center: new Text(
                      "${(getPercentage() * 100).toStringAsFixed(2)}%"),
                  progressColor: Colors.green,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Card(
            child: ListView.separated(
              itemCount: _reports.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.blueGrey,
              ),
              itemBuilder: (context, index) => ListTile(
                title: Text(_reports[index].title),
                subtitle: Text(_reports[index].desc),
                trailing: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Text(
                      _reports[index].status,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Icon(
                          _reports[index].status == 'Pending'
                              ? Icons.report_problem
                              : Icons.check_circle,
                          color: _reports[index].status == 'Pending'
                              ? Colors.red
                              : Colors.green,
                          size: 30),
                    ),
                  ],
                ),
                onTap: () => {},
                onLongPress: () async {
                  if (_reports[index].status == 'Pending') {
                    await dataService.deleteReport(
                        _reports[index].id, widget._user);
                    setState(() {
                      _reports.removeAt(index);
                    });

                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the user has entered by using the
                          // TextEditingController.
                          content: Text('1 report deleted'),
                        );
                      },
                    );
                  } else {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the user has entered by using the
                          // TextEditingController.
                          content: Text('Cannot delete approved reports'),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyContent() {
    return Center(
      child: Text(
        'Wow... such empty',
        style: TextStyle(
            color: Colors.green, fontWeight: FontWeight.bold, fontSize: 32),
      ),
    );
  }
}
