import 'package:covid19_tracker_in_flutter/data/errors/covid19_api_error.dart';
import 'package:covid19_tracker_in_flutter/data/models/historical_model.dart';
import 'package:covid19_tracker_in_flutter/data/repositories/covid19_api.dart';
import 'package:covid19_tracker_in_flutter/data/services/request_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Validações gerais worldHistorical(String) classe Covid19Api',
    () {
      final covid19Api = Covid19Api(RequestService());
      test('Exec padrão parâmetro "all" worldHistorical', () async {
        final response = await covid19Api.worldHistorical('all');
        expect(response, isInstanceOf<HistoricalModel>());
      });
      test('Exec padrão parâmetro "30" worldHistorical', () async {
        final response = await covid19Api.worldHistorical('30');
        expect(response, isInstanceOf<HistoricalModel>());
      });
      test('Exec numberOfDays null worldHistorical', () async {
        final exec = () async => await covid19Api.worldHistorical(null);
        final type = ApiErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<Covid19ApiError>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec numberOfDays "" worldHistorical', () async {
        final exec = () async => await covid19Api.worldHistorical('');
        final type = ApiErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<Covid19ApiError>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec numberOfDays "a" worldHistorical', () async {
        final exec = () async => await covid19Api.worldHistorical('a');
        final type = ApiErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<Covid19ApiError>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec numberOfDays "0" worldHistorical', () async {
        final exec = () async => await covid19Api.worldHistorical('0');
        final type = ApiErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<Covid19ApiError>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec numberOfDays "-30" worldHistorical', () async {
        final exec = () async => await covid19Api.worldHistorical('-30');
        final type = ApiErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<Covid19ApiError>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
      test('Exec numberOfDays "1.8" worldHistorical', () async {
        final exec = () async => await covid19Api.worldHistorical('1.8');
        final type = ApiErrorType.INVALID_ARGUMENT;
        expect(exec, throwsA(isInstanceOf<Covid19ApiError>()));
        expect(exec, throwsA(predicate((e) => e.getType() == type)));
      });
    },
  );
}
