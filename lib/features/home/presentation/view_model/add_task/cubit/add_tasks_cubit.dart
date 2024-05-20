import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:task_mange/features/home/presentation/model/task_model.dart';
import 'package:task_mange/features/home/presentation/view_model/add_task/cubit/add_tasks_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

      
    Future<Task>addTask({required String todo , required int userId}) async {
         
   emit(AddTaskLoading());
    try {
    Response response = await Dio().post('https://dummyjson.com/todos/add',
          options: Options(
              headers: { 'Content-Type': 'application/json' }),
         data: jsonEncode({
    "todo": todo,
    "completed": false,
    "userId": userId, 
           }));
           emit(AddTaskSuccess());
        print(response.data);
        var tasks = Task.fromJson(response.data);
        
      return tasks;



    } on DioException catch (e) {
      print('Error: ${e.response?.statusCode} ${e.response?.statusMessage}');
  
      emit(const AddTaskError('Failed to add task'));

      rethrow;
    }
  }
}