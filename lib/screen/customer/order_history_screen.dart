import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/model/order_history.dart';
import 'package:tugas_akhir_app/provider/order_history_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/card_history.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  OrderHistoryProvider? orderHistoryProvider;

  @override
  void initState() {
    orderHistoryProvider = context.read<OrderHistoryProvider>();

    Future.microtask(() async {
      orderHistoryProvider!.refreshOrderHistory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Consumer<OrderHistoryProvider>(
        builder: (context, historyProvider, child) {
          final state = historyProvider.loadingState;
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: () {
              final histories = historyProvider.orderHistories;
              return _buildList(histories, historyProvider);
            },
            error: (error) => Center(child: Text(error.toString())),
          );
        },
      ),
    );
  }

  Widget _buildList(
      List<OrderHistory> histories, OrderHistoryProvider historyProvider) {
    return histories.isEmpty
        ? const Center(child: Text('No Orders found'))
        : ListView.builder(
            itemCount: histories.length,
            itemBuilder: (context, index) {
              final history = histories[index];
              return CardHistory(
                  history: history,
                  onTap: () {
                    context.goNamed('detail_order',
                        pathParameters: {
                          'id': history.orderId.toString(),
                        },
                        extra: 'Detail History');
                  });
            },
          );
  }
}
