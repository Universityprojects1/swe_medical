import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../widgets/bottom_nav_bar.dart';

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
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
