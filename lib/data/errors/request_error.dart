import 'package:dio/dio.dart';

enum RequestErrorType {
  INVALID_ARGUMENT,
  NETWORK_ERROR,
  RECEIVE_TIMEOUT,
  INVALID_RESPONSE,
  UNKNOWN,
}

class RequestError implements Exception {
  String _message;
  RequestErrorType _apiErrorType;

  RequestError({DioErrorType dioErrorType, RequestErrorType apiErrorType}) {
    _apiErrorType = _getApiErrorType(dioErrorType, apiErrorType);
    _message = _getMessage();
  }

  RequestErrorType _getApiErrorType(
      DioErrorType dioType, RequestErrorType apiType) {
    if (apiType != null)
      return apiType;
    else if (dioType == null) return RequestErrorType.UNKNOWN;
    return _convertFromDioError(dioType);
  }

  RequestErrorType _convertFromDioError(DioErrorType dioType) {
    switch (dioType) {
      case DioErrorType.CONNECT_TIMEOUT:
      case DioErrorType.SEND_TIMEOUT:
      case DioErrorType.DEFAULT:
        return RequestErrorType.NETWORK_ERROR;
      case DioErrorType.RECEIVE_TIMEOUT:
        return RequestErrorType.RECEIVE_TIMEOUT;
      case DioErrorType.RESPONSE:
        return RequestErrorType.INVALID_RESPONSE;
      default:
        return RequestErrorType.UNKNOWN;
    }
  }

  String _getMessage() {
    switch (_apiErrorType) {
      case RequestErrorType.INVALID_ARGUMENT:
        return 'Argumento Inválido.';
      case RequestErrorType.NETWORK_ERROR:
        return 'Não foi possível conectar-se a rede.';
      case RequestErrorType.RECEIVE_TIMEOUT:
        return 'O Servidor demorou para responder.';
      case RequestErrorType.INVALID_RESPONSE:
        return 'O servidor retornou uma resposta inválida.';
      default:
        return 'Erro desconhecido';
    }
  }

  @override
  String toString() => _message;

  RequestErrorType getType() => _apiErrorType;
}
