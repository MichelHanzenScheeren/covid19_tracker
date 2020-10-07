import 'package:covid19_tracker_in_flutter/entities/historical_item.dart';

class Historical {
  List<HistoricalItem> cases;
  List<HistoricalItem> deaths;
  List<HistoricalItem> recovered;

  Historical.fromMap(Map map) {
    if (map.containsKey('timeline')) map = map['timeline'];
    cases = _getItems(map['cases']);
    deaths = _getItems(map['deaths']);
    recovered = _getItems(map['recovered']);
  }

  List<HistoricalItem> _getItems(Map<String, dynamic> mapOfItems) {
    List<String> keys = mapOfItems.keys.toList();
    return List<HistoricalItem>.generate(
      keys.length,
      (index) => HistoricalItem(keys[index], mapOfItems[keys[index]]),
    );
  }
}
