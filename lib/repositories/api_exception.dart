import 'package:dio/dio.dart';

enum ApiErrorType {
  INVALID_ARGUMENT,
  CONNECT_TIMEOUT,
  SEND_TIMEOUT,
  RECEIVE_TIMEOUT,
  INVALID_RESPONSE,
  UNKNOWN,
}

class ApiException implements Exception {
  String _message;
  ApiErrorType _apiErrorType;

  ApiException({DioErrorType dioErrorType, ApiErrorType apiErrorType}) {
    _apiErrorType = _getApiErrorType(dioErrorType, apiErrorType);
    _message = _getMessage();
  }

  ApiErrorType _getApiErrorType(DioErrorType dioType, ApiErrorType apiType) {
    if (apiType != null)
      return apiType;
    else if (dioType == null) return ApiErrorType.UNKNOWN;
    return _convertFromDioError(dioType);
  }

  ApiErrorType _convertFromDioError(DioErrorType dioType) {
    switch (dioType) {
      case DioErrorType.CONNECT_TIMEOUT:
        return ApiErrorType.CONNECT_TIMEOUT;
      case DioErrorType.SEND_TIMEOUT:
        return ApiErrorType.SEND_TIMEOUT;
      case DioErrorType.RECEIVE_TIMEOUT:
        return ApiErrorType.SEND_TIMEOUT;
      case DioErrorType.RESPONSE:
        return ApiErrorType.INVALID_RESPONSE;
      default:
        return ApiErrorType.UNKNOWN;
    }
  }

  String _getMessage() {
    switch (_apiErrorType) {
      case ApiErrorType.INVALID_ARGUMENT:
        return 'Argumento Inválido.';
      case ApiErrorType.CONNECT_TIMEOUT:
      case ApiErrorType.SEND_TIMEOUT:
        return 'Não foi possível conectar-se a rede.';
      case ApiErrorType.RECEIVE_TIMEOUT:
        return 'O Servidor demorou para responder.';
      case ApiErrorType.INVALID_RESPONSE:
        return 'O servidor retornou uma resposta inválida.';
      default:
        return 'Erro desconhecido';
    }
  }

  @override
  String toString() => _message;

  ApiErrorType getType() => _apiErrorType;
}
