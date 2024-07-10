import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/model/order_history.dart';
import 'package:tugas_akhir_app/provider/order_history_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/card_attendance.dart';
import 'package:tugas_akhir_app/screen/widgets/card_history.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  OrderHistoryProvider? orderHistoryProvider;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    orderHistoryProvider = context.read<OrderHistoryProvider>();

    Future.microtask(() async {
      orderHistoryProvider!.refreshOrderHistory();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
        bottom: TabBar(
          controller: _tabController,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 3,
              color: Color(0xFF293869),
            ),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: const Color(0xFF293869),
          labelColor: const Color(0xFF293869),
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'History'),
            Tab(text: 'Attendance'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildHistorySection(),
          _buildAttendanceSection(),
        ],
      ),
    );
  }

  Widget _buildHistorySection() {
    return Consumer<OrderHistoryProvider>(
      builder: (context, historyProvider, child) {
        final state = historyProvider.loadingState;
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: () {
            final histories = historyProvider.orderHistories;
            if (histories.isEmpty) {
              return const Center(
                child: Text('No History'),
              );
            } else {
              return _buildListHistory(histories, historyProvider);
            }
          },
          error: (error) => Center(child: Text(error.toString())),
        );
      },
    );
  }

  Widget _buildAttendanceSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CardAttendance();
        },
      ),
    );
  }

  Widget _buildListHistory(
      List<OrderHistory> histories, OrderHistoryProvider historyProvider) {
    return ListView.builder(
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
