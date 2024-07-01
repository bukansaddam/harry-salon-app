import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/model/order.dart';
import 'package:tugas_akhir_app/provider/order_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/card_task.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  OrderProvider? orderProvider;

  @override
  void initState() {
    super.initState();

    orderProvider = context.read<OrderProvider>();

    Future.microtask(() {
      orderProvider!.refreshOrderEmployee();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: Consumer<OrderProvider>(
        builder: (context, orderProvider, child) {
          final state = orderProvider.loadingState;
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: () {
              final orders = orderProvider.orders;
              return _buildList(orders, orderProvider);
            },
            error: (error) => Center(child: Text(error.toString())),
          );
        },
      ),
    );
  }

  Widget _buildList(List<Order> orders, OrderProvider orderProvider) {
    return RefreshIndicator(
      onRefresh: () => orderProvider.refreshOrderEmployee(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return CardTasks(
              order: order,
              onDetail: () {
                context.goNamed('detail_order', pathParameters: {
                  'id': order.id.toString(),
                });
              },
              btnOnAccept: orderProvider.currentTask == null ||
                      orderProvider.currentTask!.status == 'done' && index <= 1
                  ? true
                  : false,
              onAccept: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Accept Task'),
                        content: const Text(
                            'Are you sure want to accept this task?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              orderProvider.updateStatusOrder(
                                  id: order.id, isAccepted: true);
                              context.pop();
                            },
                            child: const Text('Accept'),
                          ),
                        ],
                      );
                    });
              },
            );
          },
        ),
      ),
    );
  }
}
