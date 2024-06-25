// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int allTodo;
  final int allCompleted;
  const Counter({Key? key, required this.allCompleted, required this.allTodo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 27),
      child: Text( 
        "$allCompleted/$allTodo",
        style: TextStyle(
            fontSize: 50,
            color: allCompleted == allTodo
                ? const Color.fromARGB(255, 97, 223, 101)
                : Color.fromARGB(255, 240, 90, 79),
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
