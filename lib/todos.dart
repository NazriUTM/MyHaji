import 'package:flutter/material.dart';
import 'package:myhaji/add_todos.dart';

import 'package:myhaji/home.dart';

import 'package:myhaji/models/todo.dart';
import 'package:myhaji/models/users.dart';
import 'package:myhaji/services/data_services.dart';
import 'package:percent_indicator/percent_indicator.dart';

//import 'models/todo.dart';

//test userID

class TodosPage extends StatefulWidget {
  final User _user;
  TodosPage(this._user);

  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  List<Todo> _todos;

  double getPercentage() {
    int total = _todos.length;
    int completed = 0;
    _todos.forEach((todoEach) {
      if (todoEach.completed) {
        completed++;
      }
    });

    return total > 0 ? completed / total : 0;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
        future: dataService.getTodoList(widget._user.todosID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _todos = snapshot.data;
            print(widget._user.todosID);
            return _builttodoEachScreen();
          } else {
            return _buildFetchingDataScreen();
          }
        });
  }

  Scaffold _builttodoEachScreen() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 120, 20, 1),
        title: Text("Todos Page"),
        centerTitle: true,
      ),
      body: _todos.length > 0 ? _buildListViewContent() : _buildEmptyContent(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromRGBO(0, 120, 20, 1),
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (BuildContext context) => new AddTodoPage(),
            ),
          );
        },
        label: Text('Add Todo'),
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
              itemCount: _todos.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.blueGrey,
              ),
              itemBuilder: (context, index) => ListTile(
                title: Text(_todos[index].title),
                trailing: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    _todos[index].completed == false
                        ? Text("Not Done")
                        : Text("Done"),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Icon(
                          _todos[index].completed == false
                              ? Icons.report
                              : Icons.check_circle,
                          color: _todos[index].completed == false
                              ? Colors.red
                              : Colors.green,
                          size: 30),
                    ),
                  ],
                ),
                onTap: () async {
                  _todos[index].completed = !_todos[index].completed;
                  final updatedTodo =
                      await dataService.updateTodo(_todos[index]);
                  setState(() {
                    _todos[index] = updatedTodo;
                  });
                },
                onLongPress: () async {
                  if (_todos[index].completed == false || true) {
                    await dataService.deleteTodo(
                        _todos[index].id, widget._user);
                    setState(() {
                      _todos.removeAt(index);
                    });

                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the user has entered by using the
                          // TextEditingController.
                          content: Text('1 Todo deleted'),
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
                          content: Text('Cannot delete approved todoEachs'),
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
