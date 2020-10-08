import 'package:covid19_tracker_in_flutter/data/errors/covid19_api_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Testes gerais de instânciação e métodos de Covid19ApiError', () {
    test('instanciação Básica', () {
      final except = Covid19ApiError();
      expect(except, isInstanceOf<Covid19ApiError>());
      expect(except.getType(), equals(ApiErrorType.UNKNOWN));
      expect(except.toString(), equals('Erro desconhecido'));
    });
    test('instanciação DioErrorType.RESPONSE', () {
      final except = Covid19ApiError(dioErrorType: DioErrorType.RESPONSE);
      final message = 'O servidor retornou uma resposta inválida.';
      expect(except.getType(), equals(ApiErrorType.INVALID_RESPONSE));
      expect(except.toString(), equals(message));
    });
    test('instanciação DioErrorType.CANCEL', () {
      final except = Covid19ApiError(dioErrorType: DioErrorType.CANCEL);
      expect(except.getType(), equals(ApiErrorType.UNKNOWN));
    });
    test('instanciação DioErrorType.DEFAULT', () {
      final except = Covid19ApiError(dioErrorType: DioErrorType.DEFAULT);
      expect(except.getType(), equals(ApiErrorType.UNKNOWN));
    });
    test('instanciação DioErrorType.DEFAULT', () {
      final except = Covid19ApiError(dioErrorType: DioErrorType.SEND_TIMEOUT);
      expect(except.getType(), equals(ApiErrorType.NETWORK_ERROR));
    });
    test('instanciação DioErrorType.RECEIVE_TIMEOUT', () {
      final except =
          Covid19ApiError(dioErrorType: DioErrorType.RECEIVE_TIMEOUT);
      expect(except.getType(), equals(ApiErrorType.RECEIVE_TIMEOUT));
    });
  });
}
