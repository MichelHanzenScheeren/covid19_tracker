import 'package:covid19_tracker_in_flutter/data/repositories/api_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Testes gerais de instânciação e métodos de ApiException', () {
    test('instanciação Básica', () {
      final except = ApiException();
      expect(except, isInstanceOf<ApiException>());
      expect(except.getType(), equals(ApiErrorType.UNKNOWN));
      expect(except.toString(), equals('Erro desconhecido'));
    });
    test('instanciação DioErrorType.RESPONSE', () {
      final except = ApiException(dioErrorType: DioErrorType.RESPONSE);
      final message = 'O servidor retornou uma resposta inválida.';
      expect(except.getType(), equals(ApiErrorType.INVALID_RESPONSE));
      expect(except.toString(), equals(message));
    });
    test('instanciação DioErrorType.CANCEL', () {
      final except = ApiException(dioErrorType: DioErrorType.CANCEL);
      expect(except.getType(), equals(ApiErrorType.UNKNOWN));
    });
    test('instanciação DioErrorType.DEFAULT', () {
      final except = ApiException(dioErrorType: DioErrorType.DEFAULT);
      expect(except.getType(), equals(ApiErrorType.UNKNOWN));
    });
    test('instanciação DioErrorType.DEFAULT', () {
      final except = ApiException(dioErrorType: DioErrorType.SEND_TIMEOUT);
      expect(except.getType(), equals(ApiErrorType.NETWORK_ERROR));
    });
    test('instanciação DioErrorType.RECEIVE_TIMEOUT', () {
      final except = ApiException(dioErrorType: DioErrorType.RECEIVE_TIMEOUT);
      expect(except.getType(), equals(ApiErrorType.RECEIVE_TIMEOUT));
    });
  });
}
