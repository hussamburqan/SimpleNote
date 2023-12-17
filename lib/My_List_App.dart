import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyListApp extends StatelessWidget {
  final String task;
  final bool taskComplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  MyListApp({super.key,
    required this.task,
    required this.taskComplete,
    required this.onChanged,
    required this.deleteTask
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete_forever,
              backgroundColor: Color(0xC0F56262),

            ),
          ],
        ),
        child: Container(
          height: 110,
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Color(0xBF706E6E),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),topLeft: Radius.circular(25)),
          ),
          child: Row(
            children: [

              Checkbox(
                value: taskComplete,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              Text(task,
              style: TextStyle(fontWeight: FontWeight.bold,decoration: taskComplete? TextDecoration.lineThrough : TextDecoration.none,fontSize: 20),),
            ],
          ),
        ),
      ),
    );
  }
}

