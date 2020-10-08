import 'package:covid19_tracker_in_flutter/entities/historical_item.dart';

class Historical {
  List<HistoricalItem> cases;
  List<HistoricalItem> deaths;
  List<HistoricalItem> recovered;

  Historical(Map<String, dynamic> map) {
    cases = _getFrom(map['cases']);
    deaths = _getFrom(map['deaths']);
    recovered = _getFrom(map['recovered']);
  }

  List<HistoricalItem> _getFrom(List<Map<String, dynamic>> items) {
    return List<HistoricalItem>.generate(
      items.length,
      (index) => HistoricalItem(items[index]),
    );
  }
}
