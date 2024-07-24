import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/common/order_state.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/order.dart';
import 'package:tugas_akhir_app/model/user.dart';
import 'package:tugas_akhir_app/provider/commodity_provider.dart';
import 'package:tugas_akhir_app/provider/order_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/card_task.dart';
import 'package:tugas_akhir_app/screen/widgets/timeline_tile.dart';

class DashboardEmployeeScreen extends StatefulWidget {
  const DashboardEmployeeScreen({super.key});

  @override
  State<DashboardEmployeeScreen> createState() =>
      _DashboardEmployeeScreenState();
}

class _DashboardEmployeeScreenState extends State<DashboardEmployeeScreen> {
  final _scrollController = ScrollController();
  CommodityProvider? commodityProvider;
  OrderProvider? orderProvider;
  bool _isDataFetched = false;
  AuthRepository auth = AuthRepository();
  User? user;
  Timer? _timer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isDataFetched) {
      commodityProvider = context.read<CommodityProvider>();
      orderProvider = context.read<OrderProvider>();

      Future.microtask(() async {
        user = await auth.getUser();
        if (user != null) {
          commodityProvider!.refreshCommodity(storeId: user!.storeId!);
        }

        _getUpcomingTaskRealtime();
      });

      _isDataFetched = true;
    }
  }

  Future<void> _getUpcomingTaskRealtime() async {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      orderProvider!.getOrderEmployee();
      orderProvider!.getCurrentOrderEmployee();
      debugPrint(orderProvider!.upcomingTask.toString());
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Consumer2<CommodityProvider, OrderProvider>(
          builder: (context, commodityProvider, orderProvider, child) {
            return _buildBody(context, commodityProvider, orderProvider);
          },
        ));
  }

  Widget _buildBody(BuildContext context, CommodityProvider commodityProvider,
      OrderProvider orderProvider) {
    final commodityState = commodityProvider.loadingState;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: _buildUpcomingTasksSection(orderProvider),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 16,
          )),
          SliverToBoxAdapter(
            child: _buildCurrentTasksSection(orderProvider),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 16,
          )),
          SliverToBoxAdapter(
            child: commodityState.when(
              initial: () => const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Commodity',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Center(child: CircularProgressIndicator()),
                ],
              ),
              loading: () => const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Commodity',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Center(child: CircularProgressIndicator()),
                ],
              ),
              loaded: () => _buildCommoditySection(commodityProvider),
              error: (error) => Text(error.toString()),
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 24,
          )),
        ],
      ),
    );
  }

  Widget _buildUpcomingTasksSection(OrderProvider orderProvider) {
    final orderState = orderProvider.loadingState;
    final order = orderProvider.upcomingTask;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Upcoming Tasks',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            TextButton(
              onPressed: () {
                context.goNamed('more_order');
              },
              child: const Text(
                'see more',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        orderState.when(
          initial: () => const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: () => order != null
              ? CardTasks(
                  order: order,
                  onDetail: () {
                    context.goNamed('detail_order', pathParameters: {
                      'id': order.id.toString(),
                    });
                  },
                  btnOnAccept: orderProvider.currentTask == null ||
                          orderProvider.currentTask!.status == 'done'
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
                )
              : const SizedBox(
                  height: 200,
                  child: Center(
                    child: Text('No upcoming task'),
                  ),
                ),
          error: (error) {
            if (error.toString().contains('orders')) {
              return const SizedBox(
                height: 200,
                child: Center(
                  child: Text('No upcoming task'),
                ),
              );
            } else {
              return SizedBox(
                height: 200,
                child: Center(
                  child: Text(error.toString()),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildCurrentTasksSection(OrderProvider orderProvider) {
    final order = orderProvider.currentTask;
    final status = orderProvider.orderState;
    final state = orderProvider.currentOrderLoadingState;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Current Tasks',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        state.when(
          initial: () => const SizedBox(
              height: 150,
              child: Center(
                child: CircularProgressIndicator(),
              )),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: () => order != null
              ? _buildTimelineCurrentTask(order, status)
              : _buildTimelineCurrentTask(order, status),
          error: (error) => _buildTimelineCurrentTask(order, status),
        ),
      ],
    );
  }

  Widget _buildTimelineCurrentTask(Order? order, OrderState status) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: order != null
              ? () => context.goNamed('detail_order', pathParameters: {
                    'id': order.id.toString(),
                  })
              : () {},
          child: MyTimelineTile(
            start: false,
            end: true,
            title: "Waiting for customer confirmation",
            description: order?.userName ?? '',
            enabled: order == null
                ? false
                : status == const OrderState.waiting() ||
                        status == const OrderState.onProcress() ||
                        status == const OrderState.done()
                    ? true
                    : false,
          ),
        ),
        GestureDetector(
          onTap: order != null
              ? () => context.goNamed('detail_order', pathParameters: {
                    'id': order.id.toString(),
                  })
              : () {},
          child: MyTimelineTile(
            start: true,
            end: true,
            title: "On Process",
            description: order?.serviceName ?? '',
            enabled: order == null
                ? false
                : status == const OrderState.onProcress() ||
                        status == const OrderState.done()
                    ? true
                    : false,
          ),
        ),
        GestureDetector(
          onTap: order != null
              ? () => context.goNamed('detail_order', pathParameters: {
                    'id': order.id.toString(),
                  })
              : () {},
          child: MyTimelineTile(
            start: true,
            end: true,
            title: "Done",
            description: order != null
                ? NumberFormat.currency(
                    locale: 'id',
                    symbol: 'Rp',
                    decimalDigits: 0,
                  ).format(order.servicePrice)
                : '',
            enabled: order == null
                ? false
                : status == const OrderState.done()
                    ? true
                    : false,
          ),
        )
      ],
    );
  }

  Widget _buildCommoditySection(CommodityProvider commodityProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Commodity',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            TextButton(
              onPressed: () {
                context.goNamed(
                  'more_commodity',
                  extra: user!.storeId,
                );
              },
              child: const Text(
                'see more',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 150,
          child: _buildListCommodity(commodityProvider),
        ),
      ],
    );
  }

  Widget _buildListCommodity(CommodityProvider commodityProvider) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: commodityProvider.commodities.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: InkWell(
            onTap: () {
              //do something
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    commodityProvider.commodities[index].image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  commodityProvider.commodities[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                Text(
                  'stock : ${commodityProvider.commodities[index].stock}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
