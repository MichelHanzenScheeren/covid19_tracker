import 'package:covid19_tracker_in_flutter/data/errors/request_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Testes gerais de instânciação e métodos de CovidError', () {
    test('instanciação Básica', () {
      final except = RequestError();
      expect(except, isInstanceOf<RequestError>());
      expect(except.getType(), equals(RequestErrorType.UNKNOWN));
      expect(except.toString(), equals('Erro desconhecido'));
    });
    test('instanciação DioErrorType.RESPONSE', () {
      final except = RequestError(dioErrorType: DioErrorType.RESPONSE);
      final message = 'O servidor retornou uma resposta inválida.';
      expect(except.getType(), equals(RequestErrorType.INVALID_RESPONSE));
      expect(except.toString(), equals(message));
    });
    test('instanciação DioErrorType.CANCEL', () {
      final except = RequestError(dioErrorType: DioErrorType.CANCEL);
      expect(except.getType(), equals(RequestErrorType.UNKNOWN));
    });
    test('instanciação DioErrorType.DEFAULT', () {
      final except = RequestError(dioErrorType: DioErrorType.DEFAULT);
      expect(except.getType(), equals(RequestErrorType.NETWORK_ERROR));
    });
    test('instanciação DioErrorType.DEFAULT', () {
      final except = RequestError(dioErrorType: DioErrorType.SEND_TIMEOUT);
      expect(except.getType(), equals(RequestErrorType.NETWORK_ERROR));
    });
    test('instanciação DioErrorType.RECEIVE_TIMEOUT', () {
      final except = RequestError(dioErrorType: DioErrorType.RECEIVE_TIMEOUT);
      expect(except.getType(), equals(RequestErrorType.RECEIVE_TIMEOUT));
    });
  });
}
