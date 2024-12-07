import 'package:flutter/material.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminder Page'),
      ),
      body: const Center(
        child: Text(
          'This is the reminder page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
