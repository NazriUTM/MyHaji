import 'package:flutter/material.dart';
import 'package:myhaji/home.dart';
import 'package:myhaji/models/report.dart';
import 'package:myhaji/models/todo.dart';
import 'package:myhaji/models/users.dart';
import 'package:myhaji/report_page.dart';
import 'package:myhaji/services/data_services.dart';
import 'package:myhaji/todos.dart';

class AddTodoPage extends StatefulWidget {
  final List data;

  AddTodoPage({Key key, this.data}) : super(key: key);

  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    super.dispose();

    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 120, 20, 1),
        title: Text("Add Todo"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(
                    0.6, 0), // 10% of the width, so there are ten blinds.
                colors: [
                  const Color(0xFFFFFFEE),
                  const Color(0xFF999999)
                ], // whitish to gray
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
          ),
          Center(
            child: Container(
              height: 350,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 5,
                child: Container(
                  //color: Colors.amber,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Title:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.fromLTRB(12, 2, 5, 2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(25)),
                        height: 60,
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: titleController,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'What to add?'),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(height: 10),
                      // Container(
                      //   alignment: Alignment.centerLeft,
                      //   padding: EdgeInsets.fromLTRB(12, 2, 5, 2),
                      //   height: 60,
                      //   decoration: BoxDecoration(
                      //       border: Border.all(),
                      //       borderRadius: BorderRadius.circular(25)),
                      //   child: TextField(
                      //     textAlign: TextAlign.center,
                      //     controller: descController,
                      //     keyboardType: TextInputType.multiline,
                      //     style: TextStyle(
                      //       color: Colors.black,
                      //     ),
                      //     decoration: InputDecoration(
                      //         border: InputBorder.none,
                      //         hintText: 'Description of report'),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromRGBO(0, 120, 20, 1),
        onPressed: () async {
          Todo newTodo = Todo(title: titleController.text);

          User updatedUser = await dataService.createTodo(newTodo, user);
          Navigator.pop(context);
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new TodosPage(updatedUser)));
        },
        label: Text('Add Todo'),
        icon: Icon(Icons.send),
      ),
    );
  }
}
