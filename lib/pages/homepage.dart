import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/data/tododata.dart';
import 'package:todoapp/utils/messagebox.dart';
import 'package:todoapp/utils/mytile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box('mybox');

  toDodatabase db = toDodatabase();

  @override
  void initState() {
    if (_mybox.get('Todolist') == null) {
      db.createinitialdata();
    } else {
      db.loadData();
    }

    // TODO: implement initState
    super.initState();
  }

  final _controller = TextEditingController();
  // List todoList = [
  //   ["Buy Groceries", false],

  // ];

  // checkbox is pressed

  void checkboxpressed(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.todolist.add([_controller.text, false]);
      Navigator.pop(context);
      _controller.clear();
    });
    db.updateDataBase();
  }

  void removetask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return MyAlertBox(
                  controller: _controller,
                  onsave: saveNewTask,
                  oncancel: () {
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.deepPurple[300],
        appBar: AppBar(
          title: const Text(
            "TO-DO",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 28,
                color: Colors.white70),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: db.todolist.length,
          itemBuilder: (context, index) {
            return MyTile(
              onChanged: (value) => checkboxpressed(value, index),
              taskcomleted: db.todolist[index][1],
              text: db.todolist[index][0],
              onPressed: (value) => removetask(index),
            );
          },
        ));
  }
}
