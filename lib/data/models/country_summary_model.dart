import 'package:covid19_tracker_in_flutter/entities/country_summary.dart';

class CountrySummaryModel extends CountrySummary {
  CountrySummaryModel._(Map<String, dynamic> map) : super(map);

  factory CountrySummaryModel.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> padronized = Map.from(map);
    padronized['updated'] = DateTime.fromMillisecondsSinceEpoch(map["updated"]);
    padronized["latitude"] = map['countryInfo']['lat'] + 0.0;
    padronized["longitude"] = map['countryInfo']['long'] + 0.0;
    padronized['countryAbbreviation1'] = map['countryInfo']['iso2'];
    padronized['countryAbbreviation2'] = map['countryInfo']['iso3'];
    padronized['imageUrl'] = map['countryInfo']['flag'];
    return CountrySummaryModel._(padronized);
  }
}
