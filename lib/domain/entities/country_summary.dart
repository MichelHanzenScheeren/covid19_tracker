import 'package:covid19_tracker_in_flutter/domain/entities/coordinate.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/summary.dart';

class CountrySummary extends Summary {
  String _id;
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

  String get getId => _id;

  void setId(String newId) => _id = newId;
}
