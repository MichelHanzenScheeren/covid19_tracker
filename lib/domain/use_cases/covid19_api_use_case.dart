import 'package:covid19_tracker_in_flutter/domain/contracts/covid19_api_contract.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/continent_summary.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/country_summary.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/historical.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/summary.dart';

class Covid19APiUseCase {
  Covid19ApiContract _contract;

  Covid19APiUseCase(Covid19ApiContract contract) {
    _contract = contract;
  }

  Future<Summary> worldSummary() async {
    return await _contract.worldSummary();
  }

  Future<List<ContinentSummary>> continentsSummary() async {
    return await _contract.continentsSummary();
  }

  Future<ContinentSummary> findContinentSummary(String continent) async {
    return await _contract.findContinentSummary(continent);
  }

  Future<List<CountrySummary>> countriesSummary() async {
    return await _contract.countriesSummary();
  }

  Future<CountrySummary> findCountrySummary(
    String country,
    Period period,
  ) async {
    return await _contract.findCountrySummary(country, period);
  }

  Future<Historical> worldHistorical(String numberOfDays) async {
    return await _contract.worldHistorical(numberOfDays);
  }

  Future<Historical> countryHistorical(
    String country,
    String numberOfDays,
  ) async {
    return await _contract.countryHistorical(country, numberOfDays);
  }
}
