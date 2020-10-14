enum SQFliteErrorType {
  getPath,
  create,
  open,
  insert,
  read,
  update,
  delete,
  unknown,
}

class SQFliteError implements Exception {
  SQFliteErrorType _type;
  String _message;

  SQFliteError({SQFliteErrorType type, String message}) {
    _type = type;
    _message = message;
  }

  SQFliteErrorType getType() => _type ?? SQFliteErrorType.unknown;

  @override
  String toString() {
    return _message ?? _padronizedMessage();
  }

  String _padronizedMessage() {
    if (_type == null) return 'Erro desconhecido.';
    switch (_type) {
      case SQFliteErrorType.getPath:
        return 'Erro ao tentar obter o Path do banco de dados.';
      case SQFliteErrorType.create:
        return 'Erro ao tentar criar o banco de dados.';
      case SQFliteErrorType.open:
        return 'Erro ao tentar abrir o banco de dados.';
      case SQFliteErrorType.read:
        return 'Erro ao tentar ler os dados salvos.';
      case SQFliteErrorType.insert:
        return 'Erro ao tentar salvar as alterações.';
      case SQFliteErrorType.update:
        return 'Erro ao tentar editar um dado.';
      case SQFliteErrorType.delete:
        return 'Erro ao tentar excluir um dado.';
      case SQFliteErrorType.unknown:
      default:
        return 'Erro desconhecido.';
    }
  }
}
