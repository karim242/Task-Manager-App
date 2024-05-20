import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_mange/features/auth/presentation/model/user_model.dart';
import 'package:task_mange/features/auth/presentation/view_model/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

 int userId = 0;
  Future<dynamic>loadUserProfile( String username, String password ) async {
    emit(ProfileLoading());
    try {
      // Simulate a network call
      await Future.delayed(const Duration(seconds: 2));
       Response response = await   Dio().post('https://dummyjson.com/auth/login', 
       options: Options(
        headers: { 'Content-Type': 'application/json' }),
         data: jsonEncode({
      "username": username,
    "password": password,     
       }));
      print( response.data);
    Map<String, dynamic> usersData = response.data;
          
      emit(ProfileLoaded(User.fromJson(usersData)));
    } on DioException catch (e) {
    
      emit( ProfileError("'Error: ${e.response?.statusCode} ${e.response?.statusMessage}'"));
    }
  }
}