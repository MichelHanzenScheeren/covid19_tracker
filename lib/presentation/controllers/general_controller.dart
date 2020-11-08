import 'package:covid19_tracker_in_flutter/domain/entities/summary.dart';
import 'package:covid19_tracker_in_flutter/presentation/controllers/covid_data_controller.dart';
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
}
