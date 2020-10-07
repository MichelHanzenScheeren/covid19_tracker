import 'package:covid19_tracker_in_flutter/entities/coordinate.dart';
import 'package:covid19_tracker_in_flutter/entities/summary.dart';

class CountrySummary extends Summary {
  String country;
  String countryAbbreviation1;
  String countryAbbreviation2;
  String imageUrl;
  String continent;
  Coordinate coordinate;

  CountrySummary(Map<String, dynamic> map) : super(map) {
    country = map['country'];
    countryAbbreviation1 = map['countryAbbreviation1'];
    countryAbbreviation2 = map['countryAbbreviation2'];
    imageUrl = map['imageUrl'];
    continent = map['continent'];
    coordinate = Coordinate(map);
  }
}
