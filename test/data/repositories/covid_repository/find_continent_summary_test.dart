import 'package:covid19_tracker_in_flutter/data/errors/request_error.dart';
import 'package:covid19_tracker_in_flutter/data/models/continent_summary_model.dart';
import 'package:covid19_tracker_in_flutter/data/repositories/covid_repository.dart';
import 'package:covid19_tracker_in_flutter/data/services/request_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Validações gerais de findContinentSummary(String) da classe Covid19Api',
    () {
      final covid19Api = CovidRepository(RequestService());
      test('Exec padrão findContinentSummary', () async {
        final response = await covid19Api.findContinentSummary('Asia');
        expect(response, isInstanceOf<ContinentSummaryModel>());
      });
      test('Exec parâmetro null findContinentSummary', () async {
        final exec = () async => await covid19Api.findContinentSummary(null);
        final type = RequestErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<RequestError>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec parâmetro vazio findContinentSummary', () async {
        final exec = () async => await covid19Api.findContinentSummary('');
        final type = RequestErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<RequestError>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec continente inválido findContinentSummary', () async {
        final exec = () async => await covid19Api.findContinentSummary('a');
        final type = RequestErrorType.INVALID_RESPONSE;
        expect(exec, throwsA(isInstanceOf<RequestError>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
    },
  );
}
