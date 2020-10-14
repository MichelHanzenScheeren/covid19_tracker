import 'package:covid19_tracker_in_flutter/domain/entities/historical.dart';

class HistoricalModel extends Historical {
  HistoricalModel._(Map<String, dynamic> map) : super(map);

  factory HistoricalModel.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> auxMap;
    auxMap = map.containsKey('timeline') ? map['timeline'] : map;

    Map<String, dynamic> padronized = Map<String, dynamic>();
    padronized['cases'] = _getItems(Map.from(auxMap['cases']));
    padronized['deaths'] = _getItems(Map.from(auxMap['deaths']));
    padronized['recovered'] = _getItems(Map.from(auxMap['recovered']));
    return HistoricalModel._(padronized);
  }

  static List<Map<String, dynamic>> _getItems(Map<String, dynamic> map) {
    List<String> keys = map.keys.toList();
    return List<Map<String, dynamic>>.generate(
      keys.length,
      (index) {
        Map<String, dynamic> padronized = Map<String, dynamic>();
        padronized['date'] = _getDate(keys[index]);
        padronized['value'] = map[keys[index]];
        return padronized;
      },
    );
  }

  static _getDate(String stringDate) {
    List<String> splitedDate = stringDate.split("/");
    String month = splitedDate[0];
    String day = splitedDate[1];
    String year = '20${splitedDate[2]}';
    return DateTime(int.parse(year), int.parse(month), int.parse(day));
  }
}
