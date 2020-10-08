import 'package:covid19_tracker_in_flutter/entities/continent_summary.dart';

class ContinentSummaryModel extends ContinentSummary {
  ContinentSummaryModel._(Map<String, dynamic> map) : super(map);

  factory ContinentSummaryModel.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> padronized = Map.from(map);
    padronized['updated'] = DateTime.fromMillisecondsSinceEpoch(map['updated']);
    padronized['latitude'] = map['continentInfo']['lat'] + 0.0;
    padronized['longitude'] = map['continentInfo']['long'] + 0.0;
    padronized['countries'] = List<String>.from(map['countries']);
    return ContinentSummaryModel._(padronized);
  }
}
