import 'package:covid19_tracker_in_flutter/data/errors/sqflite_error.dart';
import 'package:covid19_tracker_in_flutter/data/models/country_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String DATABASE_NAME = 'covid19_tracker_in_flutter.db';
const int DATABASE_VERSION = 1;
const String COUNTRY_TABLE = 'country_table';

class SQFliteService {
  Database _database;
  String _databasePath;

  Future<Database> getDatabase() async {
    if (_database == null) _database = await _openDatabase();
    return _database;
  }

  Future<Database> _openDatabase() async {
    try {
      return await openDatabase(
        await _getPath(),
        version: DATABASE_VERSION,
        onCreate: _createTables,
      );
    } catch (error) {
      if (error is SQFliteError) throw error;
      throw SQFliteError(type: SQFliteErrorType.open);
    }
  }

  Future<String> _getPath() async {
    try {
      if (_databasePath == null)
        _databasePath = join(await getDatabasesPath(), DATABASE_NAME);
      return _databasePath;
    } catch (error) {
      throw SQFliteError(type: SQFliteErrorType.getPath);
    }
  }

  Future _createTables(Database db, int version) async {
    try {
      await db.execute('CREATE TABLE $COUNTRY_TABLE ' +
          '($COUNTRY_ID Text PRIMARY KEY, ' +
          '$COUNTRY_NAME TEXT)');
    } catch (error) {
      throw SQFliteError(type: SQFliteErrorType.create);
    }
  }
}
