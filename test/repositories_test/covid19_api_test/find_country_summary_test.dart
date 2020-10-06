import 'package:covid19_tracker_in_flutter/repositories/api_exception.dart';
import 'package:covid19_tracker_in_flutter/repositories/covid19_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Validações gerais findCountrySummary(String, Period) classe Covid19Api',
    () {
      final covid19Api = Covid19Api();
      test('Exec padrão findCountrySummary', () async {
        final response = await covid19Api.findCountrySummary(
          'Brazil',
          Period.today,
        );
        expect(response, isA<Map<String, dynamic>>());
        expect(response.keys.length, equals(23));
        expect(response['country'], equals('Brazil'));
      });
      test('Exec padrão yesterday findCountrySummary', () async {
        final response = await covid19Api.findCountrySummary(
          'Brazil',
          Period.yesterday,
        );
        expect(response, isA<Map<String, dynamic>>());
        expect(response.keys.length, equals(23));
        expect(response['country'], equals('Brazil'));
      });
      test('Exec padrão twoDaysAgo findCountrySummary', () async {
        final response = await covid19Api.findCountrySummary(
          'Brazil',
          Period.twoDaysAgo,
        );
        expect(response, isA<Map<String, dynamic>>());
        expect(response.keys.length, equals(23));
        expect(response['country'], equals('Brazil'));
      });
      test('Exec country null findCountrySummary', () async {
        final exec = () async {
          await covid19Api.findCountrySummary(null, Period.yesterday);
        };
        final type = ApiErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<ApiException>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec country vazio findCountrySummary', () async {
        final exec = () async {
          await covid19Api.findCountrySummary('', Period.yesterday);
        };
        final type = ApiErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<ApiException>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec Period null findCountrySummary', () async {
        final exec = () async {
          await covid19Api.findCountrySummary('Brazil', null);
        };
        final type = ApiErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<ApiException>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec país inválido findCountrySummary', () async {
        final exec = () async {
          await covid19Api.findCountrySummary('a', Period.today);
        };
        final type = ApiErrorType.INVALID_RESPONSE;
        expect(exec, throwsA(isInstanceOf<ApiException>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
    },
  );
}
