import 'package:covid19_tracker_in_flutter/domain/entities/coordinate.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/summary.dart';

class ContinentSummary extends Summary {
  Coordinate coordinate;
  String continent;
  List<String> countries;

  ContinentSummary(Map<String, dynamic> map) : super(map) {
    coordinate = Coordinate(map);
    continent = map['continent'];
    countries = map['countries'];
  }
}
