// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sort_child_properties_last, curly_braces_in_flow_control_structures, unused_local_variable

import 'package:flutter/material.dart';
import 'package:todo_app/widgets/counter.dart';
import 'package:todo_app/widgets/todo-card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class Task {
  String title;
  bool status;
  Task({required this.title, required this.status});
}

class _TodoAppState extends State<TodoApp> {
  List AllTasks = [
    Task(title: "go to the work", status: false),
    Task(title: "make food", status: true),
    Task(title: "go to Gem", status: true),
    Task(title: "go to company", status: true),
  ];
  deleteFunctions(int ClickedTask) {
    setState(() {
      AllTasks.remove(AllTasks[ClickedTask]);
    });
  }

  deleteAll() {
    setState(() {
      AllTasks.clear();
    });
  }

  changeStatus(int taskindex) {
    setState(() {
      AllTasks[taskindex].status = !AllTasks[taskindex].status;
    });
  }

  final myController = TextEditingController();
  addNewTask() {
    // to ensure that i can not add a new task just when the textfield is full
    if (myController.text.isNotEmpty)
      setState(() {
        AllTasks.add(Task(title: myController.text, status: false));
      });
    myController.clear(); //i write it to clear the text inside the TextField
  }

  int clalcCompletedTask() {
    int compTasks = 0;
    AllTasks.forEach((item) {
      if (item.status == true) {
        compTasks++;
      }
    });
    return compTasks;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Container(
                    padding: EdgeInsets.all(22),
                    // color: Color.fromARGB(255, 198, 176, 110),
                    // height: double.infinity, i use it when used showmodalbuttonsheet
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: myController,
                          decoration:
                              InputDecoration(hintText: "Add new Task "),
                          maxLength: 20,
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        TextButton(
                            onPressed: () {
                              addNewTask();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "ADD",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                );
              },
              // isScrollControlled: true =>i use it when i use showModalButtonSheet
              // i just replace the showModalButtonSheet to showDialog and its properties.
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          shape: CircleBorder(side: BorderSide(color: Colors.white, width: 1)),
        ),
        backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                deleteAll();
              },
              icon: Icon(Icons.delete_forever),
              iconSize: 40,
              color: Color.fromARGB(255, 255, 115, 105),
            )
          ],
          elevation: 0,
          backgroundColor: Color.fromRGBO(58, 66, 86, 1),
          title: Text(
            "To Do App",
            style: TextStyle(
                fontSize: 33, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Counter(
                  allCompleted: clalcCompletedTask(),
                  allTodo: AllTasks.length,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 675,
                  color: Color.fromARGB(255, 55, 63, 82),
                  child: ListView.builder(
                      itemCount: AllTasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Todocard(
                          vartitle: AllTasks[index].title,
                          statusOfTask: AllTasks[index].status,
                          funChangeStatus: changeStatus,
                          index: index,
                          deleteFunctions: deleteFunctions,
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
