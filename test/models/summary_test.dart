import 'package:covid19_tracker_in_flutter/models/summary.dart';
import 'package:flutter_test/flutter_test.dart';

const sumaryModel = {
  "updated": 1601415565894,
  "cases": 33764179,
  "todayCases": 218846,
  "deaths": 1010232,
  "todayDeaths": 4094,
  "recovered": 25046685,
  "todayRecovered": 173584,
  "active": 7707262,
  "critical": 65478,
  "casesPerOneMillion": 4332,
  "deathsPerOneMillion": 129.6,
  "tests": 644671350,
  "testsPerOneMillion": 82898.29,
  "population": 7776654665,
  "oneCasePerPeople": 0,
  "oneDeathPerPeople": 0,
  "oneTestPerPeople": 0,
  "activePerOneMillion": 991.08,
  "recoveredPerOneMillion": 3220.75,
  "criticalPerOneMillion": 8.42,
  "affectedCountries": 215
};

main() {
  test('Validação da conversão da factory Summary.fromMap', () {
    final summary = Summary.fromMap(sumaryModel);
    expect(summary, isInstanceOf<Summary>());
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
  });
}
