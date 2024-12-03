/*
import 'package:flutter/material.dart';
import 'auth_service.dart';

class AddProblemPage extends StatefulWidget {
  @override
  _AddProblemPageState createState() => _AddProblemPageState();
}

class _AddProblemPageState extends State<AddProblemPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final AuthService _authService = AuthService();

  void _addProblem() async {
    final problemData = {
      'title': _titleController.text,
      'description': _descriptionController.text,
    };

    final success = await _authService.addProblem(problemData);

    if (success) {
      // Handle successful problem addition
      print('Problem added successfully');
      // Navigate to another page or show success message
    } else {
      // Handle failure
      print('Failed to add problem');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Problem')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addProblem,
              child: Text('Add Problem'),
            ),
          ],
        ),
      ),
    );
  }
}

 */