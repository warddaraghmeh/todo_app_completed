// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

class Todocard extends StatelessWidget {
  final String vartitle;
  final bool statusOfTask;
  final Function funChangeStatus;
  final int index;
  final Function deleteFunctions;

  const Todocard({
    super.key,
    required this.vartitle,
    required this.statusOfTask,
    required this.funChangeStatus,
    required this.deleteFunctions,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        funChangeStatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.all(19),
          decoration: BoxDecoration(
            color: Color.fromRGBO(209, 224, 224, 0.2),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(
                  color: statusOfTask ? Color.fromARGB(255, 149, 222, 149) : Colors.white,
                  fontSize: 22,
                  fontWeight: statusOfTask ? FontWeight.bold : FontWeight.normal,
                  decorationThickness: statusOfTask ? 2.85 : 1.0,
                  decoration: statusOfTask ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
              Row(
                children: [
                  Icon(
                    statusOfTask ? Icons.check_circle_outline : Icons.radio_button_unchecked,
                    size: 27,
                    color: statusOfTask ? Colors.green : Colors.red,
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  IconButton(
                    onPressed: () {
                      deleteFunctions(index);
                    },
                    icon: Icon(Icons.delete_forever),
                    color: Color.fromARGB(255, 236, 102, 92),
                    iconSize: 28,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
