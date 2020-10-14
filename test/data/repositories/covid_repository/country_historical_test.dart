import 'package:covid19_tracker_in_flutter/data/errors/request_error.dart';
import 'package:covid19_tracker_in_flutter/data/models/historical_model.dart';
import 'package:covid19_tracker_in_flutter/data/repositories/covid_repository.dart';
import 'package:covid19_tracker_in_flutter/data/services/request_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Validações gerais countryHistorical(String, String) classe Covid19Api',
    () {
      final covid19Api = CovidRepository(RequestService());
      test('Exec parâmetros "Brazil, all" countryHistorical(String)', () async {
        final response = await covid19Api.countryHistorical('Brazil', 'all');
        expect(response, isInstanceOf<HistoricalModel>());
      });
      test('Exec parâmetros "Brazil, 30" countryHistorical(String)', () async {
        final response = await covid19Api.countryHistorical('Brazil', '30');
        expect(response, isInstanceOf<HistoricalModel>());
      });
      test('Exec parâmetros "null, 30" countryHistorical(String)', () async {
        final exec = () async => await covid19Api.countryHistorical(null, '30');
        final type = RequestErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<RequestError>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec parâmetros "", "30" countryHistorical(String)', () async {
        final exec = () async => await covid19Api.countryHistorical('', '30');
        final type = RequestErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<RequestError>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec parâmetros "Brazil, null" countryHistorical(String)',
          () async {
        final exec = () async {
          await covid19Api.countryHistorical('Brazil', null);
        };
        final type = RequestErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<RequestError>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec parâmetros "Brazil, b" countryHistorical(String)', () async {
        final exec = () async {
          await covid19Api.countryHistorical('Brazil', "b");
        };
        final type = RequestErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<RequestError>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec país inválido " countryHistorical(String)', () async {
        final exec = () async {
          await covid19Api.countryHistorical('B', "30");
        };
        final type = RequestErrorType.INVALID_RESPONSE;
        expect(exec, throwsA(isInstanceOf<RequestError>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
    },
  );
}
