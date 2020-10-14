import 'package:covid19_tracker_in_flutter/data/errors/sqflite_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testes gerais da classe SQFliteError', () {
    test('Inicialização Vazia', () {
      SQFliteError error = SQFliteError();
      expect(error, isInstanceOf<SQFliteError>());
      expect(error.getType(), equals(SQFliteErrorType.unknown));
      expect(error.toString(), equals('Erro desconhecido.'));
    });
    test('Inicialização type: SQFliteErrorType.unknown', () {
      SQFliteError error = SQFliteError(type: SQFliteErrorType.unknown);
      expect(error.getType(), equals(SQFliteErrorType.unknown));
      expect(error.toString(), equals('Erro desconhecido.'));
    });
    test('Inicialização message: "Erro."', () {
      SQFliteError error = SQFliteError(message: 'Erro.');
      expect(error.getType(), equals(SQFliteErrorType.unknown));
      expect(error.toString(), equals('Erro.'));
    });
    test('Inicialização message:"Erro." e type:SQFliteErrorType.create', () {
      SQFliteError error = SQFliteError(
        message: 'Erro.',
        type: SQFliteErrorType.create,
      );
      expect(error.getType(), equals(SQFliteErrorType.create));
      expect(error.toString(), equals('Erro.'));
    });
    test('Inicialização type:SQFliteErrorType.create', () {
      SQFliteError error = SQFliteError(
        type: SQFliteErrorType.update,
      );
      expect(error.getType(), equals(SQFliteErrorType.update));
      expect(error.toString(), equals('Erro ao tentar editar um dado.'));
    });
  });
}
