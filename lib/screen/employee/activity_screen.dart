import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/model/order_history.dart';
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return CardHistory(
          history: OrderHistory(
              id: "",
              orderId: "",
              serviceName: "",
              servicePrice: 12,
              orderDate: DateTime.now(),
              orderDescription: "",
              status: ""),
          onTap: () {},
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
}
