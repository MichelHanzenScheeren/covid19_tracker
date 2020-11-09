import 'package:covid19_tracker_in_flutter/domain/entities/summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum CurrentChart { total, today }

class BarChartController extends GetxController {
  BarChartController(this.summary);

  final Summary summary;
  Rx<CurrentChart> _currentChart = CurrentChart.total.obs;

  CurrentChart getCurrentChart() => _currentChart.value;

  void setCurrentChart(CurrentChart chart) => _currentChart.value = chart;

  bool isTodayChart() => getCurrentChart() == CurrentChart.today;

  List<Map<String, dynamic>> getChartData() {
    final todayChart = isTodayChart();
    final cases = todayChart ? summary.todayCases : summary.cases;
    final recovered = todayChart ? summary.todayRecovered : summary.recovered;
    final deaths = todayChart ? summary.todayDeaths : summary.deaths;
    return [
      {'x': 'Casos', 'y': cases, 'color': Colors.orange[600]},
      {'x': 'Recuperados', 'y': recovered, 'color': Colors.green[600]},
      {'x': 'Óbitos', 'y': deaths, 'color': Colors.red[600]},
    ];
  }
}
