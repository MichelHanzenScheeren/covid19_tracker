import 'package:covid19_tracker_in_flutter/repositories/api_exception.dart';
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
    group('Validações gerais da função findContinentSummary(String)', () {
      test('Exec padrão findContinentSummary', () async {
        final response = await covid19Api.findContinentSummary('Asia');
        expect(response, isA<Map<String, dynamic>>());
        expect(response.keys.length, equals(20));
      });
      test('Exec parâmetro null findContinentSummary', () async {
        final exec = () async => await covid19Api.findContinentSummary(null);
        final type = ApiErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<ApiException>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec parâmetro vazio findContinentSummary', () async {
        final exec = () async => await covid19Api.findContinentSummary('');
        final type = ApiErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<ApiException>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec continente inválido findContinentSummary', () async {
        final exec = () async => await covid19Api.findContinentSummary('a');
        final type = ApiErrorType.INVALID_RESPONSE;
        expect(exec, throwsA(isInstanceOf<ApiException>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
    });
  });
}
