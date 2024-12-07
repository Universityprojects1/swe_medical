import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Page'),
      ),
      body: const Center(
        child: Text(
          'This is the chat page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
