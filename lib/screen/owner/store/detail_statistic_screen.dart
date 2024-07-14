import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/order_history_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/bar_graph/bar_data.dart';
import 'package:tugas_akhir_app/screen/widgets/bar_graph/bar_graph.dart';
import 'package:tugas_akhir_app/screen/widgets/card_history.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class DetailStatisticScreen extends StatefulWidget {
  const DetailStatisticScreen({super.key, required this.storeId});

  final String storeId;

  @override
  State<DetailStatisticScreen> createState() => _DetailStatisticScreenState();
}

class _DetailStatisticScreenState extends State<DetailStatisticScreen> {
  late DateTime firstDate;
  late DateTime lastDate;
  late String? formatedfirstDate;
  late String? formatedlastDate;
  late double totalValue;

  List<double> weeklyData = [];

  OrderHistoryProvider? orderHistoryProvider;

  @override
  void initState() {
    super.initState();
    orderHistoryProvider = context.read<OrderHistoryProvider>();

    firstDate = DateTime.now().subtract(const Duration(days: 6));
    lastDate = DateTime.now();

    formatedfirstDate = DateFormat('dd MMM').format(firstDate);
    formatedlastDate = DateFormat('dd MMM').format(lastDate);
    totalValue = 0;

    Future.microtask(() async {
      await orderHistoryProvider!.refreshOrderHistory(
        storeId: widget.storeId,
        dateStart: firstDate.toString(),
        dateEnd: lastDate.toString(),
      );
      setState(() {
        graphData(orderHistoryProvider);
      });
    });
  }

  void graphData(OrderHistoryProvider? orderHistoryProvider) {
    formatedfirstDate = DateFormat('dd MMM').format(firstDate);
    formatedlastDate = DateFormat('dd MMM').format(lastDate);
    weeklyData = orderHistoryProvider!.weeklyData;
    debugPrint('Weekly data: $weeklyData');
    totalValue =
        weeklyData.fold(0, (previousValue, element) => previousValue + element);

    List<int> dates = [];
    DateTime currentDate = firstDate;
    while (!currentDate.isAfter(lastDate)) {
      dates.add(int.parse(DateFormat('dd').format(currentDate)));
      currentDate = currentDate.add(const Duration(days: 1));
    }

    if (weeklyData.length == 7 && dates.length == 7) {
      BarData barData = BarData(
        day1: weeklyData[0],
        day2: weeklyData[1],
        day3: weeklyData[2],
        day4: weeklyData[3],
        day5: weeklyData[4],
        day6: weeklyData[5],
        day7: weeklyData[6],
        date: dates,
      );
      barData.initBarData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: SingleChildScrollView(
        child: Consumer<OrderHistoryProvider>(
          builder: (context, historyProvider, child) {
            final state = historyProvider.loadingState;
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const SizedBox(),
              loaded: () {
                graphData(historyProvider);
                return _buildBody(context, historyProvider);
              },
              error: (error) => Center(child: Text(error.toString())),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(
      BuildContext context, OrderHistoryProvider historyProvider) {
    List<int> dates = [];
    DateTime currentDate = firstDate;
    while (!currentDate.isAfter(lastDate)) {
      dates.add(int.parse(DateFormat('dd').format(currentDate)));
      currentDate = currentDate.add(const Duration(days: 1));
    }

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatSection(context, dates, historyProvider),
          _buildOrderSection(historyProvider),
        ],
      ),
    );
  }

  Column _buildStatSection(BuildContext context, List<int> dates,
      OrderHistoryProvider historyProvider) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2020, 4, 1),
                  lastDate: DateTime.now(),
                  initialDateRange: DateTimeRange(
                    start: firstDate,
                    end: lastDate,
                  ),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          surface: Colors.blue,
                          onSurface: Colors.black,
                          onSecondary: Colors.black,
                          secondary: Colors.blue,
                        ),
                      ),
                      child: child!,
                    );
                  },
                ).then((value) {
                  if (value != null && value.duration.inDays <= 7) {
                    setState(() {
                      firstDate = value.start;
                      lastDate = value.end;
                      debugPrint(firstDate.toString());
                      debugPrint(lastDate.toString());
                    });
                    historyProvider.refreshOrderHistory(
                      storeId: widget.storeId,
                      dateStart: firstDate.toString(),
                      dateEnd: lastDate.toString(),
                    );
                    historyProvider.clearSelectedDaysOrder();
                    setState(() {
                      graphData(historyProvider);
                    });
                  } else if (value != null) {
                    ToastMessage.show(
                      context,
                      'Date range must be less than 7 days',
                    );
                  }
                });
              },
              child: Text(
                '$formatedfirstDate - $formatedlastDate',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF3B59BA),
                ),
              ),
            ),
            Text(
              historyProvider.selectedDaysOrder.isNotEmpty
                  ? '${historyProvider.selectedDaysOrder.length.toInt()} Order'
                  : '${totalValue.toInt()} Order',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF3B59BA),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            NumberFormat.currency(locale: 'id', symbol: 'Rp.', decimalDigits: 0)
                .format(historyProvider.totalIncome),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color(0xFF3B59BA),
            ),
          ),
        ),
        const Center(
          child: Text('Earning total in this week'),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: (weeklyData.length == 7 && dates.length == 7)
              ? MyBarGraph(
                  weeklyData: context.watch<OrderHistoryProvider>().weeklyData,
                  weeklyDate: dates,
                  onTapedBar: (event, response, index, isPressed) {
                    if (response != null &&
                        response.spot != null &&
                        event is FlTapUpEvent) {
                      final y = response.spot!.touchedRodData.toY;
                      final x = response.spot!.touchedBarGroup.x;
                      if (isPressed) {
                        setState(() {
                          totalValue = weeklyData.fold(
                              0,
                              (previousValue, element) =>
                                  previousValue + element);
                          orderHistoryProvider!.clearSelectedDaysOrder();
                        });
                      } else {
                        debugPrint('Selected Value: $y');
                        setState(() {
                          totalValue = y.toDouble();
                          orderHistoryProvider!.getOrderByDate(date: x);
                        });
                      }
                    }
                  },
                  onPressed: true,
                  barWidth: 40,
                  showLeftTitles: true,
                )
              : const Center(
                  child: Text('Data tidak lengkap, harap periksa inputan.'),
                ),
        ),
      ],
    );
  }

  Widget _buildOrderSection(OrderHistoryProvider historyProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text(
          'Order',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 4),
        _buildListOrder(historyProvider),
      ],
    );
  }

  Widget _buildListOrder(OrderHistoryProvider historyProvider) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
          context.watch<OrderHistoryProvider>().selectedDaysOrder.isNotEmpty
              ? historyProvider.selectedDaysOrder.length
              : historyProvider.orderHistories.length,
      itemBuilder: (context, index) {
        final orderHistory =
            context.watch<OrderHistoryProvider>().selectedDaysOrder.isNotEmpty
                ? historyProvider.selectedDaysOrder[index]
                : historyProvider.orderHistories[index];
        return CardHistory(
          history: orderHistory,
          padding: false,
          onTap: () {
            context.goNamed('detail_order2',
                pathParameters: {
                  'id': widget.storeId,
                  'orderId': orderHistory.orderId,
                },
                extra: 'Detail History');
          },
        );
      },
    );
  }
}
