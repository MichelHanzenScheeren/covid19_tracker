import 'package:covid19_tracker_in_flutter/data/models/country_model.dart';
import 'package:covid19_tracker_in_flutter/domain/entities/country.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Validação gerais da classe CountryModel', () {
    test('Validação construtor padrão', () {
      CountryModel country = CountryModel('abcd', 'Brazil');
      expect(country, isInstanceOf<CountryModel>());
      expect(country, isInstanceOf<Country>());
      expect(country.id, isInstanceOf<String>());
      expect(country.id, equals('abcd'));
      expect(country.name, isInstanceOf<String>());
      expect(country.name, equals('Brazil'));
    });
    test('Validação factory fromMap', () {
      Map<String, dynamic> map = {COUNTRY_ID: 'abcd', COUNTRY_NAME: 'Brazil'};
      CountryModel country = CountryModel.fromMap(map);
      expect(country, isInstanceOf<CountryModel>());
      expect(country, isInstanceOf<Country>());
      expect(country.id, isInstanceOf<String>());
      expect(country.id, equals('abcd'));
      expect(country.name, isInstanceOf<String>());
      expect(country.name, equals('Brazil'));
    });
    test('Validação factory toMap', () {
      final model = {COUNTRY_ID: 'abcd', COUNTRY_NAME: 'Brazil'};
      CountryModel country = CountryModel('abcd', 'Brazil');
      expect(country.toMap(), equals(model));
    });
  });
}
