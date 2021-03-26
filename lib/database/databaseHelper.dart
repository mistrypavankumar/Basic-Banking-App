import 'package:basic_banking_app/model/transectionDetails.dart';
import 'package:basic_banking_app/model/userData.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'bankingsystem.db'),
      onCreate: (db, version) async {
        await db.execute("""CREATE TABLE userDetails(
              id INTEGER PRIMARY KEY,
              userName TEXT, 
              cardNumber VARCHAR,
              totalAmount DOUBLE,

            )""");
        await db.execute("""CREATE TABLE transections(
              id INTEGER PRIMARY KEY,
              transectionId INTEGER, 
              userName TEXT, 
              transectionAmount DOUBLE,
              transectionDone INTEGER,
          )""");

        return db;
      },
      version: 1,
    );
  }

  Future<int> insertUserDetails(UserData userData) async {
    int transectionId = 0;
    Database _db = await database();
    await _db
        .insert('userDetails', userData.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace)
        .then((value) {
      transectionId = value;
    });
    return transectionId;
  }

  Future<int> insertTransectionHistroy(
      TransectionDetails transectionDetails) async {
    int transectionId = 0;
    Database _db = await database();
    await _db
        .insert('transections', transectionDetails.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace)
        .then((value) {
      transectionId = value;
    });
    return transectionId;
  }

  Future<void> updateTotalAmount(int id, String totalAmount) async {
    Database _db = await database();
    await _db.rawUpdate(
        "UPDATE userDetails SET totalAmount = '$totalAmount' WHERE id = '$id'");
  }

  Future<List<UserData>> getUserDetails() async {
    Database _db = await database();
    List<Map<String, dynamic>> userMap = await _db.query('userDetails');
    return List.generate(userMap.length, (index) {
      return UserData(
        id: userMap[index]['id'],
        userName: userMap[index]['userName'],
        cardNumber: userMap[index]['cardNumber'],
        totalAmount: userMap[index]['totalAmount'],
      );
    });
  }

  Future<List<TransectionDetails>> getTransectionDetatils(
      int transectionId) async {
    Database _db = await database();
    List<Map<String, dynamic>> trasectionMap = await _db
        .rawQuery("SELECT * FROM todo WHERE transectionId = $transectionId");
    return List.generate(trasectionMap.length, (index) {
      return TransectionDetails(
          id: trasectionMap[index]['id'],
          userName: trasectionMap[index]['userName'],
          transectionId: trasectionMap[index]['transectionId'],
          transectionDone: trasectionMap[index]['transectionDone']);
    });
  }

  Future<void> updateTransectionIsDone(int id, int transectionDone) async {
    Database _db = await database();
    await _db.rawUpdate(
        "UPDATE transections SET transectionDone = '$transectionDone' WHERE id = '$id'");
  }
}
