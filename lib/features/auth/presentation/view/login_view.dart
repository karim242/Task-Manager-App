import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mange/features/auth/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:task_mange/features/home/presentation/view_model/get_task/tasks_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  
  final _formKey = GlobalKey<FormState>();
   String? email;
  String? password ;
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
var taskCubit = BlocProvider.of<TaskCubit>(context);
    var profileCubit = BlocProvider.of<ProfileCubit>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
            if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              await profileCubit.loadUserProfile(email!, password!);
              await taskCubit.loadTasks();
              await Navigator.pushNamed(context, '/home');
  }
                },
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text('Don\'t have an account? Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }


}