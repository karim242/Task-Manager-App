
import 'package:flutter/material.dart';
import 'package:task_mange/features/home/presentation/model/task_model.dart';
import 'package:task_mange/features/home/presentation/view/widgets/task_card.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.tasks});
final List<Task> tasks;
  @override
  Widget build(BuildContext context) {
   
         return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskCard(task: task);
      },
    );
  }
}
