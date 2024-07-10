import 'package:flutter/material.dart';

class OwnerDetailHistoryScreen extends StatefulWidget {
  const OwnerDetailHistoryScreen(
      {super.key, required this.storeId, required this.orderId});

  final String storeId;
  final String orderId;

  @override
  State<OwnerDetailHistoryScreen> createState() =>
      _OwnerDetailHistoryScreenState();
}

class _OwnerDetailHistoryScreenState extends State<OwnerDetailHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail History'),
      ),
      body: const Center(
        child: Text('Detail History'),
      ),
    );
  }
}
