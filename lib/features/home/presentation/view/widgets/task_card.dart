

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mange/features/home/presentation/model/task_model.dart';
import 'package:task_mange/features/home/presentation/view_model/get_task/tasks_cubit.dart';

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
    return  Dismissible(
          key: Key(widget.task.id.toString()),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            context.read<TaskCubit>().deleteTask(widget.task.id);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${widget.task.todo} deleted')),
            );
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
    
  child: Card(
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
  ),
    );
  }
}