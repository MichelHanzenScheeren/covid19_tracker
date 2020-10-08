import 'package:covid19_tracker_in_flutter/entities/summary.dart';

class SummaryModel extends Summary {
  SummaryModel._(Map<String, dynamic> map) : super(map);

  factory SummaryModel.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> padronized = Map.from(map);
    padronized['updated'] = DateTime.fromMillisecondsSinceEpoch(map['updated']);
    return SummaryModel._(padronized);
  }
}
