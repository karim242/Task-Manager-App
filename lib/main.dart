import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mange/features/auth/presentation/view/login_view.dart';
import 'package:task_mange/features/auth/presentation/view/profile_view.dart';
import 'package:task_mange/features/auth/presentation/view/signup_view.dart';
import 'package:task_mange/features/auth/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:task_mange/features/home/presentation/view/add_task_view.dart';
import 'package:task_mange/features/home/presentation/view/home_view.dart';
import 'package:task_mange/features/home/presentation/view_model/add_task/cubit/add_tasks_cubit.dart';
import 'package:task_mange/features/home/presentation/view_model/get_task/tasks_cubit.dart';
import 'package:task_mange/features/splash/persentation/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProfileCubit(),),
        BlocProvider(create: (_) => TaskCubit(),),
                BlocProvider(create: (_) => AddTaskCubit(),)


      
      ],
      child: MaterialApp(
          title: 'Task Manager',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
           routes: {
             '/login': (context) => const LoginView(),
             '/signup': (context) => const SignupView(),
             '/home': (context) => const HomeView(),
             '/addtask': (context) =>  AddTaskView(),
            //  '/addTask': (context) => AddTaskScreen(),
          //   '/addEditTask': (context) => AddEditTaskScreen(),
          //   '/taskDetails': (context) => TaskDetailsScreen(),
            '/profile': (context) =>  const ProfileView(), 
           
          
           }
      ),
    );
  }
}