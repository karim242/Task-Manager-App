
import 'package:flutter/material.dart';
import 'package:task_mange/features/home/presentation/model/task_model.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        title: Text(
          widget.task.todo,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            decoration: widget.task.completed ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Icon(
          widget.task.completed ? Icons.check_circle : Icons.radio_button_unchecked,
          color: widget.task.completed ? Colors.green : Colors.grey,
        ),
        onTap: () {
          setState(() {
            widget.task.completed = !widget.task.completed;
          });
          // Task tap logic
        },
      ),
    );
  }
}