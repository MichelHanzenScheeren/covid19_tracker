import 'package:covid19_tracker_in_flutter/domain/entities/country.dart';

const String COUNTRY_NAME = 'name';
const String COUNTRY_ID = 'id';

class CountryModel extends Country {
  CountryModel(String id, String name) : super(id, name);

  factory CountryModel.fromMap(Map map) {
    return CountryModel(map[COUNTRY_ID], map[COUNTRY_NAME]);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      COUNTRY_ID: id,
      COUNTRY_NAME: name,
    };
    return map;
  }
}
