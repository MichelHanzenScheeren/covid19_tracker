import 'package:covid19_tracker_in_flutter/models/coordinate.dart';
import 'package:covid19_tracker_in_flutter/models/summary.dart';

class ContinentSummary extends Summary {
  String continent;
  Coordinate coordinate;
  List<String> countries;

  ContinentSummary.fromMap(Map map) : super.fromMap(map) {
    continent = map["continent"];
    coordinate = Coordinate.fromMap(map["continentInfo"]);
    countries = List.from(map["countries"]);
  }
}
