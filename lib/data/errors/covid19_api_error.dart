import 'package:dio/dio.dart';

enum ApiErrorType {
  INVALID_ARGUMENT,
  NETWORK_ERROR,
  RECEIVE_TIMEOUT,
  INVALID_RESPONSE,
  UNKNOWN,
}

class Covid19ApiError implements Exception {
  String _message;
  ApiErrorType _apiErrorType;

  Covid19ApiError({DioErrorType dioErrorType, ApiErrorType apiErrorType}) {
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
      case DioErrorType.SEND_TIMEOUT:
        return ApiErrorType.NETWORK_ERROR;
      case DioErrorType.RECEIVE_TIMEOUT:
        return ApiErrorType.RECEIVE_TIMEOUT;
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
      case ApiErrorType.NETWORK_ERROR:
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
