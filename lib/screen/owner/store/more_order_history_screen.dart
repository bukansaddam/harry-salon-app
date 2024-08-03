import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/order_history_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/card_history.dart';

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
      body: RefreshIndicator(
        onRefresh: () => context
            .read<OrderHistoryProvider>()
            .refreshOrderHistory(storeId: widget.storeId),
        child: Consumer<OrderHistoryProvider>(
            builder: (context, historyProvider, _) {
          final state = historyProvider.loadingState;
          return state.when(
              initial: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
              loaded: () {
                if (historyProvider.orderHistories.isEmpty) {
                  return const Center(
                    child: Text('No order history found'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: historyProvider.orderHistories.length,
                    itemBuilder: (context, index) {
                      return CardHistory(
                        history: historyProvider.orderHistories[index],
                        onTap: () {
                          context.goNamed('detail_order', pathParameters: {
                            'id': widget.storeId,
                            'orderId':
                                historyProvider.orderHistories[index].orderId
                          });
                        },
                      );
                    },
                  );
                }
              },
              error: (error) {
                return Center(
                  child: Text(error),
                );
              });
        }),
      ),
    );
  }
}
