import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/screen/widgets/bar_graph/bar_data.dart';

class MyBarGraph extends StatefulWidget {
  final List weeklyData;
  final List<int> weeklyDate;
  final Function(FlTouchEvent event, BarTouchResponse? response,
      int? selectedBarIndex, bool isPressed) onTapedBar;
  final bool onPressed;
  final bool showLeftTitles;
  final int barWidth;

  const MyBarGraph({
    super.key,
    required this.weeklyData,
    required this.weeklyDate,
    required this.onTapedBar,
    required this.onPressed,
    this.showLeftTitles = false,
    this.barWidth = 20,
  });

  @override
  State<MyBarGraph> createState() => _MyBarGraphState();
}

class _MyBarGraphState extends State<MyBarGraph> {
  late int? selectedBarIndex;
  late bool isPressed;

  @override
  void initState() {
    selectedBarIndex = -1;
    isPressed = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      day1: widget.weeklyData[0] ?? 0,
      day2: widget.weeklyData[1] ?? 0,
      day3: widget.weeklyData[2] ?? 0,
      day4: widget.weeklyData[3] ?? 0,
      day5: widget.weeklyData[4] ?? 0,
      day6: widget.weeklyData[5] ?? 0,
      day7: widget.weeklyData[6] ?? 0,
      date: widget.weeklyDate,
    );
    myBarData.initBarData();

    return BarChart(
      BarChartData(
        minY: 0,
        maxY: 100,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: widget.showLeftTitles,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                );
              },
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: selectedBarIndex == data.x
                        ? const Color(0xFF293869)
                        : const Color(0xFF3B59BA),
                    width: widget.barWidth.toDouble(),
                    borderRadius: BorderRadius.circular(3),
                  )
                ],
              ),
            )
            .toList(),
        barTouchData: BarTouchData(
          enabled: false,
          touchCallback: (event, response) {
            setState(() {
              if (widget.onPressed) {
                if (response != null &&
                    response.spot != null &&
                    event is FlTapUpEvent) {
                  final x = response.spot!.touchedBarGroup.x;
                  isPressed = selectedBarIndex == x;
                  if (isPressed) {
                    selectedBarIndex = -1;
                    // debugPrint('not pressed');
                  } else {
                    selectedBarIndex = x;
                    // debugPrint('pressed');
                  }
                }
              }
            });
            widget.onTapedBar(event, response, selectedBarIndex, isPressed);
          },
        ),
      ),
    );
  }
}
