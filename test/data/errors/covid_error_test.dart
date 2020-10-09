import 'package:covid19_tracker_in_flutter/data/errors/covid_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Testes gerais de instânciação e métodos de CovidError', () {
    test('instanciação Básica', () {
      final except = CovidError();
      expect(except, isInstanceOf<CovidError>());
      expect(except.getType(), equals(CovidErrorType.UNKNOWN));
      expect(except.toString(), equals('Erro desconhecido'));
    });
    test('instanciação DioErrorType.RESPONSE', () {
      final except = CovidError(dioErrorType: DioErrorType.RESPONSE);
      final message = 'O servidor retornou uma resposta inválida.';
      expect(except.getType(), equals(CovidErrorType.INVALID_RESPONSE));
      expect(except.toString(), equals(message));
    });
    test('instanciação DioErrorType.CANCEL', () {
      final except = CovidError(dioErrorType: DioErrorType.CANCEL);
      expect(except.getType(), equals(CovidErrorType.UNKNOWN));
    });
    test('instanciação DioErrorType.DEFAULT', () {
      final except = CovidError(dioErrorType: DioErrorType.DEFAULT);
      expect(except.getType(), equals(CovidErrorType.UNKNOWN));
    });
    test('instanciação DioErrorType.DEFAULT', () {
      final except = CovidError(dioErrorType: DioErrorType.SEND_TIMEOUT);
      expect(except.getType(), equals(CovidErrorType.NETWORK_ERROR));
    });
    test('instanciação DioErrorType.RECEIVE_TIMEOUT', () {
      final except = CovidError(dioErrorType: DioErrorType.RECEIVE_TIMEOUT);
      expect(except.getType(), equals(CovidErrorType.RECEIVE_TIMEOUT));
    });
  });
}
