import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int id;
  final String todo;
   bool completed;

   Task({
    required this.id,
    required this.todo,
     this.completed= false,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
    );
  }

 

  @override
  List<Object?> get props => [id, todo, completed];
}
