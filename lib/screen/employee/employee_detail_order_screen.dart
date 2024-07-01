import 'package:flutter/material.dart';

class EmployeeDetailOrderScreen extends StatefulWidget {
  const EmployeeDetailOrderScreen({super.key, required this.orderId});

  final String orderId;

  @override
  State<EmployeeDetailOrderScreen> createState() =>
      _EmployeeDetailOrderScreenState();
}

class _EmployeeDetailOrderScreenState extends State<EmployeeDetailOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Order'),
      ),
      body: Center(
        child: Text(widget.orderId),
      ),
    );
  }
}
