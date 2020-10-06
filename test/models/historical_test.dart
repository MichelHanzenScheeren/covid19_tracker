import 'package:covid19_tracker_in_flutter/models/historical.dart';
import 'package:covid19_tracker_in_flutter/models/historical_item.dart';
import 'package:flutter_test/flutter_test.dart';

const Map model = {
  "cases": {"10/3/20": 34902647, "10/4/20": 35150468},
  "deaths": {"10/3/20": 1033177, "10/4/20": 1036941},
  "recovered": {"10/3/20": 24146918, "10/4/20": 24363259}
};

void main() {
  test('Validação da factory Historical.fromMap(Map)', () {
    Historical historical = Historical.fromMap(model);
    expect(historical, isInstanceOf<Historical>());
    expect(historical.cases, isInstanceOf<List<HistoricalItem>>());
    expect(historical.deaths, isInstanceOf<List<HistoricalItem>>());
    expect(historical.recovered, isInstanceOf<List<HistoricalItem>>());
    expect(historical.cases.length, equals(2));
    expect(historical.deaths.length, equals(2));
    expect(historical.recovered.length, equals(2));
  });
}
