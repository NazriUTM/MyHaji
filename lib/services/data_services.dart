import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myhaji/models/report.dart';
import 'package:myhaji/models/users.dart';
import 'package:myhaji/services/rest_service.dart';

import '../models/todo.dart';

class DataService {
  Future<List<Todo>> getTodoList(List userTodo) async {
    //Get all todos
    var listunFiltered = await restService.get('todos');

    List todosUnlist = List();

    todosUnlist =
        (listunFiltered as List).map((item) => Todo.fromJson(item)).toList();

    List<Todo> todosList = List<Todo>();

    if (todosUnlist == null) return todosList;

    //filter todo
    todosUnlist.forEach((todos) {
      userTodo.forEach((id) {
        if (todos.id == id) {
          todosList.add(todos);
        }
      });
    });

    return todosList;
    //filter report
  }

  Future updateTodo(Todo todo) async {
    final updatedTodo = await restService
        .patch('todos/' + todo.id, data: {"completed": todo.completed});
    //user.todosID.remove(id);
    //User updatedUser = await updateUser(user);
    return Todo.fromJson(updatedTodo);
  }

  Future deleteTodo(String id, User user) async {
    await restService.delete('todos/$id');
    user.todosID.remove(id);
    User updatedUser = await updateUser(user);
  }

  Future<User> getUser(String id) async {
    final json = await restService.get('users/$id');

    return User.fromJson(json);
  }

  Future<User> getAllUser(String email) async {
    final listJson = await restService.get('users');

    List<User> allUser = List<User>();
    allUser = (listJson as List).map((item) => User.fromJson(item)).toList();

    if (allUser.isEmpty) {
      return null;
    } else {
      for (int i = 0; i < allUser.length; i++) {
        if (allUser[i].email == email) {
          print(allUser[i].name);
          return allUser[i];
        }
      }
    }

    return null;
  }

  Future<User> updateUser(User user) async {
    final json = await restService.patch('users/${user.id}', data: {
      'id': user.id,
      'email': user.email,
      'name': user.name,
      'phone': user.phone,
      'group': user.group,
      'hajID': user.hajID,
      'mutaName': user.mutaName,
      'mutaPhone': user.mutaPhone,
      'reportID': user.reportID,
      'todosID': user.todosID
    });

    return User.fromJson(json);
  }

  Future<List<Report>> getUserReportList(List userReport) async {
    final listJson = await restService.get('reports');

    //filter report

    //Get all reports
    List reports = List();
    reports = (listJson as List).map((item) => Report.fromJson(item)).toList();
    List<Report> userReportList = List<Report>();

    if (reports == null) return userReportList;

    reports.forEach((report) {
      userReport.forEach((id) {
        if (report.id == id) {
          userReportList.add(report);
        }
      });
    });

    return userReportList;
  }

  Future<User> createReport(Report report, User user) async {
    final json = await restService.post('reports', data: report);
    Report createdReport = Report.fromJson(json);

    user.reportID.add(createdReport.id);
    User updatedUser = await updateUser(user);

    return updatedUser;
  }

  Future<User> createTodo(Todo todo, User user) async {
    final json = await restService.post('todos', data: todo);
    Todo createdTodo = Todo.fromJson(json);

    user.todosID.add(createdTodo.id);
    User updatedUser = await updateUser(user);

    return updatedUser;
  }

  Future deleteReport(String id, User user) async {
    await restService.delete('reports/$id');
    user.reportID.remove(id);
    User updatedUser = await updateUser(user);
  }
}

final dataService = DataService();
