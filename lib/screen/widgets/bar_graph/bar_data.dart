import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/screen/widgets/bar_graph/individual_bar.dart';

class BarData {
  final double day1;
  final double day2;
  final double day3;
  final double day4;
  final double day5;
  final double day6;
  final double day7;
  final List<int> date;

  BarData({
    required this.day1,
    required this.day2,
    required this.day3,
    required this.day4,
    required this.day5,
    required this.day6,
    required this.day7,
    required this.date,
  });

  List<IndividualBar> barData = [];

  void initBarData() {
    if (date.length >= 7) {
      barData = [
        IndividualBar(x: date[0], y: day1),
        IndividualBar(x: date[1], y: day2),
        IndividualBar(x: date[2], y: day3),
        IndividualBar(x: date[3], y: day4),
        IndividualBar(x: date[4], y: day5),
        IndividualBar(x: date[5], y: day6),
        IndividualBar(x: date[6], y: day7),
      ];
    } else {
      debugPrint('The date list has fewer than 7 elements');
    }
  }
}
