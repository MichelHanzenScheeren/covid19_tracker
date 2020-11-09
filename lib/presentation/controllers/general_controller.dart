import 'package:covid19_tracker_in_flutter/domain/entities/summary.dart';
import 'package:covid19_tracker_in_flutter/presentation/controllers/covid_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralController extends GetxController {
  GeneralController(this.dataController);

  CovidDataController dataController;
  RxString _currentSummaryName = 'Mundo'.obs;

  String get getCurrentSummaryName => _currentSummaryName.value;

  void setCurrentSummaryName(String value) {
    if (value != getCurrentSummaryName) _currentSummaryName.value = value;
  }

  List<String> get getListOfSummarys {
    if (dataController.continentSummarys == null) return ['Mundo'];

    List<String> summarys = dataController.continentSummarys
        .map((summary) => summary.continent)
        .toList();
    summarys.insert(0, 'Mundo');
    return summarys;
  }

  Summary get getCurrentSummary {
    if (getCurrentSummaryName == 'Mundo') {
      return dataController.worldSummary;
    } else {
      return dataController.continentSummarys.firstWhere(
        (e) => e.continent == getCurrentSummaryName,
        orElse: () => null,
      );
    }
  }

  Future<void> refreshData() async {
    await dataController.loadContinentsSummary();
    await dataController.loadFavoriteCountries();
    await dataController.loadWorldSummary();
  }

  List<Map<String, dynamic>> getChartData() {
    final summary = getCurrentSummary;
    final c1 = Colors.orange[600];
    final c2 = Colors.green[600];
    final c3 = Colors.red[600];
    return [
      {'x': 'Casos', 'y': summary.cases, 'color': c1},
      {'x': 'Recuperados', 'y': summary.recovered, 'color': c2},
      {'x': 'Óbitos', 'y': summary.deaths, 'color': c3},
    ];
  }
}
