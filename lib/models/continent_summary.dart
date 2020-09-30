import 'package:covid19_tracker_in_flutter/models/summary.dart';

class ContinentSummary extends Summary {
  String continent;
  List<String> countries;

  ContinentSummary.fromMap(Map map) : super.fromMap(map) {
    continent = map["continent"];
    countries = List.from(map["countries"]);
  }
}
