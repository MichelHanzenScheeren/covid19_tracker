import 'package:covid19_tracker_in_flutter/data/models/summary_model.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/summary.dart';
import 'package:flutter_test/flutter_test.dart';

const model = {
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
  test('Validação da conversão da factory SummaryModel.fromMap', () {
    final summaryModel = SummaryModel.fromMap(model);
    expect(summaryModel, isInstanceOf<SummaryModel>());
    expect(summaryModel, isInstanceOf<Summary>());
    expect(summaryModel.cases, isInstanceOf<int>());
    expect(summaryModel.active, isInstanceOf<int>());
    expect(summaryModel.critical, isInstanceOf<int>());
    expect(summaryModel.deaths, isInstanceOf<int>());
    expect(summaryModel.population, isInstanceOf<int>());
    expect(summaryModel.recovered, isInstanceOf<int>());
    expect(summaryModel.todayCases, isInstanceOf<int>());
    expect(summaryModel.todayDeaths, isInstanceOf<int>());
    expect(summaryModel.todayRecovered, isInstanceOf<int>());
    expect(summaryModel.updatedDate, isInstanceOf<DateTime>());
  });
}
