import 'package:covid19_tracker_in_flutter/data/errors/request_error.dart';
import 'package:covid19_tracker_in_flutter/data/models/country_summary_model.dart';
import 'package:covid19_tracker_in_flutter/data/repositories/covid_repository.dart';
import 'package:covid19_tracker_in_flutter/data/services/request_service.dart';
import 'package:covid19_tracker_in_flutter/domain/contracts/covid_contract.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Validações gerais findCountrySummary(String, Period) classe Covid19Api',
    () {
      final covid19Api = CovidRepository(RequestService());
      test('Exec padrão findCountrySummary', () async {
        final response = await covid19Api.findCountrySummary(
          'Brazil',
          Period.today,
        );
        expect(response, isInstanceOf<CountrySummaryModel>());
      });
      test('Exec padrão yesterday findCountrySummary', () async {
        final response = await covid19Api.findCountrySummary(
          'Brazil',
          Period.yesterday,
        );
        expect(response, isInstanceOf<CountrySummaryModel>());
      });
      test('Exec padrão twoDaysAgo findCountrySummary', () async {
        final response = await covid19Api.findCountrySummary(
          'Brazil',
          Period.twoDaysAgo,
        );
        expect(response, isInstanceOf<CountrySummaryModel>());
      });
      test('Exec country null findCountrySummary', () async {
        final exec = () async {
          await covid19Api.findCountrySummary(null, Period.yesterday);
        };
        final type = RequestErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<RequestError>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec country vazio findCountrySummary', () async {
        final exec = () async {
          await covid19Api.findCountrySummary('', Period.yesterday);
        };
        final type = RequestErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<RequestError>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec Period null findCountrySummary', () async {
        final exec = () async {
          await covid19Api.findCountrySummary('Brazil', null);
        };
        final type = RequestErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<RequestError>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec país inválido findCountrySummary', () async {
        final exec = () async {
          await covid19Api.findCountrySummary('a', Period.today);
        };
        final type = RequestErrorType.INVALID_RESPONSE;
        expect(exec, throwsA(isInstanceOf<RequestError>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
    },
  );
}
