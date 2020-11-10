import 'package:covid19_tracker_in_flutter/domain/entities/historical.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/historical_item.dart';
import 'package:covid19_tracker_in_flutter/presentation/controllers/covid_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LineChartController extends GetxController {
  LineChartController(this._controller);

  static const metrics = ['Casos', 'Recuperados', 'Óbitos'];
  static const periods = ['7 dias', '30 dias', '3 meses', '6 meses', 'Tudo'];
  static const intervals = ['Acumulado', 'Novos'];

  CovidDataController _controller;
  RxBool _isLoading = true.obs;
  RxString _currentMetric = metrics[0].obs;
  RxString _currentPeriod = periods[0].obs;
  RxString _currentInterval = intervals[0].obs;
  Historical _historical;

  bool get isLoading => _isLoading.value;

  void setLoading(bool value) {
    if (value != isLoading) _isLoading.value = value;
  }

  String getCurrentMetric() => _currentMetric.value;

  void setCurrentMetric(String value) => _currentMetric.value = value;

  String getCurrentPeriod() => _currentPeriod.value;

  void setCurrentPeriod(String value) => _currentPeriod.value = value;

  String getCurrentInterval() => _currentInterval.value;

  void setCurrentInterval(String value) => _currentInterval.value = value;

  Future<bool> getChartData(String countryName) async {
    try {
      _historical = await _controller.getCountryHistorical(countryName);
      return Future.value(true);
    } catch (erro) {
      print(erro);
      return Future.value(false);
    }
  }

  List<HistoricalItem> filterMetric() {
    final metric = getCurrentMetric();
    if (metric == metrics[0]) return _historical?.cases;
    if (metric == metrics[1]) return _historical?.recovered;
    return _historical?.deaths;
  }

  List<HistoricalItem> filterPeriod(List<HistoricalItem> items) {
    int days = _getDays();
    if (days == -1) return items;
    final anteriorDate = DateTime.now().subtract(Duration(days: days + 1));
    return items?.where((e) => e.date.isAfter(anteriorDate))?.toList();
  }

  int _getDays() {
    final period = getCurrentPeriod();
    if (period == periods[0]) return 7;
    if (period == periods[1]) return 30;
    if (period == periods[2]) return 90;
    if (period == periods[3]) return 180;
    return -1;
  }

  Color getColor() {
    final metric = getCurrentMetric();
    if (metric == metrics[0]) return Colors.orange[600];
    if (metric == metrics[1]) return Colors.green[600];
    return Colors.red[600];
  }

  List<Map<String, dynamic>> seriesData() {
    List<Map<String, dynamic>> series = [];
    final interval = getCurrentInterval();
    List<HistoricalItem> data = filterPeriod(filterMetric());

    if (data == null) return series;
    for (var i = 1; i < data.length; i++) {
      final value = data[i].value;
      final anterior = data[i - 1];
      series.add({
        'x': DateFormat('dd/MM/yy').format(data[i].date),
        'y': interval == intervals[0] ? value : (value - anterior.value),
        'color': getColor(),
      });
    }
    return series;
  }
}
