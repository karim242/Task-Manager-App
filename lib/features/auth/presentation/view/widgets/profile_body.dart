
import 'package:flutter/material.dart';
import 'package:task_mange/features/auth/presentation/model/user_model.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.image),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                '${user.firstName} ${user.lastName}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                user.email,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            const Text('User Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Username: ${user.username}'),
              ),
            ),
            Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Gender: ${user.gender}'),
              ),
            ),
            Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: const Icon(Icons.email),
                title: Text('Email: ${user.email}'),
              ),
            ),
           
          
          ],
        ),
      );
  }
}
