import 'package:covid19_tracker_in_flutter/domain/contracts/country_contract.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/country.dart';

class CountryUsaCase {
  CountryContract _contract;

  CountryUsaCase(CountryContract contract) {
    _contract = contract;
  }

  Future<String> insert(String name) async {
    return await _contract.insert(name);
  }

  Future<List<Country>> readAll() async {
    return await _contract.readAll();
  }

  Future delete(String id) async {
    _contract.delete(id);
  }
}
