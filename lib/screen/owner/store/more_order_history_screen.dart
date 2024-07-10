import 'package:flutter/material.dart';

class MoreOrderHistoryScreen extends StatefulWidget {
  const MoreOrderHistoryScreen({super.key, required this.storeId});

  final String storeId;

  @override
  State<MoreOrderHistoryScreen> createState() => _MoreOrderHistoryScreenState();
}

class _MoreOrderHistoryScreenState extends State<MoreOrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: const Center(
        child: Text('History'),
      ),
    );
  }
}
