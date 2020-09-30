import 'package:covid19_tracker_in_flutter/repositories/covid19_api.dart';
import 'package:flutter_test/flutter_test.dart';

main() async {
  group('Validação das chamadas a api do covid19 ', () {
    final covid19Api = Covid19Api();
    test('Validação da função worldSummary()', () async {
      final response = await covid19Api.worldSummary();
      expect(response, isA<Map<String, dynamic>>());
      expect(response.keys.length, equals(21));
    });
    test('Validação da função continentsSummary()', () async {
      final response = await covid19Api.continentsSummary();
      expect(response, isA<List<Map<String, dynamic>>>());
      expect(response.length, equals(6));
      expect(response[0].keys.length, equals(20));
    });
  });
}
