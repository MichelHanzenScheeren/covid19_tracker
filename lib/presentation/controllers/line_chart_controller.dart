import 'package:covid19_tracker_in_flutter/domain/entities/historical.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/historical_item.dart';
import 'package:covid19_tracker_in_flutter/presentation/controllers/covid_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LineChartController extends GetxController {
  LineChartController(this._controller);

  static const metrics = ['Casos', 'Recuperados', 'Óbitos'];
  static const interval = ['Acumulado', 'Novos'];

  CovidDataController _controller;
  RxBool _isLoading = true.obs;
  RxString _currentMetric = metrics[0].obs;
  RxString _currentInterval = interval[0].obs;
  Historical _historical;

  bool get isLoading => _isLoading.value;

  void setLoading(bool value) {
    if (value != isLoading) _isLoading.value = value;
  }

  String getCurrentMetric() => _currentMetric.value;

  void setCurrentMetric(String value) => _currentMetric.value = value;

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

  List<HistoricalItem> getHistoricalItems() {
    final metric = getCurrentMetric();
    if (metric == metrics[0]) return _historical.cases;
    if (metric == metrics[1]) return _historical.recovered;
    return _historical.deaths;
  }

  Color getColor() {
    final metric = getCurrentMetric();
    if (metric == metrics[0]) return Colors.orange[600];
    if (metric == metrics[1]) return Colors.green[600];
    return Colors.red[600];
  }

  List<Map<String, dynamic>> seriesData() {
    List<Map<String, dynamic>> series = List<Map<String, dynamic>>();
    List<HistoricalItem> data = getHistoricalItems();
    data.forEach(
      (item) => series.add({
        'x': DateFormat('dd/MM/yy').format(item.date),
        'y': item.value,
        'color': getColor(),
      }),
    );
    return series;
  }
}
