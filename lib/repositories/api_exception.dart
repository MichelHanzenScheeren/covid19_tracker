enum ApiExceptions {
  timeOut,
  badNetwork,
}

class ApiException implements Exception {
  String message;
  ApiExceptions type;

  ApiException({this.message, this.type});

  @override
  String toString() {
    if (message != null) return message;
    if (type == null) return 'Erro desconhecido';
    switch (type) {
      case ApiExceptions.timeOut:
        return 'A solicitação demorou muito tempo para responser.';
      case ApiExceptions.badNetwork:
        return 'Não foi possível conectar-se a rede. Verifique sua conexão.';
      default:
        return 'Erro desconhecido';
    }
  }
}
