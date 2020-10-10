import 'package:covid19_tracker_in_flutter/domain/entities/country.dart';

abstract class CountryContract {
  Future<String> insert(String name);

  Future<List<Country>> readAll();

  Future delete(String id);
}
