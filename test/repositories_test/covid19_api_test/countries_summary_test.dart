import 'package:covid19_tracker_in_flutter/repositories/covid19_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Validação da função countriesSummary()',
    () async {
      final covid19Api = Covid19Api();
      final response = await covid19Api.countriesSummary();
      expect(response, isA<List<Map<String, dynamic>>>());
      expect(response[0].keys.length, equals(23));
      expect(response[0].keys.contains('country'), equals(true));
    },
  );
}
