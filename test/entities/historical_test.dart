import 'package:covid19_tracker_in_flutter/entities/historical.dart';
import 'package:covid19_tracker_in_flutter/entities/historical_item.dart';
import 'package:flutter_test/flutter_test.dart';

const Map model = {
  "cases": {"10/3/20": 34902647, "10/4/20": 35150468},
  "deaths": {"10/3/20": 1033177, "10/4/20": 1036941},
  "recovered": {"10/3/20": 24146918, "10/4/20": 24363259}
};

const Map model2 = {
  "country": "Brazil",
  "province": ["mainland"],
  "timeline": {
    "cases": {"10/3/20": 4906833, "10/4/20": 4915289},
    "deaths": {"10/3/20": 145987, "10/4/20": 146352},
    "recovered": {"10/3/20": 4361108, "10/4/20": 4375354}
  }
};

void main() {
  group(
    'Validação de Historical.fromMap(Map) nos 2 casos possíveis de retorno',
    () {
      test('Validação de Historical.fromMap(Map) model1', () {
        Historical historical = Historical.fromMap(model);
        expect(historical, isInstanceOf<Historical>());
        expect(historical.cases, isInstanceOf<List<HistoricalItem>>());
        expect(historical.deaths, isInstanceOf<List<HistoricalItem>>());
        expect(historical.recovered, isInstanceOf<List<HistoricalItem>>());
        expect(historical.cases.length, equals(2));
        expect(historical.deaths.length, equals(2));
        expect(historical.recovered.length, equals(2));
      });
      test('Validação da Historical.fromMap(Map) model2', () {
        Historical historical = Historical.fromMap(model2);
        expect(historical, isInstanceOf<Historical>());
        expect(historical.cases, isInstanceOf<List<HistoricalItem>>());
        expect(historical.deaths, isInstanceOf<List<HistoricalItem>>());
        expect(historical.recovered, isInstanceOf<List<HistoricalItem>>());
        expect(historical.cases.length, equals(2));
        expect(historical.deaths.length, equals(2));
        expect(historical.recovered.length, equals(2));
      });
    },
  );
}
