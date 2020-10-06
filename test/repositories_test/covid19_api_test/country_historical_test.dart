import 'package:covid19_tracker_in_flutter/repositories/api_exception.dart';
import 'package:covid19_tracker_in_flutter/repositories/covid19_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Validações gerais countryHistorical(String, String) classe Covid19Api',
    () {
      final covid19Api = Covid19Api();
      test('Exec parâmetros "Brazil, all" countryHistorical(String)', () async {
        final response = await covid19Api.countryHistorical('Brazil', 'all');
        expect(response, isA<Map<String, dynamic>>());
        expect(response.keys.length, equals(3));
        expect(response.keys.contains('country'), equals(true));
        expect(response.keys.contains('province'), equals(true));
        expect(response.keys.contains('timeline'), equals(true));
        expect(response['timeline'].keys.contains('cases'), equals(true));
        expect(response['timeline'].keys.contains('deaths'), equals(true));
        expect(response['timeline'].keys.contains('recovered'), equals(true));
      });
      test('Exec parâmetros "Brazil, 30" countryHistorical(String)', () async {
        final response = await covid19Api.countryHistorical('Brazil', '30');
        expect(response, isA<Map<String, dynamic>>());
        expect(response.keys.length, equals(3));
        expect(response.keys.contains('country'), equals(true));
        expect(response.keys.contains('province'), equals(true));
        expect(response.keys.contains('timeline'), equals(true));
        expect(response['timeline'].keys.contains('cases'), equals(true));
        expect(response['timeline'].keys.contains('deaths'), equals(true));
        expect(response['timeline'].keys.contains('recovered'), equals(true));
      });
      test('Exec parâmetros "null, 30" countryHistorical(String)', () async {
        final exec = () async => await covid19Api.countryHistorical(null, '30');
        final type = ApiErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<ApiException>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec parâmetros "", "30" countryHistorical(String)', () async {
        final exec = () async => await covid19Api.countryHistorical('', '30');
        final type = ApiErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<ApiException>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec parâmetros "Brazil, null" countryHistorical(String)',
          () async {
        final exec = () async {
          await covid19Api.countryHistorical('Brazil', null);
        };
        final type = ApiErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<ApiException>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec parâmetros "Brazil, b" countryHistorical(String)', () async {
        final exec = () async {
          await covid19Api.countryHistorical('Brazil', "b");
        };
        final type = ApiErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<ApiException>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec país inválido " countryHistorical(String)', () async {
        final exec = () async {
          await covid19Api.countryHistorical('B', "30");
        };
        final type = ApiErrorType.INVALID_RESPONSE;
        expect(exec, throwsA(isInstanceOf<ApiException>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
    },
  );
}
