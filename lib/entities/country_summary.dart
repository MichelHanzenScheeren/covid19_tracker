import 'package:covid19_tracker_in_flutter/entities/coordinate.dart';
import 'package:covid19_tracker_in_flutter/entities/summary.dart';

class CountrySummary extends Summary {
  String country;
  String countryAbbreviation1;
  String countryAbbreviation2;
  String imageUrl;
  String continent;
  Coordinate coordinate;

  CountrySummary.fromMap(Map map) : super.fromMap(map) {
    country = map['country'];
    countryAbbreviation1 = map['countryInfo']['iso2'];
    countryAbbreviation2 = map['countryInfo']['iso3'];
    imageUrl = map['countryInfo']['flag'];
    continent = map['continent'];
    coordinate = Coordinate.fromMap(map['countryInfo']);
  }
}
