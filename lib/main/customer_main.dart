import 'package:flutter/material.dart';
import '../config/injection.dart' as di;

void main() {
  di.init();
  runApp(const CustomerApp());
}

class CustomerApp extends StatelessWidget {
  const CustomerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Customer App'),
        ),
      ),
    );
  }
}
