import 'package:covid19_tracker_in_flutter/domain/entities/continent_summary.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/country_summary.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/historical.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/summary.dart';

enum Period { today, yesterday, twoDaysAgo }

abstract class CovidContract {
  Future<Summary> worldSummary();

  Future<List<ContinentSummary>> continentsSummary();

  Future<ContinentSummary> findContinentSummary(String continent);

  Future<List<CountrySummary>> countriesSummary();

  Future<CountrySummary> findCountrySummary(String country, Period period);

  Future<Historical> worldHistorical(String numberOfDays);

  Future<Historical> countryHistorical(String country, String numberOfDays);
}
