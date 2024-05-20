import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mange/features/home/presentation/view_model/add_task/cubit/add_tasks_cubit.dart';
import 'package:task_mange/features/home/presentation/view_model/add_task/cubit/add_tasks_state.dart';

// ignore: must_be_immutable
class AddTaskView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _taskController = TextEditingController();
  bool _completed = false;

  AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Task'),
        ),
        body: BlocListener<AddTaskCubit, AddTaskState>(
          listener: (context, state) {
            if (state is AddTaskSuccess) {
              
            } else if (state is AddTaskError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      labelText: 'Task Description',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a task description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: _completed,
                        onChanged: (bool? value) {
                          _completed = value ?? false;
                        },
                      ),
                      const Text('Completed'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          BlocProvider.of<AddTaskCubit>(context).addTask(todo: _taskController.text,  userId: 1 );
                          ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Task Added Successfully')),
              );
              Navigator.pop(context, );
                 }
                      },
                      child: const Text('Add Task'),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}