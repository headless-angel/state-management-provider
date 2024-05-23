import 'package:flutter/material.dart';

class GrievancePage extends StatelessWidget {
  const GrievancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grievance'),
        backgroundColor: Colors.purple,
      ),
      body: const Align(
        child: Text(
          'Welcome',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
