import 'package:covid19_tracker_in_flutter/data/errors/sqflite_error.dart';
import 'package:covid19_tracker_in_flutter/data/models/country_model.dart';
import 'package:covid19_tracker_in_flutter/data/services/sqflite_service.dart';
import 'package:covid19_tracker_in_flutter/domain/contracts/country_contract.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class CountryRepository implements CountryContract {
  SQFliteService _service;

  CountryRepository(SQFliteService service) {
    _service = service;
  }

  Future<Database> _getDatabase() async => await _service.getDatabase();

  Future<String> insert(String name) async {
    try {
      final database = await _getDatabase();
      final countryModel = CountryModel(Uuid().v1(), name);
      await database.insert(COUNTRY_TABLE, countryModel.toMap());
      return countryModel.id;
    } catch (error) {
      throw _onError(error, SQFliteErrorType.insert);
    }
  }

  Future<List<CountryModel>> readAll() async {
    try {
      final database = await _getDatabase();
      final response = await database.query(COUNTRY_TABLE);
      return List.generate(
        response.length,
        (index) => CountryModel.fromMap(response[index]),
      );
    } catch (error) {
      throw _onError(error, SQFliteErrorType.read);
    }
  }

  Future delete(String id) async {
    try {
      final database = await _getDatabase();
      await database.delete(
        COUNTRY_TABLE,
        where: '$COUNTRY_ID = ?',
        whereArgs: [id],
      );
    } catch (error) {
      throw _onError(error, SQFliteErrorType.delete);
    }
  }

  SQFliteError _onError(error, SQFliteErrorType type) {
    return (error is SQFliteError) ? error : SQFliteError(type: type);
  }
}
