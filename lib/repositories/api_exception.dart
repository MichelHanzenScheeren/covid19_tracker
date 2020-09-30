import 'package:dio/dio.dart';

enum ApiErrorType { INVALID_ARGUMENT }

class ApiException implements Exception {
  String _message;
  ApiErrorType _apiErrorType;
  DioErrorType _dioErrorType;

  ApiException({DioErrorType dioErrorType, ApiErrorType apiErrorType}) {
    _dioErrorType = dioErrorType;
    _apiErrorType = apiErrorType;
  }

  @override
  String toString() {
    if (_message != null) return _message;
    if (_dioErrorType == null && _apiErrorType == null)
      return 'Erro desconhecido';
    if (_apiErrorType == ApiErrorType.INVALID_ARGUMENT)
      return 'O argumento ifornecido é inválido';
    switch (_dioErrorType) {
      case DioErrorType.CONNECT_TIMEOUT:
      case DioErrorType.SEND_TIMEOUT:
        return 'Não foi possível conectar-se a rede.';
      case DioErrorType.RECEIVE_TIMEOUT:
        return 'O Servidor demorou demais para responder.';
      case DioErrorType.RESPONSE:
        return 'O servidor retornou uma resposta inválida.';
      case DioErrorType.CANCEL:
        return 'A solicitaçã foi cancelada.';
      default:
        return 'Erro desconhecido.';
    }
  }
}
