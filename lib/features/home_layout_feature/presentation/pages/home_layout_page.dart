import 'package:flutter/material.dart';

class HomeLayoutPage extends StatelessWidget {
  const HomeLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Layout Page'),
      ),
      body: const Center(
        child: Text(
          'This is the home layout page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
