
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mange/features/home/presentation/model/task_model.dart';
import 'package:task_mange/features/home/presentation/view_model/get_task/tasks_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

Future<List<Task>> loadTasks() async {
  emit(TaskLoading());
  try {
    // Simulate a network call
     Response response = await Dio().get('https://dummyjson.com/todos');
        print(response.data["todos"]);
      List<Task> tasks= List<Task>.from(
        (response.data["todos"] as List).map(
          (e) => Task.fromJson(e as Map<String, dynamic>),
        ),
      );
 emit(TaskLoaded(tasks));
return []; 
  } catch (e) {
    emit(const TaskError('Failed to load tasks'));
    return [];
  }
}



}