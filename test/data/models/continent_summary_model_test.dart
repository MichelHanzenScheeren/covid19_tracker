import 'package:covid19_tracker_in_flutter/data/models/continent_summary_model.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/continent_summary.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/coordinate.dart';
import 'package:flutter_test/flutter_test.dart';

const model = {
  "updated": 1601507380903,
  "cases": 31235,
  "todayCases": 16,
  "deaths": 927,
  "todayDeaths": 4,
  "recovered": 28523,
  "todayRecovered": 50,
  "active": 1785,
  "critical": 22,
  "casesPerOneMillion": 761.31,
  "deathsPerOneMillion": 22.59,
  "tests": 8662763,
  "testsPerOneMillion": 211141.72,
  "population": 41028191,
  "continent": "Australia/Oceania",
  "activePerOneMillion": 43.51,
  "recoveredPerOneMillion": 695.2,
  "criticalPerOneMillion": 0.54,
  "continentInfo": {"lat": -8.6599161, "long": 91.1469847},
  "countries": [
    "Australia",
    "Fiji",
  ]
};

main() {
  test('Validação da conversão da factory ContinentSummaryModel.fromMap', () {
    final summary = ContinentSummaryModel.fromMap(model);
    expect(summary, isInstanceOf<ContinentSummaryModel>());
    expect(summary, isInstanceOf<ContinentSummary>());
    expect(summary.coordinate, isInstanceOf<Coordinate>());
    expect(summary.coordinate.latitude, isInstanceOf<double>());
    expect(summary.coordinate.longitude, isInstanceOf<double>());
    expect(summary.cases, isInstanceOf<int>());
    expect(summary.active, isInstanceOf<int>());
    expect(summary.critical, isInstanceOf<int>());
    expect(summary.deaths, isInstanceOf<int>());
    expect(summary.population, isInstanceOf<int>());
    expect(summary.recovered, isInstanceOf<int>());
    expect(summary.todayCases, isInstanceOf<int>());
    expect(summary.todayDeaths, isInstanceOf<int>());
    expect(summary.todayRecovered, isInstanceOf<int>());
    expect(summary.updatedDate, isInstanceOf<DateTime>());
    expect(summary.countries, isInstanceOf<List<String>>());
    expect(summary.continent, isInstanceOf<String>());
  });
}
