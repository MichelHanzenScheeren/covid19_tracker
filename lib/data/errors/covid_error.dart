import 'package:dio/dio.dart';

enum CovidErrorType {
  INVALID_ARGUMENT,
  NETWORK_ERROR,
  RECEIVE_TIMEOUT,
  INVALID_RESPONSE,
  UNKNOWN,
}

class CovidError implements Exception {
  String _message;
  CovidErrorType _apiErrorType;

  CovidError({DioErrorType dioErrorType, CovidErrorType apiErrorType}) {
    _apiErrorType = _getApiErrorType(dioErrorType, apiErrorType);
    _message = _getMessage();
  }

  CovidErrorType _getApiErrorType(
      DioErrorType dioType, CovidErrorType apiType) {
    if (apiType != null)
      return apiType;
    else if (dioType == null) return CovidErrorType.UNKNOWN;
    return _convertFromDioError(dioType);
  }

  CovidErrorType _convertFromDioError(DioErrorType dioType) {
    switch (dioType) {
      case DioErrorType.CONNECT_TIMEOUT:
      case DioErrorType.SEND_TIMEOUT:
        return CovidErrorType.NETWORK_ERROR;
      case DioErrorType.RECEIVE_TIMEOUT:
        return CovidErrorType.RECEIVE_TIMEOUT;
      case DioErrorType.RESPONSE:
        return CovidErrorType.INVALID_RESPONSE;
      default:
        return CovidErrorType.UNKNOWN;
    }
  }

  String _getMessage() {
    switch (_apiErrorType) {
      case CovidErrorType.INVALID_ARGUMENT:
        return 'Argumento Inválido.';
      case CovidErrorType.NETWORK_ERROR:
        return 'Não foi possível conectar-se a rede.';
      case CovidErrorType.RECEIVE_TIMEOUT:
        return 'O Servidor demorou para responder.';
      case CovidErrorType.INVALID_RESPONSE:
        return 'O servidor retornou uma resposta inválida.';
      default:
        return 'Erro desconhecido';
    }
  }

  @override
  String toString() => _message;

  CovidErrorType getType() => _apiErrorType;
}
