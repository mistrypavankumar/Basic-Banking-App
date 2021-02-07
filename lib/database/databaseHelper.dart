import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// database helper class
class DatabaseHelper {
  // database name
  static final _databaseName = "banking.db";
  static final _databaseVersion = 1;

  // table name
  static final table = "customer";

  // tables column names
  static final columnID = 'id';
  static final column_1Name = 'customerName';
  static final column_2Name = 'currentBalance';

  // a database
  static Database _database;

  //privateconstrutor
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Asking for a database
  Future<Database> get database async {
    if (_database != null) return _database;

    // create a database if one doesn't exit
    _database = await _initDatabase();
    return _database;
  }

  // function to return database
  _initDatabase() async {
    Directory documentdirecoty = await getApplicationDocumentsDirectory();
    String path = join(documentdirecoty.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // Create a database since it doesn't exit
  Future _onCreate(Database db, int version) async {
    //sql code
    await db.execute('''
        CREATE TABLE $table(
          $columnID INTEGER PRIMARY KEY,
          $column_1Name TEXT NOT NULL,
          $column_2Name INTEGER,
        );
      ''');
  }

  // function to insert data
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // function to query all the rows
  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(table);
  }
}
