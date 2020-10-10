import 'package:covid19_tracker_in_flutter/data/errors/covid_error.dart';
import 'package:covid19_tracker_in_flutter/data/services/request_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testes gerais service RequestService', () {
    final service = RequestService();
    test('Testando endereço válido.', () async {
      final response = await service.request('https://www.google.com/');
      expect(response, isInstanceOf<String>());
    });
    test('Testando endereço INVÁLIDO.', () async {
      final exec = () async => await service.request('abc');
      final type = CovidErrorType.UNKNOWN;
      expect(exec, throwsA(isInstanceOf<CovidError>()));
      expect(exec, throwsA(predicate((e) => e.getType() == type)));
    });
  });
}
