import 'package:covid19_tracker_in_flutter/data/models/country_summary_model.dart';
import 'package:covid19_tracker_in_flutter/entities/coordinate.dart';
import 'package:covid19_tracker_in_flutter/entities/country_summary.dart';
import 'package:flutter_test/flutter_test.dart';

const model = {
  "updated": 1601407163738,
  "country": "Afghanistan",
  "countryInfo": {
    "_id": 4,
    "iso2": "AF",
    "iso3": "AFG",
    "lat": 33,
    "long": 65,
    "flag": "https://disease.sh/assets/img/flags/af.png"
  },
  "cases": 39254,
  "todayCases": 21,
  "deaths": 1458,
  "todayDeaths": 3,
  "recovered": 32746,
  "todayRecovered": 104,
  "active": 5050,
  "critical": 93,
  "casesPerOneMillion": 1003,
  "deathsPerOneMillion": 37,
  "tests": 110650,
  "testsPerOneMillion": 2827,
  "population": 39136711,
  "continent": "Asia",
  "oneCasePerPeople": 997,
  "oneDeathPerPeople": 26843,
  "oneTestPerPeople": 354,
  "activePerOneMillion": 129.03,
  "recoveredPerOneMillion": 836.71,
  "criticalPerOneMillion": 2.38
};

main() {
  test('Validação da conversão da factory CountrySummaryModel.fromMap', () {
    final summary = CountrySummaryModel.fromMap(model);
    expect(summary, isInstanceOf<CountrySummaryModel>());
    expect(summary, isInstanceOf<CountrySummary>());
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
    expect(summary.continent, isInstanceOf<String>());
    expect(summary.countryAbbreviation1, isInstanceOf<String>());
    expect(summary.countryAbbreviation2, isInstanceOf<String>());
    expect(summary.imageUrl, isInstanceOf<String>());
  });
}
