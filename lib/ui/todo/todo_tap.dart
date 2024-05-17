import 'package:flutter/material.dart';
import 'package:farmist/ui/bottom_sheets/add_bottom_sheet.dart';
import 'package:farmist/ui/todo/list/list_todo_tap.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Color.fromRGBO(32, 220, 45, 100),
        title: Center(
            child: Text(
          "المهام",
          style: TextStyle(fontSize: 30),
        )),
      ),
      body: ListTodo(),
      floatingActionButton: buildFab(),

    );
  }

  Widget buildFab() {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (_) => Container(
                padding: MediaQuery.of(context).viewInsets,
                child: AddBottomSheet()));
      },
      child: Icon(Icons.add),
    );
  }
}
