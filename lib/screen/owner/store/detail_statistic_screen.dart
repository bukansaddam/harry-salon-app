import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas_akhir_app/screen/widgets/bar_graph/bar_data.dart';
import 'package:tugas_akhir_app/screen/widgets/bar_graph/bar_graph.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class DetailStatisticScreen extends StatefulWidget {
  const DetailStatisticScreen({super.key});

  @override
  State<DetailStatisticScreen> createState() => _DetailStatisticScreenState();
}

class _DetailStatisticScreenState extends State<DetailStatisticScreen> {
  late DateTime firstDate;
  late DateTime lastDate;
  late String formatedfirstDate;
  late String formatedlastDate;
  late double totalValue;

  List<double> weeklyData = [];

  @override
  void initState() {
    firstDate = DateTime.now().subtract(const Duration(days: 7));
    lastDate = DateTime.now().subtract(const Duration(days: 1));
    formatedfirstDate = DateFormat('dd MMM').format(firstDate);
    formatedlastDate = DateFormat('dd MMM').format(lastDate);
    for (int i = 0; i < 7; i++) {
      weeklyData.add(Random().nextInt(90) + 10);
    }
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: SingleChildScrollView(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2020, 4, 1),
                    lastDate: DateTime.now().subtract(
                      const Duration(days: 1),
                    ),
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
                  ).then(
                    (value) => setState(
                      () {
                        if (value != null && value.duration.inDays <= 7) {
                          setState(() {
                            firstDate = value.start;
                            lastDate = value.end;
                            formatedfirstDate =
                                DateFormat('dd MMM').format(firstDate);
                            formatedlastDate =
                                DateFormat('dd MMM').format(lastDate);
                            weeklyData.clear();
                            for (int i = 0; i < 7; i++) {
                              weeklyData.add(Random().nextInt(90) + 10);
                            }
                            totalValue = weeklyData.fold(
                                0,
                                (previousValue, element) =>
                                    previousValue + element);
                          });
                        } else if (value != null) {
                          ToastMessage.show(
                            context,
                            'Date range must be less than 7 days',
                          );
                        }
                      },
                    ),
                  );
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
                '${totalValue.toInt()} Order',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF3B59BA),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Rp 1.000.000',
              style: TextStyle(
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
                    weeklyData: weeklyData,
                    weeklyDate: dates,
                    onTapedBar: (event, response, index, isPressed) {
                      if (response != null &&
                          response.spot != null &&
                          event is FlTapUpEvent) {
                        final y = response.spot!.touchedRodData.toY;
                        if (isPressed) {
                          setState(() {
                            totalValue = weeklyData.fold(
                                0,
                                (previousValue, element) =>
                                    previousValue + element);
                          });
                        } else {
                          setState(() {
                            totalValue = y.toDouble();
                          });
                        }
                      }
                    },
                    onPressed: true,
                    barWidth: 40,
                    showLeftTitles: true,
                  )
                : const Center(
                    child: Text('Data tidak lengkap, harap periksa inputan.')),
          ),
          const SizedBox(height: 16),
          const Text(
            'Order',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 4),
          const ListTile(
            title: Text('Joe Bambang'),
            leading: Icon(Icons.abc),
          ),
        ],
      ),
    );
  }
}
