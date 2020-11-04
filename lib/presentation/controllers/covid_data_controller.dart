import 'package:covid19_tracker_in_flutter/domain/entities/continent_summary.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/summary.dart';
import 'package:covid19_tracker_in_flutter/domain/use_cases/country_use_case.dart';
import 'package:covid19_tracker_in_flutter/domain/use_cases/covid_use_case.dart';
import 'package:get/get.dart';

class CovidDataController extends GetxController {
  CountryUseCase _dbUseCase;
  CovidUseCase _apiUseCase;

  Rx<Summary> _worldSummary;
  RxList<ContinentSummary> _continentSummarys;

  CovidDataController(CountryUseCase countryUC, CovidUseCase covidUC) {
    _dbUseCase = countryUC;
    _apiUseCase = covidUC;
  }
}
