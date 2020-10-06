import 'package:covid19_tracker_in_flutter/repositories/api_exception.dart';
import 'package:covid19_tracker_in_flutter/repositories/covid19_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Validações gerais de findContinentSummary(String) da classe Covid19Api',
    () {
      final covid19Api = Covid19Api();
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
    },
  );
}
