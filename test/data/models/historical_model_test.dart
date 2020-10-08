import 'package:covid19_tracker_in_flutter/data/models/historical_model.dart';
import 'package:covid19_tracker_in_flutter/entities/historical.dart';
import 'package:covid19_tracker_in_flutter/entities/historical_item.dart';
import 'package:flutter_test/flutter_test.dart';

const model1 = {
  "cases": {"10/3/20": 34902647, "10/4/20": 35150468},
  "deaths": {"10/3/20": 1033177, "10/4/20": 1036941},
  "recovered": {"10/3/20": 24146918, "10/4/20": 24363259}
};

const model2 = {
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
        HistoricalModel historical1 = HistoricalModel.fromMap(model1);
        expect(historical1, isInstanceOf<HistoricalModel>());
        expect(historical1, isInstanceOf<Historical>());
        expect(historical1.cases, isInstanceOf<List<HistoricalItem>>());
        expect(historical1.deaths, isInstanceOf<List<HistoricalItem>>());
        expect(historical1.recovered, isInstanceOf<List<HistoricalItem>>());
        expect(historical1.cases.length, equals(2));
        expect(historical1.deaths.length, equals(2));
        expect(historical1.recovered.length, equals(2));
      });
      test('Validação da Historical.fromMap(Map) model2', () {
        HistoricalModel historical2 = HistoricalModel.fromMap(model2);
        expect(historical2, isInstanceOf<HistoricalModel>());
        expect(historical2, isInstanceOf<Historical>());
        expect(historical2.cases, isInstanceOf<List<HistoricalItem>>());
        expect(historical2.deaths, isInstanceOf<List<HistoricalItem>>());
        expect(historical2.recovered, isInstanceOf<List<HistoricalItem>>());
        expect(historical2.cases.length, equals(2));
        expect(historical2.deaths.length, equals(2));
        expect(historical2.recovered.length, equals(2));
      });
    },
  );
}
