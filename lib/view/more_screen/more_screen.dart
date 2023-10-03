
import 'package:flutter/material.dart';
import 'package:itargs_challenge/core/app_string.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.homeAppBarString),
      ),
      body: const Center(child: Text('More Screen'),),
    );
  }
}