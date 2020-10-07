import 'package:covid19_tracker_in_flutter/data/repositories/covid19_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Validação de continentsSummary() da classe covid19Api',
    () async {
      final covid19Api = Covid19Api();
      final response = await covid19Api.continentsSummary();
      expect(response, isA<List<Map<String, dynamic>>>());
      expect(response.length, equals(6));
      expect(response[0].keys.length, equals(20));
    },
  );
}
