import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mange/features/home/presentation/view/widgets/app_drawer.dart';
import 'package:task_mange/features/home/presentation/view/widgets/task_list.dart';
import 'package:task_mange/features/home/presentation/view_model/get_task/tasks_cubit.dart';
import 'package:task_mange/features/home/presentation/view_model/get_task/tasks_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
return BlocProvider(
      create: (context) => TaskCubit()..loadTasks(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task Manager'),
           actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
        ),
        body: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            if (state is TaskLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TaskLoaded) {
              return TaskList(tasks: state.tasks);
            } else if (state is TaskError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
         drawer:const AppDrawer() ,
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            Navigator.pushNamed(context, '/addtask');
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

