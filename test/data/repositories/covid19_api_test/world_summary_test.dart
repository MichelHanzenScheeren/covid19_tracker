import 'package:covid19_tracker_in_flutter/data/repositories/covid19_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Validação de worldSummary() da classe covid19Api',
    () async {
      final covid19Api = Covid19Api();
      final response = await covid19Api.worldSummary();
      expect(response, isA<Map<String, dynamic>>());
      expect(response.keys.length, equals(21));
    },
  );
}
