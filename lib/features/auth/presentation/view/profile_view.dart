import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mange/features/auth/presentation/view/widgets/profile_body.dart';
import 'package:task_mange/features/auth/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:task_mange/features/auth/presentation/view_model/profile_cubit/profile_state.dart';

class ProfileView extends StatelessWidget {

  const ProfileView({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings
            },
          ),
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              return ProfileBody(user: state.userProfile);
            } else if (state is ProfileError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
    
   
    );
  }
}
