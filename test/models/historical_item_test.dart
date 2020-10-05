import 'package:covid19_tracker_in_flutter/models/historical_item.dart';
import 'package:flutter_test/flutter_test.dart';

const String stringDate = '10/4/20';
const int number = 35150468;

void main() {
  test('Validação do construtor de HistoricalItem', () {
    HistoricalItem item = HistoricalItem(stringDate, number);
    expect(item, isInstanceOf<HistoricalItem>());
    expect(item.date, isInstanceOf<DateTime>());
    expect(item.date.toString(), equals('2020-10-04 00:00:00.000'));
    expect(item.value, isInstanceOf<int>());
  });
}
