import 'package:covid19_tracker_in_flutter/repositories/covid19_api.dart';
import 'package:flutter_test/flutter_test.dart';

main() async {
  test('Validação de chamada a api para obter dados globais', () async {
    final covid19Api = Covid19Api();
    final response = await covid19Api.worldSummary();
    expect(response, isMap);
    expect(response.keys.length, equals(21));
  });
}
