import 'package:covid19_tracker_in_flutter/domain/entities/continent_summary.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/country.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/summary.dart';
import 'package:covid19_tracker_in_flutter/domain/use_cases/country_use_case.dart';
import 'package:covid19_tracker_in_flutter/domain/use_cases/covid_use_case.dart';
import 'package:get/get.dart';

class CovidDataController extends GetxController {
  CovidDataController(CountryUseCase countryUC, CovidUseCase covidUC) {
    _dbUseCase = countryUC;
    _apiUseCase = covidUC;
    _loadData();
  }

  CountryUseCase _dbUseCase;
  CovidUseCase _apiUseCase;
  Rx<Summary> _worldSummary = Rx<Summary>();
  RxList<ContinentSummary> _continentSummarys = RxList<ContinentSummary>();
  RxList<Country> _favoriteCountries = RxList<Country>();

  Summary get worldSummary => _worldSummary?.value;
  List<ContinentSummary> get continentSummarys => _continentSummarys?.toList();

  void _loadData() {
    loadWorldSummary();
    loadContinentsSummary();
    loadFavoriteCountries();
  }

  void loadWorldSummary() async {
    Summary summary = await _apiUseCase.worldSummary();
    _worldSummary.value = summary;
  }

  void loadContinentsSummary() async {
    List<ContinentSummary> summarys = await _apiUseCase.continentsSummary();
    _continentSummarys.value = summarys;
  }

  void loadFavoriteCountries() async {
    final favorites = await _dbUseCase.readAll();
    _favoriteCountries.value = favorites;
  }
}
